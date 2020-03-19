package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import DAO.PersonnelDAO;
import Function.PersonnelFunction;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextArea;
import javafx.stage.Stage;

public class RetiredController implements Initializable {

	@FXML ComboBox<String> cmbReEmp;
	@FXML DatePicker date;
	@FXML TextArea txtReRe;
	@FXML Button btnReReg;
	
	private ObservableList<String> list;
	private static PersonnelDAO dao = new PersonnelDAO();
	private static PersonnelFunction pf = new PersonnelFunction();
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		btnReReg.setOnAction(event -> btnRegi(event));
		list = FXCollections.observableArrayList();
		dao.EmployeeReList(list);
		cmbReEmp.setItems(list);
		
	}
	
	public void btnRegi(ActionEvent e) {
		pf.insertAddReEmp(cmbReEmp.getSelectionModel().getSelectedIndex(), txtReRe, date);
		pf.refreshReList();
		
		Stage s = (Stage)date.getScene().getWindow();
		s.close();
	}

}
