package Controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import DAO.OrderManageDAO;
import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.ProgressBar;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class ProjectController implements Initializable {

	@FXML
	private Label laOrderNo;
	@FXML
	private Label laEmpNo;
	@FXML
	private Label laEmpName;
	@FXML
	private Label laPos;
	@FXML
	private Label laPhone;
	@FXML
	private Label laDead;
	@FXML
	private Label laPer;
	@FXML
	private Label laName;
	@FXML
	private ProgressBar progress;
	@FXML
	private Label laUpdate;

	
	private OrderManageDAO dao = new OrderManageDAO();
	private Task<Void> task;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		dao.project(laName, laOrderNo, laEmpNo, laEmpName, laPos, laPhone, laDead);
		dao.setProgress(progress, laPer);
		task = new Task<Void>() {
			@Override
			protected Void call() throws Exception {
				updateProgress(dao.getProjectPro(), 10);
				return null;
			}
		};
		Thread thread = new Thread(task);
		thread.start();
		progress.progressProperty().bind(task.progressProperty());
		int per = (int)dao.getProjectPro()*10;
		laPer.setText(Integer.toString(per)+"%");
		laUpdate.setOnMouseClicked(event -> update(event));

	}
	
	public void update(MouseEvent e) {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.setTitle("Progress Update");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/progress.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			
			e1.printStackTrace();
		}
	}

}
