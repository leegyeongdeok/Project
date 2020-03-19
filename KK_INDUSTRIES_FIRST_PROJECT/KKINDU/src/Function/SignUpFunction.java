package Function;

import Controller.SignUpController;
import DAO.SignUpDAO;
import javafx.scene.control.Alert;
import javafx.scene.control.ButtonType;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;



public class SignUpFunction {
	private static SignUpController sc;
	private static SignUpDAO dao = SignUpDAO.getInstance();
	private static Alert alert;
	
	// PW match check
	public void pwMatchChecker(boolean match) {
		if(match = false) {
			alert = new Alert(AlertType.CONFIRMATION);
			alert = new Alert(AlertType.WARNING);
			alert.setTitle("confirm");
			alert.setHeaderText("password and confirm not equal");
			alert.setContentText("Those passwords didn't match");
			alert.show();
		}
		
	}
	
	// execute duplicateChecker  
	public void executeDuplicateChecker(boolean executeDuplicate) {
		if(executeDuplicate = false) {
			alert = new Alert(AlertType.CONFIRMATION);
			alert = new Alert(AlertType.WARNING);
			alert.setTitle("Duplicate Check");
			alert.setHeaderText("Duplicate Check");
			alert.setContentText("you didn't duplicate check");
			alert.show();
		}
	}
	
	// check duplicate ID
	public void duplicateIDChecker(TextField tfID, Label laDupli_check) {
		boolean val = dao.checkID(tfID.getText());
		
		Alert alert = new Alert(AlertType.CONFIRMATION);
		alert.setTitle("Duplicate Check");
		laDupli_check.setText("");
		
		if(val == true) {
			alert.setHeaderText("ID is Available to use");
			alert.showAndWait();
		}
		
		if(val == false) {
			tfID.clear();
			alert.setHeaderText("ID is a Duplicate ID");
			alert.showAndWait();
		}
		
	}
	
	//check duplicate Employee_no 
	public boolean duplicateEmployeeChecker(TextField tfEmployee) {
		boolean val = dao.checkID(tfEmployee.getText());
		Alert alert = new Alert(AlertType.CONFIRMATION);
		alert.setTitle("Duplicate Check");
		
		if(val == false) {
			tfEmployee.clear();
			alert.setHeaderText("This Employee_Number already has an ID");
			alert.setHeaderText("If you have lost your ID, please contact your administrator.");
			alert.showAndWait();
		}
		
		return val;
	}
	
	public void RunSignUp(TextField tfID, TextField tfPW,TextField tfPWConfirm, ComboBox<String> cmbDepart ,TextField tfEmployee) {
		alert = new Alert(AlertType.CONFIRMATION);
		alert.setTitle("Information");
		alert.setHeaderText("Would you like to sign up with the following content?");
		alert.setContentText("ID: " + tfID.getText() + "\n" + "PW: " +tfPW.getText() + "\n" + "Department: "
				+ cmbDepart.getValue().toString() + "\n" + "Employee_Number: " + tfEmployee.getText() + "\n");
		alert.showAndWait();
		if (alert.getResult() == ButtonType.OK) {

			dao.insert(tfID.getText(), tfPW.getText(), cmbDepart.getValue().toString(), tfEmployee.getText());
			Stage s = (Stage) tfID.getScene().getWindow();
			s.close();

		} else {
			tfID.clear();
			tfPW.clear();
			tfPWConfirm.clear();
			cmbDepart.setValue(null);
			tfEmployee.clear();
		}
	}
}
	
	
	


