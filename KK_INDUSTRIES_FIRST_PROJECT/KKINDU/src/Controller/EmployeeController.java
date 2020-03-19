package Controller;

import java.net.URL;
import java.util.ResourceBundle;
import DAO.PersonnelDAO;
import Function.PersonnelFunction;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.layout.Pane;

public class EmployeeController implements Initializable {

	@FXML
	private Label laEmpDay;
	@FXML
	private Label laPro;
	@FXML
	private TextField txtAnnual;
	@FXML
	private TextField txtDepart;
	@FXML
	private TextField txtPosition;
	@FXML
	private Label laProject;
	@FXML
	private TextField txtWorkDay;
	@FXML
	private TextArea txtOther;
	@FXML
	private CheckBox ckbFour;
	@FXML
	private CheckBox ckbHealth;
	@FXML
	private CheckBox ckbNation;
	@FXML private Button btnLoad;
	@FXML private Button btnUpdate;

	private static PersonnelDAO dao = new PersonnelDAO();
	private static PersonnelFunction pf = new PersonnelFunction();

	public void initialize(URL location, ResourceBundle resources) {
		String depart = pf.getDepart();
		if(depart.equals("Development") || depart.equals("Master")) {
			dao.fillInfoEmp(laEmpDay, txtDepart, txtPosition, txtWorkDay, txtAnnual, laProject, txtOther, ckbFour, ckbHealth, ckbNation);
			
		}else {
			dao.fillInfoEmpNotDe(laEmpDay, txtDepart, txtPosition, txtWorkDay, txtAnnual, txtOther, ckbFour, ckbHealth, ckbNation);
			laPro.setVisible(false);
		}
		txtAnnual.setDisable(true);
		txtDepart.setDisable(true);
		txtOther.setDisable(true);
		txtPosition.setDisable(true);
		txtWorkDay.setDisable(true);
		ckbFour.setDisable(true);
		ckbHealth.setDisable(true);
		ckbNation.setDisable(true);
		btnLoad.setDisable(true);
		btnUpdate.setOnAction(event -> Update(event));
		btnLoad.setOnAction(event -> Load(event));
	}
	
	public void Update(ActionEvent e) {
		String depart = pf.getDepart();
		if(!depart.equals("Master")) {
			txtDepart.setDisable(false);
			txtOther.setDisable(false);
			txtPosition.setDisable(false);
			txtWorkDay.setDisable(false);
			btnLoad.setDisable(false);
			btnUpdate.setDisable(true);
		}else {
			Alert alert = new Alert(AlertType.WARNING);
			alert.setTitle("Warning");
			alert.setHeaderText("Unable to modify");
			alert.setContentText("You cannot modify the information in Master");
			alert.showAndWait();
		}
	}
	
	public void Load(ActionEvent e) {
		pf.LoadEmp(txtDepart, txtPosition, txtWorkDay, txtOther);
		dao.fillInfoEmp(laEmpDay, txtDepart, txtPosition, txtWorkDay, txtAnnual, laProject, txtOther, ckbFour, ckbHealth, ckbNation);
		txtDepart.setDisable(true);
		txtOther.setDisable(true);
		txtPosition.setDisable(true);
		txtWorkDay.setDisable(true);
		btnLoad.setDisable(true);
		btnUpdate.setDisable(false);
	}

}
