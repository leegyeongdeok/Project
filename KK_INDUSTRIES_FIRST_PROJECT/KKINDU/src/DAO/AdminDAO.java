package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Controller.DBUtill;
import Model.User;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.ObservableList;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

public class AdminDAO {
	static private DBUtill dbu = new DBUtill();
	static private Connection conn = null;
	static private PreparedStatement pstmt = null;
	static private ResultSet rs = null;
	private static AdminDAO instance;
	
	public static AdminDAO getInstance() {
		if (instance == null) {
			instance = new AdminDAO();
		}
		return instance;
	}
	
	public void UserView(ObservableList<User> list) {
		
		
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select u.user_id, u.user_pw, u.user_ban, e.ei_name, e.worker_no, e.ei_department, e.ei_position from user_info u, employee_info e where u.worker_no = e. worker_no");
			rs = pstmt.executeQuery();

			while(rs.next()) {
				User u = new User();
				String id = rs.getString(1);
				if(id.equals("admin")) continue;
				u.setId(id);
				u.setPw(rs.getString(2));

				int ban = rs.getInt(3);
				if (ban == 0)
					u.setBanned("Not Banned");
				else
					u.setBanned("Banned");
				
				u.setName(rs.getString(4));
				u.setEmployeeNo(rs.getString(5));
				u.setDepartment(rs.getString(6));
				u.setPosition(rs.getString(7));
				list.add(u);
			}
			
		} catch (Exception e) {

		} 
	}
	
	public void fillInfoUser(Label laEmpNo, Label laName, Label laGender, Label laResident, Label laPhone,
			Label laAddress, Label laBank, Label laAccount, Label laAcademic, String empNo) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select e.ei_name, e.ei_re_num, e.ei_phone, e.ei_address, s.sm_bank, s.sm_account, e.ei_eduinfo from employee_info e, salary_manage s where e.worker_no = ? and s.worker_no = ?");

			pstmt.setString(1, empNo);
			pstmt.setString(2, empNo);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				laEmpNo.setText(empNo);
				laName.setText(rs.getString(1));
				laResident.setText(rs.getString(2).substring(0, 6)+"-"+rs.getString(2).substring(7,8)+"******");
				if (Character.toString(rs.getString(2).charAt(7)).equals("1"))
					laGender.setText("Man");
				if (Character.toString(rs.getString(2).charAt(7)).equals("2"))
					laGender.setText("Women");

				laPhone.setText(rs.getString(3));
				laAddress.setText(rs.getString(4));
				laBank.setText(rs.getString(5));
				laAccount.setText(rs.getString(6));
				laAcademic.setText(rs.getString(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void fillInfoEmp(Label laDay, Label laDepartment, Label laPosition, Label laworkday,
			Label laAnnual, Label laProject, Label laBank, Label laFour, Label laHealth, Label laNational, String empNo) {

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select e.ei_empday, e.ei_department, e.ei_position, e.ei_workday, s.sm_annsalary, p.pm_projectname, s.sm_bank, s.sm_fourinsurance, s.sm_heinsurance, s.sm_napension from employee_info e, salary_manage s, project_manage p where s.worker_no = ? and e.worker_no = ? and p.worker_no = ?");
			pstmt.setString(1, empNo);
			pstmt.setString(2, empNo);
			pstmt.setString(3, empNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				laDay.setText(rs.getString(1).substring(0, 10));
				laDepartment.setText(rs.getString(2));
				laPosition.setText(rs.getString(3));
				laworkday.setText(rs.getString(4));
				laAnnual.setText(rs.getString(5));
				if(!(rs.getString(2).equals("Development") || rs.getString(2).equals("Master"))) {
					laProject.setText("Not Developer");
				}else {
					laProject.setText(rs.getString(6));
				}
				
				laBank.setText(rs.getString(7));
				laFour.setText(rs.getString(8));
				laHealth.setText(rs.getString(9));
				laNational.setText(rs.getString(10));
			}

		} catch (Exception e) {

		}
	}
}
