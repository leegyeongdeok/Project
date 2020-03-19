package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Controller.DBUtill;
import Function.ClientManageFunction;
import javafx.collections.ObservableList;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;

public class ClientManageDAO {
	
	static private ClientManageFunction cmf = new ClientManageFunction();
	static private DBUtill dbu = new DBUtill();
	static private Connection conn = null;
	static private PreparedStatement pstmt = null;
	static private ResultSet rs = null;
	private static ClientManageDAO instance;
	private static ArrayList<String> clientmanagelist;
	

	public static ClientManageDAO getInstance() {
		if (instance == null) {
			instance = new ClientManageDAO();
		}
		return instance;
	}

	public void ClientManageList(ObservableList<String> list) {
		clientmanagelist = new ArrayList<String>();
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"SELECT CM_COMPANYNAME, client_no FROM CLIENT_MANAGE");
			rs = pstmt.executeQuery();

			while(rs.next()) {            
				list.add(rs.getString(1));
				clientmanagelist.add(rs.getString(2));
			}

		} catch (Exception e) {

		}		
	}	

	public String getClientNO(int index) {
		
		return clientmanagelist.get(index);
	}

	public void fillInfoCM(Label laClientNO, Label laBSector, Label laCName,  Label laBLNumber, Label laRName, Label laRRNumber, Label laPhone, Label laAddress, Label laEICharge, Label laEICNumber ) {

		try {
			conn = dbu.getConnection();
			
			pstmt = conn.prepareStatement("SELECT c.CLIENT_NO,c.CM_COMPANYNAME, c.CM_BLN, c.cm_rep_name ,c.CM_RE_NUM, c.CM_TYPEOB, c.CM_ADDRESS, c.CM_PHONE, c.CM_REP_SALARY, c.CM_SALARY_PHONE FROM Client_Manage c WHERE c.CLIENT_NO = ?");
			pstmt.setString(1, cmf.getClientNO());
			rs = pstmt.executeQuery();

			while(rs.next()) {
				laClientNO.setText(rs.getString(1));
				laCName.setText(rs.getString(2));
				laBLNumber.setText(rs.getString(3));
				laRName.setText(rs.getString(4));
				laRRNumber.setText(rs.getString(5));
				laBSector.setText(rs.getString(6));
				laAddress.setText(rs.getString(7));
				laPhone.setText(rs.getString(8));
				laEICharge.setText(rs.getString(9));
				laEICNumber.setText(rs.getString(10));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public void ClientDel(String ClientNo) {
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("delete from client_manage where client_no = ?");
			pstmt.setString(1, ClientNo);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//Client Add  Tab
	
	public int ClientIndex() {
		int val = 0;
		
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select client_no from client_manage");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				val = Integer.parseInt(rs.getString(1).substring(1));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return ++val;
	}
	
	
	public void clientAdd(TextField txtNa, TextField txtBs, TextField txtBl, TextField txtRn, TextField txtRr, TextField txtPh, TextField txtAd, TextField txtCh, TextField txtCp) {
		try {
			String no = "C"+this.ClientIndex();
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("insert into client_manage (CLIENT_NO, CM_COMPANYNAME, CM_typeob, cm_bln, CM_REP_NAME, cm_re_num, CM_PHONE, CM_ADDRESS, CM_REP_SALARY, CM_SALARY_PHONE) values(?, ? ,? ,? ,? ,?, ?, ?, ?, ?)");
			pstmt.setString(1, no);
			pstmt.setString(2, txtNa.getText());
			pstmt.setString(3, txtBs.getText());
			pstmt.setString(4, txtBl.getText());
			pstmt.setString(5, txtRn.getText());
			pstmt.setString(6, txtRr.getText());
			pstmt.setString(7, txtPh.getText());
			pstmt.setString(8, txtAd.getText());
			pstmt.setString(9, txtCh.getText());
			pstmt.setString(10, txtCp.getText());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	

	
}
