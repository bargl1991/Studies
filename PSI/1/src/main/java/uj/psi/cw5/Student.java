package uj.psi.cw5;

public class Student {

	private String firstName;
	private String lastName;
	private int id;

	public Student(String x, String y, int z) {
		this.firstName = x;
		this.lastName = y;
		this.id = z;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public int getId() {
		return id;
	}
	public String toString(){
		return "id : " + id + " FN : " + firstName + " LN : " + lastName + " ";
	}
}
