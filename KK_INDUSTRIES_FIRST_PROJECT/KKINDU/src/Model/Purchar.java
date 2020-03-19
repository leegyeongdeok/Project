package Model;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

public class Purchar {
	
	private SimpleStringProperty day;
	private SimpleIntegerProperty num;
	private SimpleStringProperty type;
	private SimpleStringProperty code;
	private SimpleIntegerProperty quantity;
	private SimpleIntegerProperty unit;
	private SimpleIntegerProperty supply;
	private SimpleIntegerProperty vat;
	private SimpleStringProperty client;
	private SimpleStringProperty kind;
	private SimpleStringProperty journal;
	

	public Purchar() {
		this.day = new SimpleStringProperty();
		this.num = new SimpleIntegerProperty();
		this.type = new SimpleStringProperty();
		this.code = new SimpleStringProperty();
		this.quantity = new SimpleIntegerProperty();
		this.unit = new SimpleIntegerProperty();
		this.supply = new SimpleIntegerProperty();
		this.vat = new SimpleIntegerProperty();
		this.client = new SimpleStringProperty();
		this.kind = new SimpleStringProperty();
		this.journal = new SimpleStringProperty();
		
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

	public String getType() {
		return type.get();
	}

	public void setType(String type) {
		this.type.set(type);
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

	public String getKind() {
		return kind.get();
	}

	public void setKind(String kind) {
		this.kind.set(kind);
	}
	
	public int getQuantity() {
		return quantity.get();
	}

	public void setQuantity(int quantity) {
		this.quantity.set(quantity);
	}


	public int getUnit() {
		return unit.get();
	}

	public void setUnit(int unit) {
		this.unit.set(unit);
	}

	public int getSupply() {
		return supply.get();
	}

	public void setSupply(int supply) {
		this.supply.set(supply);
	}
	
	public int getVat() {
		return vat.get();
	}

	public void setVat(int vat) {
		this.vat.set(vat);
	}
	
	public String getJournal() {
		return journal.get();
	}

	public void setJournal(String journal) {
		this.journal.set(journal);
	}
	
}
