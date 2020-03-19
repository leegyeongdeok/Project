package Function;

import java.io.IOException;

import DAO.OrderManageDAO;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ListView;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class OrderManageFunction {
	
	static boolean sequence;
	private static OrderManageDAO dao = new OrderManageDAO().getInstance();
	private static int index;
	private static String clientNo = null;
	private static String orderNo = null;
	private static ObservableList<String> order;
	private static ListView<String> orderList;

	public void setIndex(int index) {
		clientNo = dao.getClientNo(index);
		orderNo = dao.getOrderNo(index);
	}
	
	public String getClientNo() {
		return clientNo;
	}
	
	public String getOrderNo() {
		return orderNo;
	}
	
	public void viewMore() {
		String val = dao.status();
		Parent parent;
		Stage dialog;
		String fx = "";
			
		if(val.equals("Projecting")) {
			fx = "/View/project_manage_info.fxml";
		}else if(val.equals("AfterService")) {
			fx = "/View/afterservice_manage_info.fxml";
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

	public void setList(ObservableList<String> list, ListView<String> listView) {
		order = list;
		orderList = listView;
	}
	
	public void refreshList() {
			orderList.getItems().clear();
			dao.OrderManageList(order);
			orderList.setItems(order);
	
	}
}
