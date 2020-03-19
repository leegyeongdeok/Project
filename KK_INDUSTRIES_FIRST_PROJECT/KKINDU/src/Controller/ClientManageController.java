package Controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

import DAO.ClientManageDAO;
import Function.ClientManageFunction;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.BorderPane;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class ClientManageController implements Initializable {

	@FXML private ListView<String> listView;
	@FXML private BorderPane changePane;
	@FXML private Label laClientNO;
	@FXML private Label laCName;
	@FXML private Label laBSector;
	@FXML private Label laBLNumber;
	@FXML private Label laRName;
	@FXML private Label laRRNumber;
	@FXML private Label laPhone;
	@FXML private Label laAddress;
	@FXML private Label laEICharge;
	@FXML private Label laEICNumber;
	@FXML private Button btnAdd;
	@FXML private Button btnDel;
	private ObservableList<String> list;

	ClientManageDAO dao = new ClientManageDAO();
	
	
	private static ClientManageFunction cmf = new ClientManageFunction();

	public void initialize(URL location, ResourceBundle resources) {
		btnDel.setDisable(true);
		listView.setOnMouseClicked(event -> listViewSelect(event));
		list = FXCollections.observableArrayList();
		dao.ClientManageList(list);
		listView.setItems(list);
		btnAdd.setOnAction(event -> btnAdd(event));
		btnDel.setOnAction(event -> btnDel(event));
	
	}
	
	public void listViewSelect(MouseEvent e) {
		btnDel.setDisable(false);
		cmf.setClientNo(listView.getSelectionModel().getSelectedIndex());
		dao.fillInfoCM(laClientNO, laBSector, laCName, laBLNumber, laRName, laRRNumber, laPhone, laAddress, laEICharge, laEICNumber);
		
	}
	
	public void btnAdd(ActionEvent e) {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.initModality(Modality.WINDOW_MODAL);
		dialog.initOwner(btnAdd.getScene().getWindow());
		dialog.setTitle("Client Information Add");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/client_manage_add.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			
			e1.printStackTrace();
		}
		
		cmf.setView(listView);
	}
	
	public void btnDel(ActionEvent e) {
		dao.ClientDel(cmf.getClientNO());
		list = FXCollections.observableArrayList();
		dao.ClientManageList(list);
		listView.setItems(list);
	}
	
	
}
