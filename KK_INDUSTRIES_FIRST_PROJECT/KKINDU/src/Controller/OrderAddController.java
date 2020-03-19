package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import DAO.OrderManageDAO;
import Function.OrderManageFunction;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class OrderAddController implements Initializable {
	
	private static OrderManageDAO dao = new OrderManageDAO();
	private static OrderManageFunction of = new OrderManageFunction();
	
	@FXML private DatePicker date;
	@FXML private ComboBox<String> cmbHope;
	@FXML private TextArea txtReq;
	@FXML private Button btnReg;
	@FXML private ComboBox<String> cmbClass;
	@FXML private ComboBox<String> cmbCompany;
	@FXML private TextField txtPro;
	private ObservableList<String> hopelist;
	private ObservableList<String> clientlist;

	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		hopelist = FXCollections.observableArrayList();
		clientlist = FXCollections.observableArrayList();
		btnReg.setOnAction(event -> btnReg(event));
		dao.hopeEmp(hopelist);
		cmbHope.setItems(hopelist);
		
		dao.OrderAddList(clientlist);
		cmbCompany.setItems(clientlist);
	}
	
	public void btnReg(ActionEvent e) {
		dao.insertOrder(date, cmbHope, txtReq, cmbClass, cmbCompany, txtPro);
		of.refreshList();
		Stage stage = (Stage)date.getScene().getWindow();
		stage.close();
		
	}

}
