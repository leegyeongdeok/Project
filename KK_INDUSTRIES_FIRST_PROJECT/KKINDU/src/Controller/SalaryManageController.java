package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import DAO.SalaryDAO;
import Function.PersonnelFunction;
import Function.SalaryManageFunction;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;

public class SalaryManageController implements Initializable {

	@FXML
	private Label laEmpNo;
	@FXML
	private Label laDepart;
	@FXML
	private Label laNa;
	@FXML
	private Label laPos;
	@FXML
	private TextField txtBank;
	@FXML
	private TextField txtSal;
	@FXML
	private TextField txtBo;
	@FXML
	private Label laTax;
	@FXML
	private TextField txtAcc;
	@FXML
	private CheckBox ckbFour;
	@FXML
	private CheckBox ckbHealth;
	@FXML
	private CheckBox ckbNation;
	@FXML
	private Button btnLoad;
	@FXML
	private Button btnUpdate;
	private static SalaryManageFunction sf = new SalaryManageFunction();
	private static PersonnelFunction pf = new PersonnelFunction();
	private static SalaryDAO dao = new SalaryDAO();

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		dao.set(laEmpNo, laDepart, laNa, laPos, txtBank, txtAcc, txtSal, txtBo, laTax, ckbFour, ckbHealth, ckbNation);
		txtAcc.setDisable(true);
		txtBo.setDisable(true);
		txtSal.setDisable(true);
		txtBank.setDisable(true);
		btnLoad.setDisable(true);
		ckbFour.setDisable(true);
		ckbHealth.setDisable(true);
		ckbNation.setDisable(true);
		btnUpdate.setOnAction(event -> btnUpdate(event));
		btnLoad.setOnAction(event -> btnLoad(event));
	}

	public void btnUpdate(ActionEvent e) {
		if(!pf.getWorkerNo().substring(0, 1).equals("M")) {
			
			txtAcc.setDisable(false);
			txtBo.setDisable(false);
			txtSal.setDisable(false);
			txtBank.setDisable(false);
			btnLoad.setDisable(false);
			btnUpdate.setDisable(true);
			ckbFour.setDisable(false);
			ckbHealth.setDisable(false);
			ckbNation.setDisable(false);
		}else {
			Stage s = (Stage)txtAcc.getScene().getWindow();
			s.close();
			Alert alert = new Alert(AlertType.WARNING);
			alert.setTitle("Warning");
			alert.setHeaderText("Unable to modify");
			alert.setContentText("You cannot modify the information in Master");
			alert.showAndWait();
		}
		
	}

	public void btnLoad(ActionEvent e) {
		dao.updateSal(txtBank, txtSal, txtBo, laTax, txtAcc, ckbFour, ckbHealth, ckbNation);
		dao.set(laEmpNo, laDepart, laNa, laPos, txtBank, txtAcc, txtSal, txtBo, laTax, ckbFour, ckbHealth, ckbNation);
		txtAcc.setDisable(true);
		txtBo.setDisable(true);
		txtSal.setDisable(true);
		txtBank.setDisable(true);
		btnLoad.setDisable(true);
		btnUpdate.setDisable(false);
		ckbFour.setDisable(true);
		ckbHealth.setDisable(true);
		ckbNation.setDisable(true);
	}

}
