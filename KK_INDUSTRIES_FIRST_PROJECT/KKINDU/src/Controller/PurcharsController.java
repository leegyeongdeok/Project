package Controller;

import java.io.IOException;
import java.net.URL;
import java.time.LocalDate;
import java.util.ResourceBundle;

import DAO.AccountingDAO;
import Function.AccountingFunction;
import Model.Accounting;
import Model.Purchar;
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

public class PurcharsController implements Initializable {

	@FXML
	private DatePicker date;
	@FXML
	private Label laBa;
	@FXML
	private TableView<Purchar> tableView;
	@FXML
	private TableColumn<Purchar, String> tcDay;
	@FXML
	private TableColumn<Purchar, String> tcNum;
	@FXML
	private TableColumn<Purchar, String> tcType;
	@FXML
	private TableColumn<Purchar, String> tcAcc;
	@FXML
	private TableColumn<Purchar, String> tcQuan;
	@FXML
	private TableColumn<Purchar, String> tcUnit;
	@FXML
	private TableColumn<Purchar, String> tcSupply;
	@FXML
	private TableColumn<Purchar, String> tcVat;
	@FXML
	private TableColumn<Purchar, String> tcClient;
	@FXML
	private TableColumn<Purchar, String> tcKind;
	@FXML
	private TableColumn<Purchar, String> tcJour;
	@FXML
	private Button btnAdd;
	@FXML
	private Button btnFinal;
	
	private ObservableList<Purchar> list;
	private static AccountingDAO dao = new AccountingDAO();
	private static AccountingFunction af = new AccountingFunction();
	
	public void initialize(URL location, ResourceBundle resources) {
		btnAdd.setDisable(true);
		list = FXCollections.observableArrayList();
		tcDay.setCellValueFactory(new PropertyValueFactory("day"));
		tcNum.setCellValueFactory(new PropertyValueFactory("num"));
		tcType.setCellValueFactory(new PropertyValueFactory("type"));
		tcAcc.setCellValueFactory(new PropertyValueFactory("code"));
		tcQuan.setCellValueFactory(new PropertyValueFactory("quantity"));
		tcUnit.setCellValueFactory(new PropertyValueFactory("unit"));
		tcSupply.setCellValueFactory(new PropertyValueFactory("supply"));
		tcVat.setCellValueFactory(new PropertyValueFactory("vat"));
		tcClient.setCellValueFactory(new PropertyValueFactory("client"));
		tcKind.setCellValueFactory(new PropertyValueFactory("kind"));
		tcJour.setCellValueFactory(new PropertyValueFactory("journal"));
		
		date.valueProperty().addListener(new ChangeListener<LocalDate>() {
			@Override
			public void changed(ObservableValue<? extends LocalDate> observable, LocalDate oldValue,
					LocalDate newValue) {
				btnAdd.setDisable(false);
				list.clear();
				dao.PurcharView(list, newValue, laBa);
				tableView.setItems(list);
				af.setRefreshPurchase(list, tableView, newValue, laBa);
				
			}
		});
	
		btnAdd.setOnAction(event -> btnAdd(event));
		btnFinal.setOnAction(event -> btnFinal(event));
		
		laBa.textProperty().addListener(new ChangeListener<String>() {

			@Override
			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				if(Integer.parseInt(newValue)<0) {
					laBa.setStyle("-fx-text-fill: red;");
				}else {
					laBa.setStyle("-fx-text-fill: black;");
				}
				
			}
		});
	}
	
	
	public void btnAdd(ActionEvent e) {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.setTitle("Progress Update");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/sales_purchase_add.fxml"));
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
			Parent parent = FXMLLoader.load(getClass().getResource("/View/sales_purchase_slip.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			
			e1.printStackTrace();
		}
	}
}
