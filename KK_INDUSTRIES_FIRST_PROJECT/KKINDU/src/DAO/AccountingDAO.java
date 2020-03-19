package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

import Controller.DBUtill;
import Function.AccountingFunction;
import Model.Accounting;
import Model.Purchar;
import Model.PurcharFill;
import javafx.collections.ObservableList;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

public class AccountingDAO {
	static private DBUtill dbu = new DBUtill();
	static private Connection conn = null;
	static private PreparedStatement pstmt = null;
	static private ResultSet rs = null;
	private static String date;
	private static AccountingDAO instance;
	private static AccountingFunction af = new AccountingFunction();
	private static ArrayList<Integer> accountCode;
	private static ArrayList<String> clientNo;
	private static int sumSale;
	private static int sumPurchase;

	public static AccountingDAO getInstance() {
		if (instance == null) {
			instance = new AccountingDAO();
		}
		return instance;
	}

	public void AccountView(ObservableList<Accounting> list, LocalDate ld, Label laBa) {
		int debit = 0;
		int credit = 0;
		int bal = 0;

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select * from accounting_manage where TO_DATE(ac_date,'yy-mm-dd') = ? ");
			date = ld.toString();
			pstmt.setString(1, date);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Accounting a = new Accounting();
				a.setDay(rs.getString(1).substring(8, 10));
				a.setNum(rs.getInt(2));
				a.setClassf(rs.getString(3));
				a.setCode(Integer.toString(rs.getInt(4)));
				a.setClient(rs.getString(5));
				a.setDescription(rs.getString(6));
				a.setDebit(rs.getInt(7));
				a.setCredit(rs.getInt(8));
				debit += rs.getInt(7);
				credit += rs.getInt(8);
				list.add(a);
			}
			int val = Math.abs(credit - debit);
			laBa.setText(Integer.toString(val));
			this.codeInfo(list);
			this.clientInfo(list);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void codeInfo(ObservableList<Accounting> list) {

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select ac_subject from accounting_code where ac_code = ?");
			for (Accounting a : list) {
				int x = Integer.parseInt(a.getCode());
				pstmt.setInt(1, x);
				rs = pstmt.executeQuery();
				rs.next();
				a.setCode("[ " + x + " ] " + rs.getString(1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void clientInfo(ObservableList<Accounting> list) {

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select cm_companyname from client_manage where client_no = ?");
			for (Accounting a : list) {
				String no = a.getClient();
				pstmt.setString(1, no);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					a.setClient(rs.getString(1));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// Accounting Add Tab

	public void InsertAcc(ComboBox<String> cmbClass, TextField txtCode, TextField txtClient, TextField txtDes,
			TextField txtDebit, TextField txtCredit) {
		try {
			int x;
			if (af.getBalanceAcc() == 0) {
				x = this.getAccNum() + 1;
			} else {
				x = this.getAccNum();
			}
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"insert into accounting_manage (ac_date, ac_num, ac_drcr, ac_code, client_no, ac_note, ac_debit, ac_credit) values( ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, date);
			pstmt.setInt(2, x);
			pstmt.setString(3, cmbClass.getValue());
			pstmt.setInt(4, Integer.parseInt(txtCode.getText()));
			pstmt.setString(5, txtClient.getText());
			pstmt.setString(6, txtDes.getText());
			if (txtDebit.isDisable()) {
				pstmt.setInt(7, 0);
			} else {
				pstmt.setInt(7, Integer.parseInt(txtDebit.getText()));
			}
			if (txtCredit.isDisable()) {
				pstmt.setInt(8, 0);
			} else {
				pstmt.setInt(8, Integer.parseInt(txtCredit.getText()));
			}

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getAccNum() {
		int val = 0;
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select ac_num from accounting_manage where ac_date = ?");
			pstmt.setString(1, date);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				val = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return val;
	}

	// search code tab
	public void searchCode(ObservableList<String> list, TextField text) {
		accountCode = new ArrayList<Integer>();
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select ac_code, ac_subject from accounting_code where regexp_like(ac_subject, ? ) order by ac_code");
			pstmt.setString(1, text.getText());
			rs = pstmt.executeQuery();
			String s = null;
			while (rs.next()) {
				s = "[ " + rs.getString(1) + " ] " + rs.getString(2);
				accountCode.add(rs.getInt(1));
				list.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getSearchCode(int index) {
		return accountCode.get(index);
	}

	// Client search tab

	public void searchClient(ObservableList<String> list, TextField text) {
		clientNo = new ArrayList<String>();
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select client_no, cm_companyname from client_manage where regexp_like(lower(cm_companyname), ? )");
			pstmt.setString(1, text.getText());
			rs = pstmt.executeQuery();
			String s = null;
			while (rs.next()) {
				s = "[ " + rs.getString(1) + " ] " + rs.getString(2);
				clientNo.add(rs.getString(1));
				list.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getClientNo(int index) {
		return clientNo.get(index);
	}

	public void valClient(ObservableList<String> list) {
		clientNo = new ArrayList<String>();
		try {
			conn = dbu.getConnection();

			pstmt = conn.prepareStatement("select client_no, cm_companyname from client_manage");
			rs = pstmt.executeQuery();
			String s = null;
			while (rs.next()) {
				s = "[ " + rs.getString(1) + " ] " + rs.getString(2);
				clientNo.add(rs.getString(1));
				list.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// Pur&Char tab

	public void PurcharView(ObservableList<Purchar> list, LocalDate ld, Label laBa) {
		int debit = 0;
		int credit = 0;
		int bal = 0;

		try {

			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select * from purchase_sale where TO_DATE(ps_date,'yy-mm-dd') = ? ");
			date = ld.toString();
			System.out.println(date);
			pstmt.setString(1, date);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Purchar p = new Purchar();
				p.setDay(rs.getString(1).substring(8, 10));
				p.setNum(rs.getInt(2));
				p.setType(rs.getString(3));
				p.setCode(Integer.toString(rs.getInt(4)));
				p.setUnit(rs.getInt(5));
				p.setSupply(rs.getInt(6));
				p.setVat(rs.getInt(7));
				p.setClient(rs.getString(8));
				p.setKind(rs.getString(9));
				p.setJournal(rs.getString(10));
				p.setQuantity(rs.getInt(11));
				list.add(p);
			}
			this.sumSales();
			this.sumPurchase();
			int val = sumSale - sumPurchase;
			laBa.setText(Integer.toString(val));
			this.psCodeInfo(list);
			this.psClientInfo(list);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void sumSales() {
		sumSale = 0;
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select ps_supply from purchase_sale where ps_type = 'Sales'");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sumSale += rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void sumPurchase() {
		sumPurchase = 0;
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select ps_supply from purchase_sale where ps_type = 'Purchase'");
			rs = pstmt.executeQuery();
			String s = null;
			while (rs.next()) {
				sumPurchase += rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void psCodeInfo(ObservableList<Purchar> list) {

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select ac_subject from accounting_code where ac_code = ?");
			for (Purchar a : list) {
				int x = Integer.parseInt(a.getCode());
				pstmt.setInt(1, x);
				rs = pstmt.executeQuery();
				rs.next();
				a.setCode("[ " + x + " ] " + rs.getString(1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void psClientInfo(ObservableList<Purchar> list) {

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select cm_companyname from client_manage where client_no = ?");
			for (Purchar a : list) {
				String no = a.getClient();
				pstmt.setString(1, no);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					a.setClient(rs.getString(1));
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int getPsNum() {
		int val = 0;
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select ps_num from purchase_sale where ps_date = ?");
			pstmt.setString(1, date);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				val = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return val;
	}

	public void InsertPs(ComboBox<String> cmbType, TextField txtCode, TextField txtAmount, TextField txtUnitCost,
			Label laSupply, Label laVat, TextField txtClient, ComboBox<String> cmbKind, ComboBox<String> cmbJournal) {

		try {
			int x = this.getPsNum() + 2;
			System.out.println(x);
			System.out.println(this.getPsNum());
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"insert into purchase_sale (ps_date, ps_num, ps_type, ac_code, ps_count, ps_unitcost, ps_supply, ps_surtax, client_no, ps_kind, PS_JOURNAL) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, date);
			pstmt.setInt(2, x);
			pstmt.setString(3, cmbType.getValue());
			pstmt.setInt(4, Integer.parseInt(txtCode.getText()));
			pstmt.setInt(6, Integer.parseInt(txtUnitCost.getText()));
			pstmt.setInt(7, Integer.parseInt(laSupply.getText()));
			pstmt.setInt(8, Integer.parseInt(laVat.getText()));
			pstmt.setString(9, txtClient.getText());
			pstmt.setString(10, cmbKind.getValue());
			pstmt.setString(11, cmbJournal.getValue());
			if (txtAmount.isDisable()) {
				pstmt.setInt(5, 0);
			} else {
				pstmt.setInt(5, Integer.parseInt(txtAmount.getText()));
			}
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// Financial Status Table
	public void fillAssats(Label laDe1, Label laDe2, Label laDe3, Label laDe4, Label laDe5, Label laDe6, Label laCre1,
			Label laCre2, Label laCre3, Label laCre4, Label laCre5, Label laCre6) {

		try {
			conn = dbu.getConnection();
			int sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_debit from accounting_manage ac, accounting_code cd where cd.ac_system =  '당좌자산' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laDe1.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_credit from accounting_manage ac, accounting_code cd where cd.ac_system =  '당좌자산' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laCre1.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_debit from accounting_manage ac, accounting_code cd where cd.ac_system =  '재고자산' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laDe2.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_credit from accounting_manage ac, accounting_code cd where cd.ac_system =  '재고자산' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laCre2.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_debit from accounting_manage ac, accounting_code cd where cd.ac_system =  '투자자산' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laDe3.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_credit from accounting_manage ac, accounting_code cd where cd.ac_system =  '투자자산' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laCre3.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_debit from accounting_manage ac, accounting_code cd where cd.ac_system =  '유형자산' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laDe4.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_credit from accounting_manage ac, accounting_code cd where cd.ac_system =  '유형자산' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laCre4.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_debit from accounting_manage ac, accounting_code cd where cd.ac_system =  '무형자산' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laDe5.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_credit from accounting_manage ac, accounting_code cd where cd.ac_system =  '무형자산' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laCre5.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_debit from accounting_manage ac, accounting_code cd where cd.ac_system =  '기타비유동자산' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laDe6.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_credit from accounting_manage ac, accounting_code cd where cd.ac_system =  '기타비유동자산' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laCre6.setText(Integer.toString(sum));

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void fillLiabilities(Label laLiDe, Label laLiCre, Label laNoLiDe, Label laNoLiCre) {
		try {
			conn = dbu.getConnection();
			int sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_debit from accounting_manage ac, accounting_code cd where cd.ac_system =  '유동부채' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laLiDe.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_credit from accounting_manage ac, accounting_code cd where cd.ac_system =  '유동부채' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laLiCre.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_debit from accounting_manage ac, accounting_code cd where cd.ac_system =  '비유동부채' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laNoLiDe.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_credit from accounting_manage ac, accounting_code cd where cd.ac_system =  '비유동부채' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laNoLiCre.setText(Integer.toString(sum));

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void fillStock(Label laStoDe, Label laStoCre) {
		try {
			conn = dbu.getConnection();
			int sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_debit from accounting_manage ac, accounting_code cd where cd.ac_system =  '자본금' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laStoDe.setText(Integer.toString(sum));

			sum = 0;
			pstmt = conn.prepareStatement(
					"select ac.ac_credit from accounting_manage ac, accounting_code cd where cd.ac_system =  '자본금' and ac.ac_code = cd.ac_code ");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sum += rs.getInt(1);
			}
			laStoCre.setText(Integer.toString(sum));

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// Purchas sale slip

	public void fillPsTotal(ObservableList<PurcharFill> list, DatePicker date1, DatePicker date2) {

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select ps_type, ps_date, ac_code, ps_supply, ps_surtax from purchase_sale where TO_DATE(ps_date,'yy-mm-dd') > ? and TO_DATE(ps_date,'yy-mm-dd') < ? ");

			pstmt.setString(1, date1.getValue().toString());
			pstmt.setString(2, date2.getValue().toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PurcharFill pf = new PurcharFill();
				pf.setDay(rs.getString(2).substring(8, 10));
				pf.setType(rs.getString(1));
				pf.setCode(Integer.toString(rs.getInt(3)));
				pf.setSupply(rs.getInt(4));
				pf.setVat(rs.getInt(5));
				pf.setConsumer(rs.getInt(4) + rs.getInt(5));
				list.add(pf);
			}

			this.codeInfoFill(list);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void codeInfoFill(ObservableList<PurcharFill> list) {

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select ac_subject from accounting_code where ac_code = ?");
			for (PurcharFill a : list) {
				int x = Integer.parseInt(a.getCode());
				pstmt.setInt(1, x);
				rs = pstmt.executeQuery();
				rs.next();
				a.setCode("[ " + x + " ] " + rs.getString(1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void fillPsSales(ObservableList<PurcharFill> list, DatePicker date1, DatePicker date2) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select ps_type, ps_date, ac_code, ps_supply, ps_surtax from purchase_sale where (TO_DATE(ps_date,'yy-mm-dd') > ? and TO_DATE(ps_date,'yy-mm-dd') < ? ) and ps_type = 'Sales'");

			pstmt.setString(1, date1.getValue().toString());
			pstmt.setString(2, date2.getValue().toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PurcharFill pf = new PurcharFill();
				pf.setDay(rs.getString(2).substring(8, 10));
				pf.setType(rs.getString(1));
				pf.setCode(Integer.toString(rs.getInt(3)));
				pf.setSupply(rs.getInt(4));
				pf.setVat(rs.getInt(5));
				pf.setConsumer(rs.getInt(4) + rs.getInt(5));
				list.add(pf);
			}

			this.codeInfoFill(list);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void fillPsPur(ObservableList<PurcharFill> list, DatePicker date1, DatePicker date2) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select ps_type, ps_date, ac_code, ps_supply, ps_surtax from purchase_sale where (TO_DATE(ps_date,'yy-mm-dd') > ? and TO_DATE(ps_date,'yy-mm-dd') < ? ) and ps_type = 'Purchase'");

			pstmt.setString(1, date1.getValue().toString());
			pstmt.setString(2, date2.getValue().toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PurcharFill pf = new PurcharFill();
				pf.setDay(rs.getString(2).substring(8, 10));
				pf.setType(rs.getString(1));
				pf.setCode(Integer.toString(rs.getInt(3)));
				pf.setSupply(rs.getInt(4));
				pf.setVat(rs.getInt(5));
				pf.setConsumer(rs.getInt(4) + rs.getInt(5));
				list.add(pf);
			}

			this.codeInfoFill(list);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
