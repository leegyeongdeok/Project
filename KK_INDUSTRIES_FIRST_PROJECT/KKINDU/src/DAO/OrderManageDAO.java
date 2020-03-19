package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Controller.DBUtill;
import Function.OrderManageFunction;
import javafx.collections.ObservableList;
import javafx.concurrent.Task;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

public class OrderManageDAO {

	static private OrderManageFunction omf = new OrderManageFunction();
	static private DBUtill dbu = new DBUtill();
	static private Connection conn = null;
	static private PreparedStatement pstmt = null;
	static private ResultSet rs = null;
	private static OrderManageDAO instance;
	private static ArrayList<String> ordermanagelist;
	private static ArrayList<String> orderNolist;
	private static ArrayList<String> clientNolist;
	private static ArrayList<String> workerNolist;
	private static double progressDouble;
	private static ProgressBar pg;
	private static Label lapro;

	public static OrderManageDAO getInstance() {
		if (instance == null) {
			instance = new OrderManageDAO();
		}
		return instance;
	}

	public void OrderManageList(ObservableList<String> list) {
		ordermanagelist = new ArrayList<String>();
		orderNolist = new ArrayList<String>();
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"SELECT c.cm_companyname, c.client_no, o.order_no FROM CLIENT_MANAGE c, order_manage o where c.client_no = o.client_no");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1) + " [ " + rs.getString(3) + " ]");
				ordermanagelist.add(rs.getString(2));
				orderNolist.add(rs.getString(3));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getClientNo(int index) {
		return ordermanagelist.get(index);
	}

	public String getOrderNo(int index) {
		return orderNolist.get(index);
	}

	public void fillInfoOm(Label laOrderNo, Label laClient, Label laName, Label laSector, Label laClass, Label laDead,
			Label laHope, Label laStatus, TextArea txtReq) {

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"SELECT o.order_no, o.client_no, c.cm_companyname, c.cm_typeob, o.om_class, o.om_deadline, o.om_hopeman, o.om_status , o.om_req from order_manage o, client_manage c  WHERE c.CLIENT_NO = ? and o.order_no = ?");
			pstmt.setString(1, omf.getClientNo());
			pstmt.setString(2, omf.getOrderNo());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				laOrderNo.setText(rs.getString(1));
				laClient.setText(rs.getString(2));
				laName.setText(rs.getString(3));
				laSector.setText(rs.getString(4));
				laClass.setText(rs.getString(5));
				laDead.setText(rs.getString(6).substring(0, 10));
				laHope.setText(rs.getString(7));
				laStatus.setText(rs.getString(8));
				txtReq.setText(rs.getString(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public String status() {
		String val = "no";
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select om_status from order_manage where order_no = ? ");
			pstmt.setString(1, omf.getOrderNo());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				val = rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return val;
	}

	// Project Fxml
	public void project(Label laName, Label laOrderNo, Label laEmpNo, Label laEmpName, Label laPos, Label laPhone, Label laDead) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select o.order_no, o.om_hopeman, e.ei_name, e.ei_position, e.ei_phone, o.om_deadline, p.pm_progs, p.pm_projectname from order_manage o, employee_info e, project_manage p where o.order_no = ? and e.worker_no = o.om_hopeman and p.order_no = ?");
			pstmt.setString(1, omf.getOrderNo());
			pstmt.setString(2, omf.getOrderNo());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				laOrderNo.setText(rs.getString(1));
				laEmpNo.setText(rs.getString(2));
				laEmpName.setText(rs.getString(3));
				laPos.setText(rs.getString(4));
				laPhone.setText(rs.getString(5));
				laDead.setText(rs.getString(6).substring(0, 10));
				progressDouble = rs.getDouble(7);
				laName.setText(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public double getProjectPro() {
		return progressDouble;
	}

	// AfterService Fxml

	public void AfterService(Label laOrderNo, Label laClientNo, Label laCompany, Label laDate, TextArea txtReq,
			TextArea txtLog) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"SELECT o.order_no, o.client_no, c.cm_companyname, a.as_period, a.as_req, a.as_update_log from order_manage o, as_manage a, client_manage c  WHERE o.client_no = ? and c.client_no = ? and o.client_no = a.client_no and o.order_no = a.order_no");
			pstmt.setString(1, omf.getClientNo());
			pstmt.setString(2, omf.getClientNo());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				laOrderNo.setText(rs.getString(1));
				laClientNo.setText(rs.getString(2));
				laCompany.setText(rs.getString(3));
				laDate.setText(rs.getString(4).substring(0, 10));
				txtReq.setText(rs.getString(5));
				txtLog.setText(rs.getString(6));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Order Add Tab
	
	public void hopeEmp(ObservableList<String> list) {
		workerNolist = new ArrayList<String>();

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"SELECT worker_no, ei_name FROM employee_info where ei_name != 'Admin' and (ei_department = 'Development' or ei_department = 'Master')");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(2));
				workerNolist.add(rs.getString(1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	
	public void OrderAddList(ObservableList<String> list) {
		clientNolist = new ArrayList<String>();

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("SELECT c.cm_companyname, c.client_no FROM CLIENT_MANAGE c ");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
				clientNolist.add(rs.getString(2));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertOrder(DatePicker date, ComboBox<String> cmbHope, TextArea txtReq, ComboBox<String> cmbClass, ComboBox<String> cmbCompany, TextField txtPro) {
		int index = Integer.parseInt(orderNolist.get(orderNolist.size()-1).substring(1)) + 1;
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("insert into order_manage (order_no, om_deadline, om_req, om_class, om_hopeman, client_no) values( ?, ?, ?, ?, ?, ? )");
			pstmt.setString(1,"O"+index);
			pstmt.setString(2, date.getValue().toString());
			pstmt.setString(3, txtReq.getText());
			pstmt.setString(4, cmbClass.getValue());
			pstmt.setString(5, workerNolist.get(cmbHope.getSelectionModel().getSelectedIndex()));
			pstmt.setString(6, clientNolist.get(cmbCompany.getSelectionModel().getSelectedIndex()));
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("insert into project_manage (worker_no, order_no, pm_projectname) values( ?, ?, ?)");
			pstmt.setString(1, workerNolist.get(cmbHope.getSelectionModel().getSelectedIndex()));
			pstmt.setString(2, "O"+index);
			pstmt.setString(3, txtPro.getText());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	// progress tab
	public void updateProgress(TextField txtProg) {
		try {
			System.out.println("run");
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"update project_manage set PM_PROGS = ? where order_no = ? ");
			pstmt.setInt(1, Integer.parseInt(txtProg.getText()));
			pstmt.setString(2, omf.getOrderNo());
			pstmt.executeUpdate();


		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(getProjectPro());
		
		Task<Void> task = new Task<Void>() {
			@Override
			protected Void call() throws Exception {
				updateProgress(Integer.parseInt(txtProg.getText()), 10);
				return null;
			}
		};
		Thread thread = new Thread(task);
		thread.start();
		pg.progressProperty().bind(task.progressProperty());
		int per = (int)Integer.parseInt(txtProg.getText())*10;
		lapro.setText(Integer.toString(per)+"%");
	}
	
	public void setProgress(ProgressBar progress, Label laPer) {
		pg = progress;
		lapro = laPer;
	}
	

}
