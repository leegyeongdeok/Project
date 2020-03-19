package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import ChatClient.ChatClient;
import DAO.LoginDAO;
import Function.LoginFunction;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.stage.Stage;

public class OtherLoginController implements Initializable {
	
	@FXML private Label laNa;
	@FXML private Label laPos;
	@FXML private Button btnExe;
	@FXML private Label laDepart;
	
	private static LoginDAO dao = new LoginDAO();
	private static LoginFunction lf = new LoginFunction();
	private static ChatClient cc = new ChatClient();
	

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		dao.LoginView(laNa, laPos, laDepart);
		btnExe.setOnAction(event -> btnExe(event));
		
	
	}
	
	public void btnExe(ActionEvent e) {
		lf.departLogin();
		cc.setUser(laNa.getText(), laDepart.getText().substring(0, 1), laPos.getText());
		Stage primaryStage = new Stage();
		
		try {
			cc.start(primaryStage);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		Stage s = (Stage)btnExe.getScene().getWindow();
		s.close();
	}

}
