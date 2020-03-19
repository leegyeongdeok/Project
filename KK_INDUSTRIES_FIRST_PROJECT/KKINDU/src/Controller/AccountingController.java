package Controller;

import java.io.IOException;
import java.net.URL;
import java.time.LocalDate;
import java.util.ResourceBundle;

import DAO.AccountingDAO;
import Function.AccountingFunction;
import Model.Accounting;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class AccountingController implements Initializable {

	@FXML
	private DatePicker date;
	@FXML
	private Label laBa;
	@FXML
	private TableView<Accounting> tableView;
	@FXML
	private TableColumn<Accounting, String> tcDay;
	@FXML
	private TableColumn<Accounting, String> tcNum;
	@FXML
	private TableColumn<Accounting, String> tcClass;
	@FXML
	private TableColumn<Accounting, String> tcAcc;
	@FXML
	private TableColumn<Accounting, String> tcClient;
	@FXML
	private TableColumn<Accounting, String> tcDes;
	@FXML
	private TableColumn<Accounting, String> tcDe;
	@FXML
	private TableColumn<Accounting, String> tcCr;
	@FXML
	private Button btnAdd;
	@FXML
	private Button btnFinal;
	
	private ObservableList<Accounting> list;
	private static AccountingDAO dao = new AccountingDAO();
	private static AccountingFunction af = new AccountingFunction();
	
	public void initialize(URL location, ResourceBundle resources) {
		btnAdd.setDisable(true);
		list = FXCollections.observableArrayList();
		tcDay.setCellValueFactory(new PropertyValueFactory("day"));
		tcNum.setCellValueFactory(new PropertyValueFactory("num"));
		tcClass.setCellValueFactory(new PropertyValueFactory("classf"));
		tcAcc.setCellValueFactory(new PropertyValueFactory("code"));
		tcClient.setCellValueFactory(new PropertyValueFactory("client"));
		tcDes.setCellValueFactory(new PropertyValueFactory("description"));
		tcDe.setCellValueFactory(new PropertyValueFactory("debit"));
		tcCr.setCellValueFactory(new PropertyValueFactory("credit"));

		date.valueProperty().addListener(new ChangeListener<LocalDate>() {
			@Override
			public void changed(ObservableValue<? extends LocalDate> observable, LocalDate oldValue,
					LocalDate newValue) {
				btnAdd.setDisable(false);
				list.clear();
				dao.AccountView(list, newValue, laBa);
				tableView.setItems(list);
				af.setRefreshAccount(list, tableView, newValue, laBa);
				
			}
		});
	
		btnAdd.setOnAction(event -> btnAdd(event));
		btnFinal.setOnAction(event -> btnFinal(event));
		
		
	}
	
	public void btnAdd(ActionEvent e) {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.setTitle("Progress Update");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/accounting_add.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			
			e1.printStackTrace();
		}
	}
	
	public void btnFinal(ActionEvent e) {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.setTitle("Progress Update");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/financial_status_table_info.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			
			e1.printStackTrace();
		}
	}
}
