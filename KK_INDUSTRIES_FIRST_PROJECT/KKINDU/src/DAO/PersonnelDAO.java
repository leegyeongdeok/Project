package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Controller.DBUtill;
import Function.PersonnelFunction;
import javafx.collections.ObservableList;
import javafx.scene.control.CheckBox;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;

public class PersonnelDAO {

	static private DBUtill dbu = new DBUtill();
	static private Connection conn = null;
	static private PreparedStatement pstmt = null;
	static private ResultSet rs = null;
	private static ArrayList<String> workerlist;
	private static ArrayList<String> leaveWorkerlist;
	private static ArrayList<String> retiredWorkerlist;
	private static ArrayList<String> addLeWorkerlist;
	private static ArrayList<String> addReWorkerlist;
	private static PersonnelDAO instance;
	private static PersonnelFunction pf = new PersonnelFunction();

	public PersonnelDAO getInstance() {
		if (instance == null) {
			instance = new PersonnelDAO();
		}
		return instance;
	}

	public void EmployeeList(ObservableList<String> list, String department) {
		workerlist = new ArrayList<String>();
		workerlist.clear();
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select worker_no, ei_position, ei_name from employee_info where ei_department = ?");
			pstmt.setString(1, department);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				if(!rs.getString(3).equals("Admin")) {
					String val = "[ " + rs.getString(2) + " ]" + " " + rs.getString(3);
					list.add(val);
					workerlist.add(rs.getString(1));
				}
				
			}

		} catch (Exception e) {

		}
	}

	public String getWorkerNo(int index) {
		return workerlist.get(index);

	}

	public void state(Label laST) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select ei_state from employee_info where worker_no = ? ");
			pstmt.setString(1, pf.getWorkerNo());
			rs = pstmt.executeQuery();
			rs.next();
			laST.setText(rs.getString(1));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void fillInfoPer(Label laEmpno, Label laname, Label laGender, TextField txtRrno, TextField txtPhone,
			TextField txtAdd, TextField txtBank, TextField txtAccount, TextArea txtAcademic) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select e.ei_name, e.ei_re_num, e.ei_phone, e.ei_address, s.sm_bank, s.sm_account, e.ei_eduinfo from employee_info e, salary_manage s where e.worker_no = ? and s.worker_no = ?");

			pstmt.setString(1, pf.getWorkerNo());
			pstmt.setString(2, pf.getWorkerNo());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				laEmpno.setText(pf.getWorkerNo());
				laname.setText(rs.getString(1));
				txtRrno.setText(rs.getString(2).substring(0, 8)+"******");
				if (Character.toString(rs.getString(2).charAt(7)).equals("1"))
					laGender.setText("Man");
				if (Character.toString(rs.getString(2).charAt(7)).equals("2"))
					laGender.setText("Women");

				txtPhone.setText(rs.getString(3));
				txtAdd.setText(rs.getString(4));
				txtBank.setText(rs.getString(5));
				txtAccount.setText(rs.getString(6));
				txtAcademic.setText(rs.getString(7));

			}

		} catch (Exception e) {

		}

	}

	public void fillInfoEmp(Label laEmpDay, TextField txtDepart, TextField txtPosition, TextField txtWorkDay,
			TextField txtAnnual, Label laProject, TextArea txtOther, CheckBox ckbFour, CheckBox ckbHealth, CheckBox ckbNation) {

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select e.ei_empday, e.ei_department, e.ei_position, e.ei_workday, s.sm_annsalary, p.pm_projectname, e.ei_etcinfo, s.sm_fourinsurance, s.sm_heinsurance, s.sm_napension from employee_info e, salary_manage s, project_manage p where s.worker_no = ? and e.worker_no = ? and p.worker_no = ?");
			pstmt.setString(1, pf.getWorkerNo());
			pstmt.setString(2, pf.getWorkerNo());
			pstmt.setString(3, pf.getWorkerNo());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				laEmpDay.setText(rs.getString(1).substring(0, 10));
				txtDepart.setText(rs.getString(2));
				txtPosition.setText(rs.getString(3));
				txtWorkDay.setText(rs.getString(4));
				txtAnnual.setText(rs.getString(5));
				laProject.setText(rs.getString(6));
				txtOther.setText(rs.getString(7));

				if (rs.getString(8).equals("yes"))
					ckbFour.setSelected(true);
				if (rs.getString(9).equals("yes"))
					ckbHealth.setSelected(true);
				if (rs.getString(10).equals("yes"))
					ckbNation.setSelected(true);

			}

		} catch (Exception e) {

		}
	}
	
	public void fillInfoEmpNotDe(Label laEmpDay, TextField txtDepart, TextField txtPosition, TextField txtWorkDay,
			TextField txtAnnual, TextArea txtOther, CheckBox ckbFour, CheckBox ckbHealth, CheckBox ckbNation) {

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select e.ei_empday, e.ei_department, e.ei_position, e.ei_workday, s.sm_annsalary, e.ei_etcinfo, s.sm_fourinsurance, s.sm_heinsurance, s.sm_napension from employee_info e, salary_manage s where s.worker_no = ? and e.worker_no = ?");
			pstmt.setString(1, pf.getWorkerNo());
			pstmt.setString(2, pf.getWorkerNo());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				laEmpDay.setText(rs.getString(1).substring(0, 10));
				txtDepart.setText(rs.getString(2));
				txtPosition.setText(rs.getString(3));
				txtWorkDay.setText(rs.getString(4));
				txtAnnual.setText(rs.getString(5));
				txtOther.setText(rs.getString(6));

				if (rs.getString(7).equals("yes"))
					ckbFour.setSelected(true);
				if (rs.getString(8).equals("yes"))
					ckbHealth.setSelected(true);
				if (rs.getString(9).equals("yes"))
					ckbNation.setSelected(true);

			}

		} catch (Exception e) {

		}
	}
	
	public void EmpDel() {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("delete from employee_info where worker_no = ?");
			pstmt.setString(1, pf.getWorkerNo());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	// btnUpdate Personal
	public void updatePerEi(TextField txtRrno, TextField txtPhone, TextField txtAdd, TextArea txtAcademic) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"update employee_info set ei_re_num = ?, ei_phone = ?, ei_address = ?, ei_eduinfo = ? where worker_no = ?");
			pstmt.setString(1, txtRrno.getText());
			pstmt.setString(2, txtPhone.getText());
			pstmt.setString(3, txtAdd.getText());
			pstmt.setString(4, txtAcademic.getText());
			pstmt.setString(5, pf.getWorkerNo());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	

	// btnUpdate Employee
	public void updateEmpEi(TextField txtDepart, TextField txtPosition, TextField txtWorkDay, TextArea txtOther) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"update employee_info set ei_department = ?, ei_position = ?, ei_workday = ?, ei_etcinfo = ? where worker_no = ?");
			pstmt.setString(1, txtDepart.getText());
			pstmt.setString(2, txtPosition.getText());
			pstmt.setString(3, txtWorkDay.getText());
			pstmt.setString(4, txtOther.getText());
			pstmt.setString(5, pf.getWorkerNo());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// leave Employee Tab

	public void leaveList(ObservableList<String> leave) {
		leaveWorkerlist = new ArrayList<String>();
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select l.worker_no, e.ei_department, e.ei_name from employee_info e, leave_emp l where e.worker_no = l.worker_no");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String val = "[ " + rs.getString(2) + " ]" + " " + rs.getString(3);
				leave.add(val);
				leaveWorkerlist.add(rs.getString(1));
			}

		} catch (Exception e) {

		}
	}

	public String getLeaveWorkerno(int index) {
		return leaveWorkerlist.get(index);
	}

	public void leaveEmp(Label laLeEmp, Label laLeGen, Label laLeNa, Label laLeDe, Label laLePo, Label laLeDay,
			TextArea laLeArea) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select e.ei_name, e.ei_gender, e.ei_department, e.ei_position, l.le_date, l.le_reason from leave_emp l, employee_info e where e.worker_no = ? and l.worker_no = ?");
			pstmt.setString(1, pf.getLeaveWorkerno());
			pstmt.setString(2, pf.getLeaveWorkerno());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				laLeEmp.setText(pf.getLeaveWorkerno());
				laLeNa.setText(rs.getString(1));
				laLeGen.setText(rs.getString(2));
				laLeDe.setText(rs.getString(3));
				laLePo.setText(rs.getString(4));
				laLeDay.setText(rs.getString(5).substring(0, 10));
				laLeArea.setText(rs.getString(6));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void EmployeeLeList(ObservableList<String> list) {
		addLeWorkerlist = new ArrayList<String>();
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select worker_no, ei_position, ei_name from employee_info where ei_department != 'Master'and  ei_state = 'work'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				String val = "[ " + rs.getString(2) + " ]" + " " + rs.getString(3);
				list.add(val);
				addLeWorkerlist.add(rs.getString(1));
			}

		} catch (Exception e) {

		}
	}

	public void insertLeEmp(int index, String text, String date) {

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("insert into leave_emp(worker_no, le_reason, le_date) values(?, ?, ?)");

			pstmt.setString(1, addLeWorkerlist.get(index));
			pstmt.setString(2, text);
			pstmt.setString(3, date);
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement("update employee_info set ei_state = 'rest' where worker_no = ?");
			pstmt.setString(1, addLeWorkerlist.get(index));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void delLeEmp(int index) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("delete from leave_emp where worker_no = ?");
			pstmt.setString(1, leaveWorkerlist.get(index));
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement("update employee_info set ei_state = 'work' where worker_no = ?");
			pstmt.setString(1, leaveWorkerlist.get(index));
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// retired Employee Tab

	public void EmployeeReList(ObservableList<String> list) {
		addReWorkerlist = new ArrayList<String>();
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select worker_no, ei_position, ei_name from employee_info where ei_department != 'Master'and  ei_state = 'work'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				String val = "[ " + rs.getString(2) + " ]" + " " + rs.getString(3);
				list.add(val);
				addReWorkerlist.add(rs.getString(1));
			}

		} catch (Exception e) {

		}
	}

	public void retiredList(ObservableList<String> retired) {
		retiredWorkerlist = new ArrayList<String>();
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select r.worker_no, e.ei_department, e.ei_name from employee_info e, retired_emp r where e.worker_no = r.worker_no");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String val = "[ " + rs.getString(2) + " ]" + " " + rs.getString(3);
				retired.add(val);
				retiredWorkerlist.add(rs.getString(1));
			}

		} catch (Exception e) {

		}
	}

	public String getRetiredWorkerno(int index) {
		return retiredWorkerlist.get(index);
	}

	public void retiredEmp(Label laReEmp, Label laReNa, Label laReGen, Label laReDe, Label laRePos, Label laReEmpDay,
			Label laReDay, TextArea txtReArea) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"select e.ei_name, e.ei_gender, e.ei_department, e.ei_position, e.ei_empday, r.rt_date, r.rt_reason from retired_emp r, employee_info e where e.worker_no = ? and r.worker_no = ?");
			pstmt.setString(1, pf.getRetiredWorkerno());
			pstmt.setString(2, pf.getRetiredWorkerno());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				laReEmp.setText(pf.getRetiredWorkerno());
				laReNa.setText(rs.getString(1));
				laReGen.setText(rs.getString(2));
				laReDe.setText(rs.getString(3));
				laRePos.setText(rs.getString(4));
				laReEmpDay.setText(rs.getString(5).substring(0, 10));
				laReDay.setText(rs.getString(6).substring(0, 10));
				txtReArea.setText(rs.getString(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertReEmp(int index, String text, String date) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("insert into retired_emp(worker_no, rt_reason, rt_date) values(?, ?, ?)");

			pstmt.setString(1, addReWorkerlist.get(index));
			pstmt.setString(2, text);
			pstmt.setString(3, date);
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement("update employee_info set ei_state = 'retired' where worker_no = ?");
			pstmt.setString(1, addReWorkerlist.get(index));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void delReEmp(int index) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("delete from retired_emp where worker_no = ?");
			pstmt.setString(1, retiredWorkerlist.get(index));
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement("update employee_info set ei_state = 'work' where worker_no = ?");
			pstmt.setString(1, retiredWorkerlist.get(index));
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// Employee ADD Action
	public String setEmpNo(String depart) {
		String val = null;
		try {
			int last = 0;
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select SUBSTR(worker_no,2, 5) from employee_info where ei_department = ? ");
			pstmt.setString(1, depart);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				last = rs.getInt(1);
			}
			last++;
			if(depart.equals("Personnel")) val = "P"+last;
			if(depart.equals("Accounting")) val = "A"+last;
			if(depart.equals("Business")) val = "B"+last;
			if(depart.equals("Development")) val = "D"+last;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return val;
	}

	public void addEmp(Label laEmpNo, TextField txtNa, TextField txtRe, Label laGender, ChoiceBox<String> cmbDepart,
			TextField txtWork, TextArea txtAca, TextField txtPh, TextField txtAdd, TextArea txtOther) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"INSERT into employee_info"
					+ " (worker_no, ei_name, ei_re_num, ei_gender, ei_department, ei_workday, ei_eduinfo, ei_phone, ei_address, ei_etcinfo ) "
					+ "values(? , ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, laEmpNo.getText());
			pstmt.setString(2, txtNa.getText());
			pstmt.setString(3, txtRe.getText());
			pstmt.setString(4, laGender.getText());
			pstmt.setString(5, cmbDepart.getValue().toString());
			pstmt.setInt(6, Integer.parseInt(txtWork.getText()));
			pstmt.setString(7, txtAca.getText());
			pstmt.setString(8, txtPh.getText());
			pstmt.setString(9, txtAdd.getText());
			pstmt.setString(10, txtOther.getText());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	

	

}
