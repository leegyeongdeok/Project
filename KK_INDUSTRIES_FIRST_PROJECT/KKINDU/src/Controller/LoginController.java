package Controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import DAO.LoginDAO;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class LoginController implements Initializable {
	@FXML private TextField txtId;
	@FXML private PasswordField txtPw;
	@FXML private Button btnSign;
	@FXML private Button btnLogin;
	@FXML private AnchorPane Loginpane;
	
	private static LoginDAO dao = new LoginDAO();

	public void initialize(URL location, ResourceBundle resource) {
		
		txtId.textProperty().addListener(new ChangeListener<String>() {
			@Override
			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {

				if (txtId.getText().trim().length() > 10) {
					txtId.setText(oldValue);
				}

			}
		});

		txtPw.textProperty().addListener(new ChangeListener<String>() {
			@Override
			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {

				if (txtPw.getText().trim().length() > 12) {
					txtPw.setText(oldValue);
				}

			}
		});
		
		btnSign.setOnAction(event -> SignBtnAction(event)); 
		btnLogin.setOnAction(event -> LoginBtnAction(event));
		txtPw.setOnKeyPressed(event -> LoginEnterAction(event));
	}

	private void SignBtnAction(ActionEvent e) {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.initModality(Modality.WINDOW_MODAL);
		dialog.initOwner(btnSign.getScene().getWindow());
		dialog.setTitle("Sign Up");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/signup.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			
			e1.printStackTrace();
		}

	}
	
	private void LoginBtnAction(ActionEvent e) {
		dao.getInstance();
		dao.login(txtId.getText(), txtPw.getText(), (Stage)Loginpane.getScene().getWindow());
		

	}
	
	private void LoginEnterAction(KeyEvent event) {
		if (event.getCode().equals(KeyCode.ENTER)) {
			LoginDAO dao = LoginDAO.getInstance();
			dao.login(txtId.getText(), txtPw.getText(), (Stage)Loginpane.getScene().getWindow());
			
		}
	}
	


}