package Controller;

import java.net.URL;
import java.util.ResourceBundle;
import DAO.AdminDAO;
import Model.User;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;

public class UserInfoController implements Initializable{

	@FXML private TableView<User> tvUserInfo;
	@FXML private TableColumn<User, String> tcID;
	@FXML private TableColumn<User, String> tcPW;
	@FXML private TableColumn<User, String> tcBan;
	@FXML private TableColumn<User, String> tcName;
	@FXML private TableColumn<User, String> tcEmNo;
	@FXML private TableColumn<User, String> tcDepart;
	@FXML private TableColumn<User, String> tcPosition;
	@FXML private Label laEmpNo;
	@FXML private Label laName;
	@FXML private Label laState;
	@FXML private Label laDepartment;
	@FXML private Label laPosition;
	@FXML private Label laAnnual;
	@FXML private Label laResident;
	@FXML private Label laPhone;
	@FXML private Label laGender;
	@FXML private Label laAddress;
	@FXML private Label laAcademic;
	@FXML private Label laDay;
	@FXML private Label laBank;
	@FXML private Label laAccount;
	@FXML private Label laFour;
	@FXML private Label laHealth;
	@FXML private Label laNational;
	@FXML private Label laProject;
	@FXML private Label laworkday;
	@FXML private ImageView imageView;
	

	private ObservableList<User> list;
	private static AdminDAO adao = AdminDAO.getInstance();
	private static String EmpNo;
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		list = FXCollections.observableArrayList();
		
		tcID.setCellValueFactory(new PropertyValueFactory("id"));
		tcPW.setCellValueFactory(new PropertyValueFactory("pw"));
		tcBan.setCellValueFactory(new PropertyValueFactory("banned"));
		tcName.setCellValueFactory(new PropertyValueFactory("name"));
		tcEmNo.setCellValueFactory(new PropertyValueFactory("employeeNo"));
		tcDepart.setCellValueFactory(new PropertyValueFactory("department"));
		tcPosition.setCellValueFactory(new PropertyValueFactory("position"));
		adao.UserView(list);
		tvUserInfo.setItems(list);
		tvUserInfo.setOnMouseClicked(event -> viewClick(event));
		
	}
	
	public void viewClick(MouseEvent e) {
		EmpNo = tvUserInfo.getSelectionModel().getSelectedItem().getEmployeeNo();
		
		adao.fillInfoUser(laEmpNo, laName, laGender, laResident, laPhone, laAddress, laBank, laAccount, laAcademic, EmpNo);
		adao.fillInfoEmp(laDay, laDepartment, laPosition, laworkday, laAnnual, laProject, laBank, laFour, laHealth, laNational, EmpNo);
		
		String url = "/View/images/"+EmpNo+".jpeg";
		try {
			imageView.setImage(new Image(getClass().getResource(url).toString()));
		} catch (Exception e2) {
			imageView.setImage(new Image(getClass().getResource("/View/images/defa.jpg").toString()));
		}
	}

}
