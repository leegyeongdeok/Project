package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import DAO.OrderManageDAO;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;

public class AfterserviceController implements Initializable {
	
	@FXML private Label laOrderNo;
	@FXML private Label laClientNo;
	@FXML private Label laCompany;
	@FXML private Label laDate;
	@FXML private TextArea txtReq;
	@FXML private TextArea txtLog;
	
	private OrderManageDAO dao = new OrderManageDAO();
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		dao.AfterService(laOrderNo, laClientNo, laCompany, laDate, txtReq, txtLog);
		
	}

}
