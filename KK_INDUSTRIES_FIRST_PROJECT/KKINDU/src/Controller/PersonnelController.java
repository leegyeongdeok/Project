package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import DAO.PersonnelDAO;
import Function.PersonnelFunction;
import Function.SalaryManageFunction;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TextArea;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.BorderPane;

public class PersonnelController implements Initializable {

	
	@FXML
	private ListView<String> listView;
	@FXML
	private ListView<String> leaveList;
	@FXML
	private ListView<String> retiredList;
	@FXML
	private ComboBox<String> cmbDepart;
	@FXML
	private BorderPane changePane;
	@FXML
	private Button btnDel;
	@FXML
	private Button btnLeDel;
	@FXML
	private Button btnReDel;
	@FXML
	private Button btnRight;
	@FXML
	private Button btnLeft;
	@FXML
	private Button btnAdd;
	@FXML
	private Button btnLeAdd;
	@FXML
	private Button btnReAdd;
	@FXML
	private Button btnSal;
	@FXML
	private ImageView idPhoto;
	@FXML
	private ImageView leavePhoto;
	@FXML
	private ImageView retiredPhoto;
	@FXML
	private Label laState;
	@FXML
	private Label laST;
	@FXML
	private Label laLeEmp;
	@FXML
	private TextArea laLeArea;
	@FXML
	private Label laLeNa;
	@FXML
	private Label laLeGen;
	@FXML
	private Label laLeDay;
	@FXML
	private Label laLePo;
	@FXML
	private Label laLeDe;
	@FXML
	private Label laReEmp;
	@FXML
	private Label laReNa;
	@FXML
	private Label laReGen;
	@FXML
	private Label laReDe;
	@FXML
	private Label laRePos;
	@FXML
	private Label laReEmpDay;
	@FXML
	private Label laReDay;
	@FXML
	private TextArea txtReArea;
	

	private ObservableList<String> list;
	private ObservableList<String> leave;
	private ObservableList<String> retired;
	private static PersonnelDAO dao = new PersonnelDAO();
	private static PersonnelFunction pf = new PersonnelFunction();
	private static SalaryManageFunction sf = new SalaryManageFunction();

	public void initialize(URL location, ResourceBundle resources) {
	
		leave = FXCollections.observableArrayList();
		retired = FXCollections.observableArrayList();
		dao.leaveList(leave);
		dao.retiredList(retired);
		leaveList.setItems(leave);
		retiredList.setItems(retired);
		
		
		btnDel.setVisible(false);
		btnLeDel.setVisible(false);
		btnSal.setVisible(false);
		btnReDel.setVisible(false);
		btnRight.setVisible(false);
		laST.setVisible(false);
		laState.setVisible(false);
		btnLeft.setVisible(false);
		btnLeft.setDisable(true);
		
		txtReArea.setDisable(true);
		laLeArea.setDisable(true);
		
		listView.setOnMouseClicked(event -> listViewSelect(event));
		leaveList.setOnMouseClicked(event -> leaveSelect(event));
		retiredList.setOnMouseClicked(event -> retiredSelect(event));

		btnRight.setOnAction(event -> btnRightAction(event));
		btnLeft.setOnAction(event -> btnLeftAction(event));
		btnAdd.setOnAction(event -> btnAdd(event));
		btnLeAdd.setOnAction(event -> btnLeAdd(event));
		btnReAdd.setOnAction(event -> btnReAdd(event));
		
		btnDel.setOnAction(event -> btnDel(event));
		btnLeDel.setOnAction(event -> btnLeDel(event));
		btnReDel.setOnAction(event -> btnReDel(event));
		btnSal.setOnAction(event -> btnSal(event));
	
		
		cmbDepart.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {

			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				list = FXCollections.observableArrayList();
				dao.EmployeeList(list, cmbDepart.getValue().toString());
				listView.setItems(list);
				pf.setDepart(cmbDepart.getValue().toString());
			}
		});
		
		

	}

	

	public void btnRightAction(ActionEvent e) {
		pf.fillInfoEmpUrl(changePane);
		btnRight.setDisable(true);
		btnLeft.setDisable(false);
	}
	
	
	
	public void btnLeftAction(ActionEvent e) {
		pf.fillInfoPerUrl(changePane);
		btnRight.setDisable(false);
		btnLeft.setDisable(true);
	}

	public void listViewSelect(MouseEvent e) {
		btnRight.setDisable(false);
		btnLeft.setDisable(true);
		String url = pf.changeImage(listView.getSelectionModel().getSelectedIndex());
		pf.fillInfoPerUrl(changePane);
		dao.state(laST);
		btnDel.setVisible(true);
		btnRight.setVisible(true);
		btnSal.setVisible(true);
		laST.setVisible(true);
		laState.setVisible(true);
		btnLeft.setVisible(true);
		
		try {
			idPhoto.setImage(new Image(getClass().getResource(url).toString()));
		} catch (Exception e2) {
			idPhoto.setImage(new Image(getClass().getResource("/View/images/defa.jpg").toString()));
		}
	}

	public void btnAdd(ActionEvent e) {
		pf.addEmp();
		pf.setEmpList(list, listView);
			
	}
	
	public void btnDel(ActionEvent e) {
		dao.EmpDel();
		list.clear();
		dao.EmployeeList(list, cmbDepart.getValue().toString());
		listView.setItems(list);
	}
	
	// leave Employee Tab
	
	public void leaveSelect(MouseEvent e) {
		btnLeDel.setVisible(true);
		String url = pf.changeLeaveImage(leaveList.getSelectionModel().getSelectedIndex());
		try {
			leavePhoto.setImage(new Image(getClass().getResource(url).toString()));
		} catch (Exception e2) {
			leavePhoto.setImage(new Image(getClass().getResource("/View/images/defa.jpg").toString()));
		}
		dao.leaveEmp(laLeEmp, laLeGen, laLeNa, laLeDe, laLePo, laLeDay, laLeArea);
	}
	
	public void btnLeAdd(ActionEvent e) {
		pf.addLeEmp();
		pf.setLeaveList(leave, leaveList);
	}
	
	public void btnLeDel(ActionEvent e) {
		pf.delLeEmp(leaveList.getSelectionModel().getSelectedIndex());
		leaveList.getItems().clear();
		dao.leaveList(leave);
		leaveList.setItems(leave);
	}
	
	// retired Employee Tab
	
	public void retiredSelect(MouseEvent e) {
		btnReDel.setVisible(true);
		String url = pf.changeretiredImage(retiredList.getSelectionModel().getSelectedIndex());
		try {
			retiredPhoto.setImage(new Image(getClass().getResource(url).toString()));
		} catch (Exception e2) {
			retiredPhoto.setImage(new Image(getClass().getResource("/View/images/defa.jpg").toString()));
		}
		dao.retiredEmp(laReEmp, laReNa, laReGen, laReDe, laRePos, laReEmpDay, laReDay, txtReArea);
		
	}
	
	public void btnReAdd(ActionEvent e) {
		pf.addReEmp();
		pf.setretiredList(retired, retiredList);
	}
	
	public void btnReDel(ActionEvent e) {
		pf.delReEmp(retiredList.getSelectionModel().getSelectedIndex());
		retiredList.getItems().clear();
		dao.retiredList(retired);
		retiredList.setItems(retired);
	}
	
	// Salary Manage
	
	public void btnSal(ActionEvent e) {
		sf.addSalary();
	}
}
