package Function;

import java.io.IOException;

import DAO.PersonnelDAO;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class SalaryManageFunction {
	private static PersonnelDAO dao = new PersonnelDAO().getInstance();
	
	public void addSalary() {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.initModality(Modality.WINDOW_MODAL);
		dialog.setTitle("Salary Information Add");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/salary_manage_infoRe.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	public int Tax(int sum) {
		int val = 0;
		
		if(sum<=12000000) {
			val = (int) (sum * 0.06);
		}else if(sum<=46000000) {
			val = (int) (720000 + (sum-12000000) * 0.15);
		}else if(sum<=88000000) {
			val = (int) (5820000 + (sum-46000000) * 0.24);
		}else if(sum<=150000000) {
			val = (int) (15900000 + (sum-880000000) * 0.35);
		}else if(sum<=300000000) {
			val = (int) (37600000 + (sum-150000000) * 0.38);
		}else if(sum<=500000000) {
			val = (int) (94600000 + (sum-300000000) * 0.40);
		}else {
			val = (int) (174600000 + (sum-500000000) * 0.42);
		}
		return val;
	}
}
