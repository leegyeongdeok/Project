package Controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class AccLoginMasterController implements Initializable {

	@FXML
	private Button btnGen;
	@FXML
	private Button btnSp;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		btnGen.setOnAction(event -> gen(event));
		btnSp.setOnAction(event -> sp(event));
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
