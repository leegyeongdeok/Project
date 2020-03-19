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

public class LeaveEmpController implements Initializable {

	@FXML private Button btnRegi;
	@FXML private ComboBox<String> cmbEmp;
	@FXML private TextArea txtRe;
	@FXML private DatePicker date;
	
	private ObservableList<String> list;
	private static PersonnelDAO dao = new PersonnelDAO();
	private static PersonnelFunction pf = new PersonnelFunction();
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		btnRegi.setOnAction(event -> btnRegi(event));
		list = FXCollections.observableArrayList();
		dao.EmployeeLeList(list);
		cmbEmp.setItems(list);
		
	}
	
	public void btnRegi(ActionEvent e) {
		pf.insertAddLeEmp(cmbEmp.getSelectionModel().getSelectedIndex(), txtRe, date);
		pf.refreshLeList();
	}

}
