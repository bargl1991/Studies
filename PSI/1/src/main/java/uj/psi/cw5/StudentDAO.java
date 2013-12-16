package uj.psi.cw5;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
	private static StudentDAO dao = null;

	private StudentDAO() {

	}

	public static StudentDAO newInstance() {
		if (dao == null)
			dao = new StudentDAO();
		return dao;
	}

	public void insertStudent(Student student) {
		Connection connection = SQLiteConnectionFactory.newConnection();
		try {
			PreparedStatement statement = connection
					.prepareStatement("insert into student values(?,?,?)");
			statement.setInt(1, student.getId());
			statement.setString(2, student.getFirstName());
			statement.setString(3, student.getLastName());
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateStudent(Student student) {
		Connection connection = SQLiteConnectionFactory.newConnection();
		try {
			PreparedStatement statement = connection
					.prepareStatement("update student set first_name=? where id=?");
			statement.setInt(2, student.getId());
			statement.setString(1, student.getFirstName());
			// statement.setString(2, student.getLastName());
			statement.executeUpdate();
			statement = connection
					.prepareStatement("update student set last_name=? where id=?");
			statement.setInt(2, student.getId());
			statement.setString(1, student.getLastName());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteStudent(Student student) {
		Connection connection = SQLiteConnectionFactory.newConnection();
		try {
			PreparedStatement statement = connection
					.prepareStatement("delete from student where id=?");
			statement.setInt(1, student.getId());
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Student> getAllStudents() {
		Connection con = SQLiteConnectionFactory.newConnection();
		List<Student> lista = new ArrayList<Student>();
		Statement stmt;
		try {
			stmt = con.createStatement(ResultSet.TYPE_FORWARD_ONLY,
					ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery("select * from student");
			while (rs.next()) {
				lista.add(new Student(rs.getString(2), rs.getString(3), rs
						.getInt(1)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista;
	}

	public List<Student> getAllStudentsByLastNamePrefix(String lastPrefix) {
		Connection con = SQLiteConnectionFactory.newConnection();
		List<Student> lista = new ArrayList<Student>();
		Statement stmt;
		try {
			stmt = con.createStatement(ResultSet.TYPE_FORWARD_ONLY,
					ResultSet.CONCUR_READ_ONLY);
			PreparedStatement statement = con
					.prepareStatement("select * from student where last_name LIKE ?");
			statement.setString(1, lastPrefix + '%');
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				lista.add(new Student(rs.getString(2), rs.getString(3), rs
						.getInt(1)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista;
	}
}
