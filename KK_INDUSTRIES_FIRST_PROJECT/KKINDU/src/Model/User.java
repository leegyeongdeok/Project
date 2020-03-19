package Model;

import javafx.beans.property.SimpleStringProperty;

public class User {
	private SimpleStringProperty id;
	private SimpleStringProperty pw;
	private SimpleStringProperty banned;
	private SimpleStringProperty name;
	private SimpleStringProperty employeeNo;
	private SimpleStringProperty department;
	private SimpleStringProperty position;

	
	public User() {
		this.id = new SimpleStringProperty();
		this.pw = new SimpleStringProperty();
		this.banned = new SimpleStringProperty();
		this.name = new SimpleStringProperty();
		this.employeeNo = new SimpleStringProperty();
		this.department = new SimpleStringProperty();
		this.position = new SimpleStringProperty();
	}
	
	public User(String id, String pw, String ban, String name, String emno, String depart, String pos) {
		this.id = new SimpleStringProperty(id);
		this.pw = new SimpleStringProperty(pw);
		this.banned = new SimpleStringProperty(ban);
		this.name = new SimpleStringProperty(name);
		this.employeeNo = new SimpleStringProperty(emno);
		this.department = new SimpleStringProperty(depart);
		this.position = new SimpleStringProperty(pos);
	}

	public String getId() {
		return id.get();
	}

	public void setId(String id) {
		this.id.set(id);
	}

	public String getPw() {
		return pw.get();
	}

	public void setPw(String pw) {
		this.pw.set(pw);;
	}

	public String getBanned() {
		return banned.get();
	}

	public void setBanned(String banned) {
		this.banned.set(banned);
	}

	public String getName() {
		return name.get();
	}

	public void setName(String name) {
		this.name.set(name);
	}

	public String getEmployeeNo() {
		return employeeNo.get();
	}

	public void setEmployeeNo(String employeeNo) {
		this.employeeNo.set(employeeNo);
	}

	public String getDepartment() {
		return department.get();
	}

	public void setDepartment(String department) {
		this.department.set(department);
	}

	public String getPosition() {
		return position.get();
	}

	public void setPosition(String position) {
		this.position.set(position);
	}
	
	
}

