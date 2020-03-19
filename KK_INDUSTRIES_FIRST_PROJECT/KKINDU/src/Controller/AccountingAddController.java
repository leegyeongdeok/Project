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
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class AccountingAddController implements Initializable {
	@FXML private ComboBox<String> cmbClass;
	@FXML private TextField txtCode;
	@FXML private TextField txtClient;
	@FXML private TextField txtDes;
	@FXML private TextField txtDebit;
	@FXML private TextField txtCredit;
	@FXML private Button btnReg;
	
	private static AccountingFunction af = new AccountingFunction();
	private static AccountingDAO dao = new AccountingDAO();
	

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		txtCredit.setDisable(true);
		txtDebit.setDisable(true);
		btnReg.setOnAction(event -> btnReg(event));
		
		
		cmbClass.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {

			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				if(newValue.equals("Debit")) {
					txtDebit.setDisable(false);
					txtCredit.setDisable(true);
				}else {
					txtDebit.setDisable(true);
					txtCredit.setDisable(false);
				}
			}
		});
		
		txtCode.setOnMouseClicked(event -> codeSearch(event));
		txtClient.setOnMouseClicked(event -> clientSearch(event));
		
	}


	public void btnReg(ActionEvent e) {
		dao.InsertAcc(cmbClass, txtCode, txtClient, txtDes, txtDebit, txtCredit);
		af.refreshAccount();
		Stage s = (Stage)btnReg.getScene().getWindow();
		s.close();
	}
	
	public void codeSearch(MouseEvent e) {
		if(e.getClickCount() >= 2) {
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
		if(e.getClickCount() >= 2) {
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
