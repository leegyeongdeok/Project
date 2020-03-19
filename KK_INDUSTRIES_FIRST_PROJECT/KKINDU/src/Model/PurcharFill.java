package Model;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

public class PurcharFill {
	
	private SimpleStringProperty day;
	private SimpleStringProperty type;
	private SimpleStringProperty code;
	private SimpleIntegerProperty supply;
	private SimpleIntegerProperty vat;
	private SimpleIntegerProperty consumer;

	public PurcharFill() {
		this.day = new SimpleStringProperty();
		this.type = new SimpleStringProperty();
		this.code = new SimpleStringProperty();
		this.supply = new SimpleIntegerProperty();
		this.vat = new SimpleIntegerProperty();
		this.consumer = new SimpleIntegerProperty();
		
	}

	public String getDay() {
		return day.get();
	}

	public void setDay(String day) {
		this.day.set(day);
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
	
	public int getConsumer() {
		return consumer.get();
	}

	public void setConsumer(int consumer) {
		this.consumer.set(consumer);
	}
	
}
