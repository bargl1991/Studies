package uj.psi.cw5;

import java.util.List;

public class Main {

	public static void czytaj(List<Student> t){
		for (int i = 0; i < t.size(); i++)
			System.out.print(t.get(i).toString() + " ");
		System.out.println();
	}
	
	public static void main(String[] args) {
		SQLiteDatabaseSetup.databaseSetup();
		StudentDAO dao = StudentDAO.newInstance();
		List<Student> list = dao.getAllStudents();
		System.out.println("After setup:");
		czytaj(list);
		dao.insertStudent(new Student("Henryk", "Walezy", 3));
		list = dao.getAllStudents();
		System.out.println("After insert:");
		System.out.println(list);
		dao.deleteStudent(new Student(null, null, 1));
		System.out.println("After delete:");
		list = dao.getAllStudents();
		System.out.println(list);
		dao.updateStudent(new Student("August", "Sas", 2));
		System.out.println("After update:");
		list = dao.getAllStudents();
		System.out.println(list);
		String prefix = "S";
		list = dao.getAllStudentsByLastNamePrefix(prefix);
		System.out.println("Last name starts with " + prefix + ":");
		System.out.println(list);

	}

}
