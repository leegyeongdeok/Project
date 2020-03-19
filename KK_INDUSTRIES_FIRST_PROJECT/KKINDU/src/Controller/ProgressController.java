package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import DAO.OrderManageDAO;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class ProgressController implements Initializable {

	@FXML
	private TextField txtProg;
	@FXML
	private Button btnReg;
	private static OrderManageDAO dao = new OrderManageDAO();

	@Override
	public void initialize(URL location, ResourceBundle resources) {

		btnReg.setOnAction(event -> btnRe(event));
	}

	public void btnRe(ActionEvent e) {
		dao.updateProgress(txtProg);
		Stage stage = (Stage)btnReg.getScene().getWindow();
		stage.close();
	}

}
