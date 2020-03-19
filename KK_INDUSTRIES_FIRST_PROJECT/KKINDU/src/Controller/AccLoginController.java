package Controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import ChatClient.ChatClient;
import DAO.LoginDAO;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class AccLoginController implements Initializable {

	@FXML
	private Label laNa;
	@FXML
	private Label laPos;
	@FXML
	private Button btnGen;
	@FXML
	private Button btnSp;

	private static LoginDAO dao = new LoginDAO();
	private static ChatClient cc = new ChatClient();


	@Override
	public void initialize(URL location, ResourceBundle resources) {
		dao.LoginView(laNa, laPos);
		btnGen.setOnAction(event -> gen(event));
		btnSp.setOnAction(event -> sp(event));
		
		cc.setUser(laNa.getText(), "A", laPos.getText());
		Stage primaryStage = new Stage();
		
		try {
			cc.start(primaryStage);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void gen(ActionEvent e) {
	
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.setTitle("Progress Update");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/accounting.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			
			e1.printStackTrace();
		}

	}

	public void sp(ActionEvent e) {
		
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.setTitle("Progress Update");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/purchase_sales.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			
			e1.printStackTrace();
		}
	}

}
