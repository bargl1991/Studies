package uj.psi.cw5;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLiteDatabaseSetup {
	
	/*
	 * run database and do very simple query
	 */
	public static void databaseSetup() {
		
		Connection connection = new SQLiteConnectionFactory().newConnection();
		try {
			Statement statement = connection.createStatement();
			statement.executeUpdate("drop table if exists student");
			statement.executeUpdate("create table student (id integer, first_name string, "
					+ " last_name string)");
			statement.executeUpdate("insert into student values(1, 'Mieszko', 'Pierwszy')");
			statement.executeUpdate("insert into student values(2, 'Stefan','Batory')");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			new SQLiteConnectionFactory().closeQuietly(connection);
		}
		
	}
}
