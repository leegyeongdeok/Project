package Controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import DAO.AccountingDAO;
import Function.AccountingFunction;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class PurcharsAddController implements Initializable {
	@FXML
	private ComboBox<String> cmbType;
	@FXML
	private ComboBox<String> cmbKind;
	@FXML
	private ComboBox<String> cmbJournal;
	@FXML
	private TextField txtCode;
	@FXML
	private TextField txtAmount;
	@FXML
	private TextField txtUnitCost;
	@FXML
	private Label laSupply;
	@FXML
	private Label laVat;
	@FXML
	private TextField txtClient;
	@FXML
	private Button btnReg;

	private static AccountingFunction af = new AccountingFunction();
	private static AccountingDAO dao = new AccountingDAO();

	@Override
	public void initialize(URL location, ResourceBundle resources) {

		btnReg.setOnAction(event -> btnReg(event));

		cmbType.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {

			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				if (cmbType.getValue().equals("Sales")) {
					txtAmount.setDisable(true);
				} else {
					txtAmount.setDisable(false);
				}
			}
		});

		txtUnitCost.textProperty().addListener(new ChangeListener<String>() {
			@Override
			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				if (txtAmount.isDisable()) {
					int sup = 1 * Integer.parseInt(newValue);
					int vat = (int) (sup * 0.1);
					laSupply.setText(Integer.toString(sup));
					laVat.setText(Integer.toString(vat));
				} else if (!(txtAmount.getText().isEmpty() && txtUnitCost.getText().isEmpty())) {
					int sup = Integer.parseInt(txtAmount.getText()) * Integer.parseInt(newValue);
					int vat = (int) (sup * 0.1);
					laSupply.setText(Integer.toString(sup));
					laVat.setText(Integer.toString(vat));
				}
			}
		});

		txtCode.setOnMouseClicked(event -> codeSearch(event));
		txtClient.setOnMouseClicked(event -> clientSearch(event));

	}

	public void btnReg(ActionEvent e) {
		dao.InsertPs(cmbType, txtCode, txtAmount, txtUnitCost, laSupply, laVat, txtClient, cmbKind, cmbJournal);
		af.refreshPurchase();
		Stage s = (Stage) btnReg.getScene().getWindow();
		s.close();
	}

	public void codeSearch(MouseEvent e) {
		if (e.getClickCount() >= 2) {
			af.setCodeVal(txtCode);
			Stage dialog = new Stage(StageStyle.UTILITY);
			dialog.setTitle("Accounting Code Search");

			try {
				Parent parent = FXMLLoader.load(getClass().getResource("/View/code_search.fxml"));
				Scene scene = new Scene(parent);
				dialog.setScene(scene);
				dialog.setResizable(false);
				dialog.show();
			} catch (IOException e1) {

				e1.printStackTrace();
			}
		}
	}

	public void clientSearch(MouseEvent e) {
		if (e.getClickCount() >= 2) {
			af.setClientVal(txtClient);
			Stage dialog = new Stage(StageStyle.UTILITY);
			dialog.setTitle("Client Search");

			try {
				Parent parent = FXMLLoader.load(getClass().getResource("/View/client_search_info.fxml"));
				Scene scene = new Scene(parent);
				dialog.setScene(scene);
				dialog.setResizable(false);
				dialog.show();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

}
