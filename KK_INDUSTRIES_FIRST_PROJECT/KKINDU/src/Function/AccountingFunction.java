package Function;

import java.time.LocalDate;

import DAO.AccountingDAO;
import Model.Accounting;
import Model.Purchar;
import javafx.collections.ObservableList;
import javafx.scene.control.Label;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;

public class AccountingFunction {
	
	private static AccountingDAO dao = new AccountingDAO();
	private static String BalAcc ="0";
	private static String BalPur ="0";
	private static ObservableList<Accounting> accList;
	private static TableView<Accounting> accView;
	private static ObservableList<Purchar> purList;
	private static TableView<Purchar> purView;
	private static LocalDate accDate;
	private static Label accBal;
	private static LocalDate purDate;
	private static Label purBal;
	private static int searchCode;
	private static String searchClient;
	private static TextField txtCode;
	private static TextField txtClient;

	//account tab
	public void setRefreshAccount(ObservableList<Accounting> list, TableView<Accounting> tableView, LocalDate Date,
			Label laBa) {
		accList = list;
		accView = tableView;
		accDate = Date;
		accBal = laBa;
	}
	
	
	
	public int getBalanceAcc() {
		return Integer.parseInt(BalAcc);
	}
	
	public void refreshAccount() {
		accList.clear();
		
		dao.AccountView(accList, accDate, accBal);
		BalAcc = accBal.getText();
		accView.setItems(accList);
	}
	
	//purchase sales tab
	
	public void setRefreshPurchase(ObservableList<Purchar> list, TableView<Purchar> tableView, LocalDate Date,
			Label laBa) {
		purList = list;
		purView = tableView;
		purDate = Date;
		purBal = laBa;
	}
	
	public void refreshPurchase() {
		purList.clear();
		
		dao.PurcharView(purList, purDate, purBal);
		BalPur = purBal.getText();
		purView.setItems(purList);
	}
	
	public int getBalancePur() {
		return Integer.parseInt(BalPur);
	}

	
	//search code tab
	public void setSearchCode(int selectedIndex) {
		searchCode = dao.getSearchCode(selectedIndex);
		txtCode.setText(Integer.toString(searchCode));
	}
	
	public void setCodeVal(TextField code) {
		txtCode = code;	
	}

	
	//search client tab
	public void setSearchClient(int selectedIndex) {
		searchClient = dao.getClientNo(selectedIndex);
		txtClient.setText(searchClient);
	}
	
	public void setClientVal(TextField client) {
		txtClient = client;	
	}

	
	
}


