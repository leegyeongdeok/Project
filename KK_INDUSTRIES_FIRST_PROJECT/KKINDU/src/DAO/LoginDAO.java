package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Controller.DBUtill;
import Function.LoginFunction;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Label;
import javafx.stage.Stage;

public class LoginDAO {
	static private LoginFunction lf;
	static private DBUtill dbu = new DBUtill();
	static private Connection conn = null;
	static private PreparedStatement pstmt = null;
	static private ResultSet rs = null;
	private static LoginDAO instance;
	private static String workerNo;
	private static String depart;
	

	public static LoginDAO getInstance() {
		if (instance == null) {
			instance = new LoginDAO();
		}
		return instance;
	}

	

	public void login(String id, String pw, Stage stage) {
		conn = null;
		pstmt = null;
		
		PreparedStatement pstmtBan = null;
		lf = new LoginFunction();

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select u.user_id, u.user_pw, u.user_class from user_info u where user_id = ? and user_pw = ?");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();
			pstmtBan = conn.prepareStatement("select u.user_ban from user_info u where user_id = ?");
			pstmtBan.setString(1, id);
			ResultSet rsBan = pstmtBan.executeQuery();
			
			if(rsBan.next()) {
				int banVal = rsBan.getInt(1);
				lf.banId(banVal);
			}
			
			lf.opperationLogin(rs.next(), id, stage);

		} catch (Exception e) {
			e.printStackTrace();

		}
	}
	
	public String checkDepart(String id) {
		conn = null;
		pstmt = null;
		
		
		String val = " ";

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select user_class, worker_no from user_info where user_id = ?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				val = rs.getString(1);
				workerNo = rs.getString(2);
				System.out.println(val);

			} else {
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return val;
	}
	
	public void ban(String id) {
		conn = null;
		pstmt = null;
		

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("update user_info set user_ban = 1 where user_id = ?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	
	// AccLoginView Tab
	public void LoginView(Label laNa, Label laPos) {
		
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select e.ei_name, e.ei_position from user_info u, employee_info e where e.worker_no = ? ");
			pstmt.setString(1, workerNo);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			laNa.setText(rs.getString(1));
			laPos.setText(rs.getString(2));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	public void LoginView(Label laNa, Label laPos, Label laDepart) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select e.ei_name, e.ei_position, e.ei_department from user_info u, employee_info e where e.worker_no = ? ");
			pstmt.setString(1, workerNo);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			laNa.setText(rs.getString(1));
			laPos.setText(rs.getString(2));
			laDepart.setText(rs.getString(3)+" Department");
			depart = rs.getString(3);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public String getDepart() {
		return depart;
		
	}
	

}
