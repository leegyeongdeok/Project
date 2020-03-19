package Function;

import java.io.IOException;

import DAO.LoginDAO;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class LoginFunction {
	static private LoginDAO dao = LoginDAO.getInstance();
	static int opper;

	// id banned check
	public void banId(int banVal) {
		if (banVal == 1) {
			Alert alert = new Alert(AlertType.WARNING);
			alert.setTitle("Warning");
			alert.setHeaderText("BANNED ID");
			alert.setContentText("contact the administrator");
			alert.showAndWait();
			System.exit(0);
		}
	}

	// id opperation check
	public void opperationLogin(Boolean invalid, String id, Stage stage) {
		if (invalid) {
			opper = 0;
			this.depart(dao.checkDepart(id), stage);
		} else if (opper < 4) {
			opper = opper + 1;
			Alert alert = new Alert(AlertType.WARNING);
			alert.setTitle("Error");
			alert.setHeaderText("invalid user_id / user_pw logon disabled ");
			if (opper < 4) {
				alert.setContentText("please enter a correct ID or password" + "\nopportunity(" + opper + "/5)");
			} else if (opper == 4) {
				alert.setContentText("please enter a correct user_id or user_pw"
						+ "\nOne more incorrect ID or password, your ID will be banned. ");
			}
			alert.showAndWait();
		} else if (opper == 4) {
			dao.ban(id);
			Alert alert = new Alert(AlertType.WARNING);
			alert.setTitle("Error");
			alert.setHeaderText("You've lost all five opportunity ");
			alert.setContentText("This ID has been ban");
			alert.showAndWait();
			System.exit(0);
		}
	}

	// searching depart and connecting
	private void depart(String departVal, Stage stage) {
		Parent parent;
		Stage dialog;
		String fx = "";

		stage.close();

		if (departVal.equals("Admin") || departVal.equals("Master")) {
			fx = "/View/admin.fxml";
		} else if (departVal.equals("Accounting")) {
			fx = "/View/accounting_login.fxml";
		} else {
			fx = "/View/other_login.fxml";
		}

		dialog = new Stage(StageStyle.UTILITY);
		dialog.initModality(Modality.WINDOW_MODAL);
		try {
			parent = FXMLLoader.load(getClass().getResource(fx));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}

	public void departLogin() {
		String depart = dao.getDepart();
		String fx = "";
		Parent parent;
		Stage dialog;

		if (depart.equals("Personnel")) {
			fx = "/View/personnel.fxml";
		}
		if (depart.equals("Business")) {
			fx = "/View/client_manage_info.fxml";
		}
		if (depart.equals("Development")) {
			fx = "/View/order_manage_info.fxml";
		}
		
		dialog = new Stage(StageStyle.UTILITY);
		dialog.initModality(Modality.WINDOW_MODAL);
		try {
			parent = FXMLLoader.load(getClass().getResource(fx));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
	}
}
