package Controller;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import DAO.OrderManageDAO;
import Function.OrderManageFunction;
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
import javafx.scene.control.TextArea;
import javafx.scene.input.MouseEvent;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class OrderController implements Initializable {
	@FXML private Label laOrderNo;
	@FXML private Label laClient;
	@FXML private Label laName;
	@FXML private Label laSector;
	@FXML private Label laClass;
	@FXML private Label laDead;
	@FXML private Label laHope;
	@FXML private Label laStatus;
	@FXML private Label laView;
	@FXML private TextArea txtReq;
	@FXML private ListView<String> listView;
	@FXML private Button btnAdd;
	private ObservableList<String> list;
	OrderManageFunction omf = new OrderManageFunction();
	OrderManageDAO dao = new OrderManageDAO();
	

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		listView.setOnMouseClicked(event -> listViewSelect(event));
		laView.setOnMouseClicked(event -> laViewClick(event));
		list = FXCollections.observableArrayList();
		dao.OrderManageList(list);
		listView.setItems(list);
		laView.setVisible(false);
		omf.setList(list, listView);
		btnAdd.setOnAction(event -> btnAdd(event));
		
	}
	
	public void listViewSelect(MouseEvent e) {
		omf.setIndex(listView.getSelectionModel().getSelectedIndex());
		dao.fillInfoOm(laOrderNo, laClient, laName, laSector, laClass, laDead, laHope, laStatus, txtReq);
		laView.setVisible(true);
		
	}
	
	public void laViewClick(MouseEvent e) {
		omf.viewMore();
	}
	
	public void btnAdd(ActionEvent e) {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.setTitle("Order Add");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/order_add.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			
			e1.printStackTrace();
		}
	}

}
