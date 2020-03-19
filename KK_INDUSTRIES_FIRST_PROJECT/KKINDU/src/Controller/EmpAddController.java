package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import DAO.PersonnelDAO;
import Function.PersonnelFunction;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class EmpAddController implements Initializable {
	@FXML private Label laEmpNo;
	@FXML private Label laGender;
	@FXML private TextField txtNa;
	@FXML private TextField txtRe;
	@FXML private TextField txtPh;
	@FXML private TextField txtAdd;
	@FXML private TextField txtWork;
	@FXML private TextArea txtAca;
	@FXML private TextArea txtOther;
	@FXML private ChoiceBox<String> cmbDepart;
	@FXML private Button btnReg;
	private static PersonnelDAO dao = new PersonnelDAO();
	private static PersonnelFunction pf = new PersonnelFunction();
	

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		btnReg.setOnAction(event -> btnReg(event));
		
		cmbDepart.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {

			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				laEmpNo.setText(dao.setEmpNo(newValue));
			}
		});
		
		txtRe.textProperty().addListener(new ChangeListener<String>() {
			@Override
			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
			
				if (txtRe.getText().trim().length() == 13) {
					txtRe.setText(newValue.substring(0, 6)+"-"+ newValue.substring(6, 13));
					txtRe.setDisable(true);
					if(Integer.parseInt(Character.toString(txtRe.getText().charAt(7))) == 1) {
						laGender.setText("Man");
					}else {
						laGender.setText("Women");
					}
					
				}
			}
		});
		
	}
	
	public void btnReg(ActionEvent e) {
		dao.addEmp(laEmpNo, txtNa, txtRe, laGender, cmbDepart, txtWork, txtAca, txtPh, txtAdd, txtOther);
		pf.refreshList();
		Stage s = (Stage) txtRe.getScene().getWindow();
		s.close();
	}

}
