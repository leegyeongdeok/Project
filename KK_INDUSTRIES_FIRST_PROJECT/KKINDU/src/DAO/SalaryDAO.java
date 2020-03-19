package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Controller.DBUtill;
import Function.PersonnelFunction;
import Function.SalaryManageFunction;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

public class SalaryDAO {
	static private SalaryManageFunction sf = new SalaryManageFunction();
	static private PersonnelFunction pf = new PersonnelFunction();
	static private DBUtill dbu = new DBUtill();
	static private Connection conn = null;
	static private PreparedStatement pstmt = null;
	static private ResultSet rs = null;
	private static SalaryDAO instance;
	private static String WorkerNo = null;
	private static int key;
	
	public static SalaryDAO getInstance() {
		if (instance == null) {
			instance = new SalaryDAO();
		}
		return instance;
	}
	
	public void setWorkeNo() {
		WorkerNo = pf.getWorkerNo();
	}
	
	public void setInfo(Label laDepart, Label laNa, Label laPos) {
		
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select e.ei_department, e.ei_name, e.ei_position from employee_info e where worker_no = ? ");
			pstmt.setString(1, WorkerNo);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				laDepart.setText(rs.getString(1));
				laNa.setText(rs.getString(2));
				laPos.setText(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void set(Label laEmpNo, Label laDepart, Label laNa, Label laPos, TextField txtBank, TextField txtAcc, TextField txtSal, TextField txtBo, Label laTax, CheckBox ckbFour, CheckBox ckbHealth, CheckBox ckbNation) {
		key = 0;
		this.setWorkeNo();
		laEmpNo.setText(WorkerNo);
		this.setInfo(laDepart, laNa, laPos);
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select e.ei_department, e.ei_name, e.ei_position,  s.sm_bank, s.sm_account, s.sm_annsalary, s.sm_annbonus, s.sm_incometax, s.sm_fourinsurance, s.sm_heinsurance, s.sm_napension from employee_info e, salary_manage s where e.worker_no = ? and s.worker_no = ?");

			pstmt.setString(1, WorkerNo);
			pstmt.setString(2, WorkerNo);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				key = 1;
				
				txtBank.setText(rs.getString(4));
				txtAcc.setText(rs.getString(5));
				txtSal.setText(rs.getString(6));
				txtBo.setText(rs.getString(7));
				laTax.setText(rs.getString(8));
				
				if (rs.getString(9).equals("yes"))
					ckbFour.setSelected(true);
				if (rs.getString(10).equals("yes"))
					ckbHealth.setSelected(true);
				if (rs.getString(11).equals("yes"))
					ckbNation.setSelected(true);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateSal(TextField txtBank, TextField txtSal, TextField txtBo, Label laTax, TextField txtAcc, CheckBox ckbFour, CheckBox ckbHealth, CheckBox ckbNation) {
		try {
			conn = dbu.getConnection();
			if(key == 1) {
				pstmt = conn.prepareStatement(
						"update salary_manage set sm_bank = ?, sm_annsalary = ?, sm_annbonus = ?, sm_incometax = ?, sm_account = ?, sm_fourinsurance = ?, sm_heinsurance = ?, sm_napension = ?  where worker_no = ?");
				pstmt.setString(1, txtBank.getText());
				pstmt.setString(2, txtSal.getText());
				pstmt.setString(3, txtBo.getText());
				pstmt.setInt(4, sf.Tax(Integer.parseInt(txtSal.getText())+Integer.parseInt(txtBo.getText())));
				pstmt.setString(5, txtAcc.getText());
				if(ckbFour.isSelected()) {
					pstmt.setString(6, "yes");
				}else {
					pstmt.setString(6, "no");
				}
				if(ckbFour.isSelected()) {
					pstmt.setString(7, "yes");
				}else {
					pstmt.setString(7, "no");
				}
				if(ckbFour.isSelected()) {
					pstmt.setString(8, "yes");
				}else {
					pstmt.setString(8, "no");
				}
				pstmt.setString(9, WorkerNo);
			}else {
			
				pstmt = conn.prepareStatement(
						"insert into salary_manage (sm_bank, sm_annsalary, sm_annbonus, sm_incometax, sm_account, sm_fourinsurance, sm_heinsurance, sm_napension, worker_no) values(?, ?, ?, ?, ?, ?, ?, ? ,?)");
				pstmt.setString(1, txtBank.getText());
				pstmt.setString(2, txtSal.getText());
				pstmt.setString(3, txtBo.getText());
				pstmt.setInt(4, sf.Tax(Integer.parseInt(txtSal.getText())+Integer.parseInt(txtBo.getText())));
				pstmt.setString(5, txtAcc.getText());
				if(ckbFour.isSelected()) {
					pstmt.setString(6, "yes");
				}else {
					pstmt.setString(6, "no");
				}
				if(ckbFour.isSelected()) {
					pstmt.setString(7, "yes");
				}else {
					pstmt.setString(7, "no");
				}
				if(ckbFour.isSelected()) {
					pstmt.setString(8, "yes");
				}else {
					pstmt.setString(8, "no");
				}
				pstmt.setString(9, WorkerNo);
			}
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
}
