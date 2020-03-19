package Controller;

import java.net.URL;
import java.util.ResourceBundle;

import DAO.AccountingDAO;
import Function.AccountingFunction;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;

public class FinancialController implements Initializable {
	
	@FXML private Label laAsDe;
	@FXML private Label laAsCre;
	@FXML private Label laDe1;
	@FXML private Label laDe2;
	@FXML private Label laDe3;
	@FXML private Label laDe4;
	@FXML private Label laDe5;
	@FXML private Label laDe6;
	@FXML private Label laCre1;
	@FXML private Label laCre2;
	@FXML private Label laCre3;
	@FXML private Label laCre4;
	@FXML private Label laCre5;
	@FXML private Label laCre6;
	@FXML private Label laNonDe;
	@FXML private Label laNonCre;
	@FXML private Label laAsTotalDe;
	@FXML private Label laAsTotalCre;
	@FXML private Label laLiDe;
	@FXML private Label laLiCre;
	@FXML private Label laNoLiDe;
	@FXML private Label laNoLiCre;
	@FXML private Label laLiTotalDe;
	@FXML private Label laLiTotalCre;
	@FXML private Label laStoDe;
	@FXML private Label laStoCre;
	@FXML private Label laStoTotalDe;
	@FXML private Label laStoTotalCre;
	@FXML private Label laTotalDe;
	@FXML private Label laTotalCre;

	private static AccountingDAO dao = new AccountingDAO();
	private static AccountingFunction af = new AccountingFunction();

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		dao.fillAssats(laDe1, laDe2, laDe3, laDe4, laDe5, laDe6, laCre1, laCre2, laCre3, laCre4, laCre5, laCre6);
		laAsDe.setText(Integer.toString(Integer.parseInt(laDe1.getText())+Integer.parseInt(laDe2.getText())));
		laAsCre.setText(Integer.toString(Integer.parseInt(laCre1.getText())+Integer.parseInt(laCre2.getText())));
		laNonDe.setText(Integer.toString(Integer.parseInt(laDe1.getText())+Integer.parseInt(laDe2.getText())+Integer.parseInt(laDe3.getText())));
		laNonCre.setText(Integer.toString(Integer.parseInt(laCre1.getText())+Integer.parseInt(laCre2.getText())+Integer.parseInt(laCre3.getText())));
		laAsTotalDe.setText(Integer.toString(Integer.parseInt(laAsDe.getText())+Integer.parseInt(laNonDe.getText())));
		laAsTotalCre.setText(Integer.toString(Integer.parseInt(laAsCre.getText())+Integer.parseInt(laNonCre.getText())));
		dao.fillLiabilities(laLiDe, laLiCre, laNoLiDe, laNoLiCre);
		laLiTotalDe.setText(Integer.toString(Integer.parseInt(laLiDe.getText())+Integer.parseInt(laNoLiDe.getText())));
		laLiTotalCre.setText(Integer.toString(Integer.parseInt(laLiCre.getText())+Integer.parseInt(laNoLiCre.getText())));
		dao.fillStock(laStoDe, laStoCre);
		laStoTotalDe.setText(laStoDe.getText());
		laStoTotalCre.setText(laStoCre.getText());
		laTotalDe.setText(Integer.toString(Integer.parseInt(laStoTotalDe.getText())+Integer.parseInt(laTotalDe.getText())));
		laTotalCre.setText(Integer.toString(Integer.parseInt(laStoTotalCre.getText())+Integer.parseInt(laTotalCre.getText())));
	}

}
