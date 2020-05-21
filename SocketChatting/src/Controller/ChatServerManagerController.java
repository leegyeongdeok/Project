package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import ChatClient.ChatClient;
import ChatServer.Server;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

public class ChatServerManagerController implements Initializable {
	@FXML
	private Button btnRun;
	
	@FXML 
	private TextField txtIp;
	
	@FXML 
	private TextField txtPort;

	private static Server s = new Server();
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
				RunServer(ip, Integer.parseInt(port));
			}else {
				viewAlert();
			}
			
		}else {
			RunServer(ip, Integer.parseInt(port));
		}
	}
	
	
	public void RunServer(String ip, int port) {
		if (btnRun.getText().equals("ON")) {
			s.startServer(ip, port);
			Alert alert = new Alert(AlertType.WARNING);
			alert.setHeaderText("Server");
			alert.setContentText("Run Server");
			alert.show();
			btnRun.setText("OFF");
			txtIp.setDisable(true);
			txtPort.setDisable(true);
			runChatting();
		} else {
			s.stopServer();
			Alert alert = new Alert(AlertType.WARNING);
			alert.setHeaderText("Server");
			alert.setContentText("Stop Server");
			alert.show();
			btnRun.setText("ON");
			txtIp.setDisable(false);
			txtPort.setDisable(false);
		}
	}
	
	public void runChatting() {
		cc.setUser("Admin", "Little_K",txtIp.getText(), Integer.parseInt(txtPort.getText()));
		Stage primaryStage = new Stage();
		
		try {
			cc.start(primaryStage);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
	}
	
	public void viewAlert() {
		Alert alert = new Alert(AlertType.WARNING);
		alert.setHeaderText("입력값을 확인해주세요");
		alert.setContentText("port Error");
		alert.show();
	}
}
