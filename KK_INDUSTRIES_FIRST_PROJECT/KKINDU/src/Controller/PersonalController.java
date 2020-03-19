package Controller;

import java.net.URL;
import java.util.ResourceBundle;
import DAO.PersonnelDAO;
import Function.PersonnelFunction;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.input.MouseEvent;

public class PersonalController implements Initializable {
	
	@FXML private Label laEmno;
	@FXML private Label laname;
	@FXML private TextField txtRrno;
	@FXML private Label laGender;
	@FXML private TextField txtPhone;
	@FXML private TextField txtAdd;
	@FXML private TextField txtAccount;
	@FXML private TextField txtBank;
	@FXML private TextArea txtAcademic;
	@FXML private Button btnLoad;
	@FXML private Button btnUpdate;
	
	private static PersonnelDAO dao = new PersonnelDAO();
	private static PersonnelFunction pf = new PersonnelFunction();
	
	
	
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		
		dao.fillInfoPer(laEmno, laname, laGender, txtRrno, txtPhone, txtAdd, txtBank, txtAccount, txtAcademic);
		txtAcademic.setDisable(true);
		txtAccount.setDisable(true);
		txtAdd.setDisable(true);
		txtBank.setDisable(true);
		txtPhone.setDisable(true);
		txtRrno.setDisable(true);
		btnLoad.setDisable(true);
		btnUpdate.setOnAction(event -> Update(event));
		btnLoad.setOnAction(event -> Load(event));
	}
	
	public void Update(ActionEvent e) {
		String depart = pf.getDepart();
		if(!depart.equals("Master")) {
			txtAcademic.setDisable(false);
			txtAdd.setDisable(false);
			txtPhone.setDisable(false);
			txtRrno.setDisable(false);
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
		pf.LoadPer(txtRrno, txtPhone, txtAdd, txtAcademic);
		dao.fillInfoPer(laEmno, laname, laGender, txtRrno, txtPhone, txtAdd, txtBank, txtAccount, txtAcademic);
		txtAcademic.setDisable(true);
		txtAdd.setDisable(true);
		txtPhone.setDisable(true);
		txtRrno.setDisable(true);
		btnLoad.setDisable(true);
		btnUpdate.setDisable(false);
		btnLoad.setDisable(true);
	}
	
	
}
