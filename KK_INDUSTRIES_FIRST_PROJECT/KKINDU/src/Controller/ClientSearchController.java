package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import DAO.AccountingDAO;
import Function.AccountingFunction;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

public class ClientSearchController implements Initializable {
	
	@FXML private TextField txtVal;
	@FXML private ListView<String> listView;
	private ObservableList<String> list;
	private static AccountingDAO dao = new AccountingDAO();
	private static AccountingFunction af = new AccountingFunction();

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		list = FXCollections.observableArrayList();
		dao.valClient(list);
		listView.setItems(list);
		listView.setOnMouseClicked(event -> listViewSelect(event));
		
		txtVal.textProperty().addListener(new ChangeListener<String>() {
		
			@Override
			public void changed(ObservableValue<? extends String> observable, String oldValue, String newValue) {
				if(newValue.isEmpty()) {
					list.clear();
					dao.valClient(list);
					
				}else {
					list.clear();
					dao.searchClient(list, txtVal);
					listView.setItems(list);
				}
				
				
				
			}
		});
		
	}
	
	public void listViewSelect(MouseEvent e) {
		if(e.getClickCount() >= 2) {
			af.setSearchClient(listView.getSelectionModel().getSelectedIndex());
			Stage s = (Stage) listView.getScene().getWindow();
			s.close();
		}
	}

}
