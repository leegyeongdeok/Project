package Function;

import java.io.IOException;

import DAO.PersonnelDAO;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.DatePicker;
import javafx.scene.control.ListView;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class PersonnelFunction {
	static boolean sequence;
	private static PersonnelDAO dao = new PersonnelDAO().getInstance();
	private static int index;
	private static String workerNo = null;
	private static String leaveWorkerNo = null;
	private static String retiredWorkerNo = null;
	private static String Department = null;
	private static ListView<String> leaveList;
	private static ListView<String> empList;
	private static ObservableList<String> leave;
	private static ObservableList<String> emp;
	private static ListView<String> retiredList;
	private static ObservableList<String> retired;

	public String getWorkerNo() {
		return workerNo;
	}

	public void setDepart(String Depart) {
		Department = Depart;
	}

	public String getDepart() {
		return Department;
	}

	public String changeImage(int index) {
		this.index = index;
		String worker = dao.getWorkerNo(this.index);
		String val = "/View/images/" + worker + ".jpeg";
		return val;
	}

	public void addEmp() {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.initModality(Modality.WINDOW_MODAL);
		dialog.setTitle("Employee Add");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/employee_add.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	

	// View add
	public void fillInfoPerUrl(BorderPane changePane) {
		workerNo = dao.getWorkerNo(this.index);
		sequence = true;
		try {
			Parent parent = (Parent) FXMLLoader.load(getClass().getResource("/View/personal_info.fxml"));
			changePane.setCenter(parent);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void fillInfoEmpUrl(BorderPane changePane) {
		workerNo = dao.getWorkerNo(this.index);
		sequence = false;
		try {
			Parent parent = (Parent) FXMLLoader.load(getClass().getResource("/View/employee_info.fxml"));
			changePane.setCenter(parent);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void refreshList() {
		empList.getItems().clear();
		dao.EmployeeList(emp, Department);
		empList.setItems(emp);
	}
	
	public void setEmpList(ObservableList<String> emp, ListView<String> empList) {
		this.empList = empList;
		this.emp = emp;
	}
	

	// btnLoad Personal

	public void LoadPer(TextField txtRrno, TextField txtPhone, TextField txtAdd, TextArea txtAcademic) {
		dao.updatePerEi(txtRrno, txtPhone, txtAdd, txtAcademic);
	}

	// btnLoad Employee

	public void LoadEmp(TextField txtDepart, TextField txtPosition, TextField txtWorkDay, TextArea txtOther) {
		dao.updateEmpEi(txtDepart, txtPosition, txtWorkDay, txtOther);
	}

	// leave employee Tab

	public String changeLeaveImage(int index) {
		leaveWorkerNo = dao.getLeaveWorkerno(index);
		String val = "/View/images/" + leaveWorkerNo + ".jpeg";
		return val;
	}

	public String getLeaveWorkerno() {
		return leaveWorkerNo;
	}

	public void addLeEmp() {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.initModality(Modality.WINDOW_MODAL);
		dialog.setTitle("Personnel");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/leave_employee_add.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	public void insertAddLeEmp(int index, TextArea txtRe, DatePicker date) {
		dao.insertLeEmp(index, txtRe.getText(), date.getValue().toString());
		Stage s = (Stage) txtRe.getScene().getWindow();
		s.close();
	}

	public void refreshLeList() {
		leaveList.getItems().clear();
		dao.leaveList(leave);
		leaveList.setItems(leave);
	}

	public void setLeaveList(ObservableList<String> leave, ListView<String> leaveList) {
		this.leaveList = leaveList;
		this.leave = leave;

	}

	// retired employee Tab

	public String changeretiredImage(int index) {
		retiredWorkerNo = dao.getRetiredWorkerno(index);
		String val = "/View/images/" + retiredWorkerNo + ".jpeg";
		return val;
	}

	public String getRetiredWorkerno() {
		return retiredWorkerNo;
	}

	public void insertAddReEmp(int index, TextArea txtRe, DatePicker date) {
		dao.insertReEmp(index, txtRe.getText(), date.getValue().toString());
		Stage s = (Stage) txtRe.getScene().getWindow();
		s.close();
	}

	public void delLeEmp(int index) {
		dao.delLeEmp(index);

	}

	public void addReEmp() {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.initModality(Modality.WINDOW_MODAL);
		dialog.setTitle("Personnel");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/retired_employee_add.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
	}

	public void delReEmp(int index) {
		dao.delReEmp(index);
		
	}

	public void refreshReList() {
		retiredList.getItems().clear();
		dao.retiredList(retired);
		retiredList.setItems(retired);
		
	}
	
	public void setretiredList(ObservableList<String> retired, ListView<String> retiredList) {
		this.retiredList = retiredList;
		this.retired = retired;
	}



}
