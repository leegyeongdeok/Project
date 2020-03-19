package Controller;

import java.net.URL;
import java.time.LocalDate;
import java.util.ResourceBundle;

import DAO.AccountingDAO;
import Function.AccountingFunction;
import Model.PurcharFill;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

public class purchaseSlipController implements Initializable {

	@FXML
	private TableView<PurcharFill> tableView;
	@FXML
	private TableColumn<PurcharFill, String> tcDay;
	@FXML
	private TableColumn<PurcharFill, String> tcType;
	@FXML
	private TableColumn<PurcharFill, String> tcAcc;
	@FXML
	private TableColumn<PurcharFill, String> tcSupply;
	@FXML
	private TableColumn<PurcharFill, String> tcVat;
	@FXML
	private TableColumn<PurcharFill, String> tcConsumer;
	@FXML
	private Button btnTotal;
	@FXML
	private Button btnSales;
	@FXML
	private Button btnPur;
	@FXML
	private DatePicker date1;
	@FXML
	private DatePicker date2;

	private ObservableList<PurcharFill> list;
	private static AccountingDAO dao = new AccountingDAO();
	private static AccountingFunction af = new AccountingFunction();

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		btnTotal.setDisable(true);
		btnSales.setDisable(true);
		btnPur.setDisable(true);
		list = FXCollections.observableArrayList();
		tcDay.setCellValueFactory(new PropertyValueFactory("day"));
		tcType.setCellValueFactory(new PropertyValueFactory("type"));
		tcAcc.setCellValueFactory(new PropertyValueFactory("code"));
		tcConsumer.setCellValueFactory(new PropertyValueFactory("consumer"));
		tcSupply.setCellValueFactory(new PropertyValueFactory("supply"));
		tcVat.setCellValueFactory(new PropertyValueFactory("vat"));

		date1.valueProperty().addListener(new ChangeListener<LocalDate>() {
			@Override
			public void changed(ObservableValue<? extends LocalDate> observable, LocalDate oldValue,
					LocalDate newValue) {
				if (date2.getValue() != null && date1.getValue() != null) {
					btnTotal.setDisable(false);
					btnSales.setDisable(false);
					btnPur.setDisable(false);
				} else {
					btnTotal.setDisable(true);
					btnSales.setDisable(true);
					btnPur.setDisable(true);
				}
			}
		});
		
		date2.valueProperty().addListener(new ChangeListener<LocalDate>() {
			@Override
			public void changed(ObservableValue<? extends LocalDate> observable, LocalDate oldValue,
					LocalDate newValue) {
				if (date2.getValue() != null && date1.getValue() != null) {
					btnTotal.setDisable(false);
					btnSales.setDisable(false);
					btnPur.setDisable(false);
				} else {
					btnTotal.setDisable(true);
					btnSales.setDisable(true);
					btnPur.setDisable(true);
				}
			}
		});
		
		btnPur.setOnAction(event -> btnPur(event));
		btnSales.setOnAction(event -> btnSales(event));
		btnTotal.setOnAction(event -> btnTotal(event));
	}

	public void btnTotal(ActionEvent e) {
		list.clear();
		dao.fillPsTotal(list, date1, date2);
		tableView.setItems(list);
	}

	public void btnSales(ActionEvent e) {
		list.clear();
		dao.fillPsSales(list, date1, date2);
		tableView.setItems(list);
	}

	public void btnPur(ActionEvent e) {
		list.clear();
		dao.fillPsPur(list, date1, date2);
		tableView.setItems(list);
	}

}
