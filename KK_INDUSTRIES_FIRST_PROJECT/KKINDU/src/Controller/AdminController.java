package Controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import ChatClient.ChatClient;
import ChatServer.Server;
import DAO.LoginDAO;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class AdminController implements Initializable {
	@FXML
	private Button btnRun;
	@FXML
	private Button btnRun2;
	@FXML
	private Button btnUser;
	@FXML
	private Button btnDev;
	@FXML
	private Button btnPer;
	@FXML
	private Button btnBus;
	@FXML
	private Button btnAcc;

	private static Server s = new Server();
	private static ChatClient cc = new ChatClient();
	private static String name;
	private static String Position;
	private static LoginDAO dao = new LoginDAO();

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		btnRun.setOnAction(event -> btnRun(event));
		btnRun2.setOnAction(event -> btnRun2(event));
		btnAcc.setOnAction(event -> btnAcc(event));
		btnBus.setOnAction(event -> btnBus(event));
		btnDev.setOnAction(event -> btnDev(event));
		btnPer.setOnAction(event -> btnPer(event));
		btnUser.setOnAction(event -> btnUser(event));

	}

	public void btnRun(ActionEvent e) {

		if (btnRun.getText().equals("ON")) {
			s.startServer("192.168.1.3", 7777);
			Alert alert = new Alert(AlertType.WARNING);
			alert.setHeaderText("Server");
			alert.setContentText("Run Server");
			alert.show();
			btnRun.setText("OFF");
		} else {
			s.stopServer();
			Alert alert = new Alert(AlertType.WARNING);
			alert.setHeaderText("Server");
			alert.setContentText("Stop Server");
			alert.show();
			btnRun.setText("ON");
		}
	}

	public void btnRun2(ActionEvent e) {

		cc.setUser("Master", "M", "Admin");
		Stage primaryStage = new Stage();
		
		try {
			cc.start(primaryStage);
		} catch (Exception e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

	}
	

	public void btnBus(ActionEvent e) {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.setTitle("Business management");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/client_manage_info.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {

			e1.printStackTrace();
		}
	}

	public void btnAcc(ActionEvent e) {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.setTitle("Accounting management");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/accounting_login_master.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {

			e1.printStackTrace();
		}
	}

	public void btnPer(ActionEvent e) {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.setTitle("Personnel Department");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/personnel.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {

			e1.printStackTrace();
		}
	}

	public void btnUser(ActionEvent e) {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.setTitle("User Information");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/userinformation.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {

			e1.printStackTrace();
		}
	}

	public void btnDev(ActionEvent e) {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.setTitle("Develoment Department");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/order_manage_info.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {

			e1.printStackTrace();
		}
	}

}
