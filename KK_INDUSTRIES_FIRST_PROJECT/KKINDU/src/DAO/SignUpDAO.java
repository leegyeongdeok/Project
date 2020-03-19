package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Controller.DBUtill;
import Function.SignUpFunction;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;

public class SignUpDAO {
	static private SignUpFunction sf;
	static private DBUtill dbu = new DBUtill();
	static private Connection conn = null;
	static private PreparedStatement pstmt = null;
	static private ResultSet rs = null;
	private static SignUpDAO instance;
	
	
	public static SignUpDAO getInstance() {
		if (instance == null) {
			instance = new SignUpDAO();
		}
		return instance;
	}
	
	public void insert(String id, String pw, String classInfo, String workerNo) {
		conn = null;
		pstmt = null;
		rs = null;
		

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement(
					"insert into user_info(user_id, user_pw, user_class, worker_no) values (?, ?, ?, ?)");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, classInfo);
			pstmt.setString(4, workerNo);
			pstmt.executeUpdate();

		} catch (Exception e) {
			Alert alert = new Alert(AlertType.WARNING);
			alert.setTitle("Warring");
			alert.setHeaderText("Invalid Employee_No");
			alert.setContentText("Enter the correct value");
			alert.showAndWait();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e2) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e2) {
				}
			}

			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			}
		}
	}

	public void Delete(String id) {
		conn = null;
		pstmt = null;
		
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("delete user_info where user_id = ?");
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e2) {
				}
			}

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e2) {
				} finally {
					if (pstmt != null) {
						try {
							pstmt.close();
						} catch (SQLException e2) {
						}
					}

					if (conn != null) {
						try {
							conn.close();
						} catch (SQLException e2) {
						}
					}
				}
			}
		}
	}

	
	public boolean checkID(String id) {
		boolean val = false;
		conn = null;
		pstmt = null;
		
		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select user_id from user_info where user_id = ?");
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				val = false;

			} else {
				val = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return val;
		
	}
	
	public boolean checkEmployee(String Employee) {
		conn = null;
		pstmt = null;
		
		boolean val = false;

		try {
			conn = dbu.getConnection();
			pstmt = conn.prepareStatement("select worker_no from user_info where worker_no = ?");
			pstmt.setString(1, Employee);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				val = false;

			} else {
				val = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return val;
	}
	

	
	
	
}
