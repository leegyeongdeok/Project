package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import ChatClient.ChatClient;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.stage.Stage;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;

public class LoginChattingController implements Initializable {
	@FXML
	private Button btnRun;
	
	@FXML 
	private TextField txtName;
	
	@FXML 
	private TextField txtIp;
	
	@FXML 
	private TextField txtPort;
	
	private static ChatClient cc = new ChatClient();
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		btnRun.setOnAction(event -> btnRun(event));

	}

	public void btnRun(ActionEvent e) {
	
		String ip = txtIp.getText();
		String port = txtPort.getText();
		
		String numMatcher = "^[0-9]*$";
		String ipMatcher = "([0-9]{1,3}) \\. ([0-9]{1,3}) \\. ([0-9]{1,3}) \\. ([0-9]{1,3})"; 
				
		
		if(port.trim().length() != 4 || !port.matches(numMatcher) ) {
			viewAlert();
		}else if(!ip.matches(ipMatcher)) {
			if(ip.equals("localhost")) {
				runCahtting();
			}else {
				viewAlert();
			}
			
		}else {
			runCahtting();
		}
		
	}
	
	public void runCahtting() {
		cc.setUser("User", txtName.getText(),txtIp.getText(), Integer.parseInt(txtPort.getText()));
		Stage primaryStage = new Stage();
		
		try {
			cc.start(primaryStage);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		Stage s = (Stage)btnRun.getScene().getWindow();
		s.close();
	}
	
	public void viewAlert() {
		Alert alert = new Alert(AlertType.WARNING);
		alert.setHeaderText("아이피와 포트값을 확인해주세요");
		alert.setContentText("port Error");
		alert.show();
	}
}
