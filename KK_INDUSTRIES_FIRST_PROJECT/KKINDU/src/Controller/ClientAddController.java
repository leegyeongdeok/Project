package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import DAO.ClientManageDAO;
import Function.ClientManageFunction;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class ClientAddController implements Initializable {

	@FXML private TextField txtNa;
	@FXML private TextField txtBs;
	@FXML private TextField txtBl;
	@FXML private TextField txtRn;
	@FXML private TextField txtRr;
	@FXML private TextField txtPh;
	@FXML private TextField txtAd;
	@FXML private TextField txtCh;
	@FXML private TextField txtCp;
	@FXML private Button btnReg;
	
	private static ClientManageDAO dao = new ClientManageDAO();
	private static ClientManageFunction cf = new ClientManageFunction();
	
	
	public void initialize(URL location, ResourceBundle resources) {
		  btnReg.setOnAction(event -> btnReg(event));
		  txtRr.textProperty().addListener(new ChangeListener<String>() {
				@Override
				public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				
					if (txtRr.getText().trim().length() == 13) {
						txtRr.setText(newValue.substring(0, 6)+"-"+ newValue.substring(6, 13));
						txtRr.setDisable(true);
						
					}
				}
			});
	}
	
	public void btnReg(ActionEvent e) {
		dao.clientAdd(txtNa, txtBs, txtBl, txtRn, txtRr, txtPh, txtAd, txtCh, txtCp);
		cf.refreshView();
		Stage stage = (Stage) btnReg.getScene().getWindow();
		stage.close();
	}

}
