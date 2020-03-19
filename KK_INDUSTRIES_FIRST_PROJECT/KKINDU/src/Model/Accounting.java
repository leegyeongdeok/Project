package Model;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

public class Accounting {
	
	private SimpleStringProperty day;
	private SimpleIntegerProperty num;
	private SimpleStringProperty classf;
	private SimpleStringProperty code;
	private SimpleStringProperty client;
	private SimpleStringProperty description;
	private SimpleIntegerProperty debit;
	private SimpleIntegerProperty credit;

	public Accounting() {
		this.day = new SimpleStringProperty();
		this.num = new SimpleIntegerProperty();
		this.classf = new SimpleStringProperty();
		this.code = new SimpleStringProperty();
		this.client = new SimpleStringProperty();
		this.description = new SimpleStringProperty();
		this.debit = new SimpleIntegerProperty();
		this.credit = new SimpleIntegerProperty();
	}

	public String getDay() {
		return day.get();
	}

	public void setDay(String day) {
		this.day.set(day);
	}

	public int getNum() {
		return num.get();
	}

	public void setNum(int num) {
		this.num.set(num);
	}

	public String getClassf() {
		return classf.get();
	}

	public void setClassf(String classf) {
		this.classf.set(classf);
	}

	public String getCode() {
		return code.get();
	}

	public void setCode(String code) {
		this.code.set(code);
	}

	public String getClient() {
		return client.get();
	}

	public void setClient(String client) {
		this.client.set(client);
	}

	public String getDescription() {
		return description.get();
	}

	public void setDescription(String description) {
		this.description.set(description);
	}

	public int getDebit() {
		return debit.get();
	}

	public void setDebit(int debit) {
		this.debit.set(debit);
	}

	public int getCredit() {
		return credit.get();
	}

	public void setCredit(int credit) {
		this.credit.set(credit);
	}
}
