package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import DAO.LoginDAO;
import Function.SignUpFunction;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
import javafx.scene.control.Alert.AlertType;

public class SignUpController implements Initializable {
	@FXML
	private BorderPane signDialog;
	@FXML
	private Button btnSignup;
	@FXML
	private Button btnCheck;
	@FXML
	private TextField txtInputId;
	@FXML
	private PasswordField txtInputPw;
	@FXML
	private PasswordField txtInputPwConfirm;
	@FXML
	private Label laConfirm;
	@FXML
	private Label laCheck;
	@FXML
	private ComboBox<String> cmdClass;
	@FXML
	private TextField txtEmployee;

	private static SignUpFunction sf = new SignUpFunction();
	private static boolean executeDuplicateID;
	private static boolean pwMatch;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		executeDuplicateID = false;

		txtInputId.textProperty().addListener(new ChangeListener<String>() {
			@Override
			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				if (txtInputId.getText().trim().length() > 10) {
					txtInputId.setText(oldValue);
				} else if (!oldValue.equals(newValue)) {
					laCheck.setText("you didn't duplicate check");
					executeDuplicateID = false;
				}
			}
		});

		txtEmployee.textProperty().addListener(new ChangeListener<String>() {
			@Override
			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				if (txtEmployee.getText().trim().length() > 6) {
					txtEmployee.setText(oldValue);
				}
			}
		});

		txtInputPwConfirm.textProperty().addListener(new ChangeListener<String>() {
			@Override
			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				if (!txtInputPwConfirm.getText().equals(txtInputPw.getText())) {
					laConfirm.setText("Those passwords didn't match");
					pwMatch = false;
				} else {
					laConfirm.setText("");
					pwMatch = true;
				}
			}
		});

		txtInputPw.textProperty().addListener(new ChangeListener<String>() {
			@Override
			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				if (txtInputPw.getText().trim().length() > 12) {
					txtInputPw.setText(oldValue);
				}
			}
		});

		btnSignup.setOnAction(event -> btnSignUp(event));
		btnCheck.setOnAction(event -> btnCheck(event));

	}

	public void btnSignUp(ActionEvent e) {
		
		boolean executeDuplicateNO = sf.duplicateEmployeeChecker(txtEmployee);
		if (!(executeDuplicateID && pwMatch)) {
			sf.executeDuplicateChecker(executeDuplicateID);
			sf.pwMatchChecker(pwMatch);
		}else {
			sf.RunSignUp(txtInputId, txtInputPw, txtInputPwConfirm, cmdClass, txtEmployee);
		}

	}

	public void btnCheck(ActionEvent e) {
		sf.duplicateIDChecker(txtInputId, laCheck);
		executeDuplicateID = true;
	}

}
