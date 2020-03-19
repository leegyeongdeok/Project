package Function;

import java.io.IOException;

import DAO.ClientManageDAO;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ListView;
import javafx.stage.Modality;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class ClientManageFunction {
	
	static boolean sequence;
	private static ClientManageDAO dao = new ClientManageDAO().getInstance();
	private static int index;
	private static String ClientNO = null;
	private static ListView<String> view;
	private ObservableList<String> list;

	public void addClient() {
		Stage dialog = new Stage(StageStyle.UTILITY);
		dialog.initModality(Modality.WINDOW_MODAL);
		dialog.setTitle("Client Add");

		try {
			Parent parent = FXMLLoader.load(getClass().getResource("/View/client_manage_add.fxml"));
			Scene scene = new Scene(parent);
			dialog.setScene(scene);
			dialog.setResizable(false);
			dialog.show();
		} catch (IOException e1) {
			e1.printStackTrace();
		} 
	}
	
	public void setClientNo(int index) {
		ClientNO = dao.getClientNO(index);
	}
	
	public String getClientNO() {
		return ClientNO;
	}
	

	public void setView(ListView<String> listView) {
		view = listView;
	}
	
	public void refreshView() {
		list = FXCollections.observableArrayList();
		dao.ClientManageList(list);
		view.setItems(list);
	}


}
