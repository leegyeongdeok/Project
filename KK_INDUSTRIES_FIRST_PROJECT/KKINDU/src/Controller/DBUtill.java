package Controller;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtill {
	static final String driver = "oracle.jdbc.driver.OracleDriver";
	static final String url = "jdbc:oracle:thin:@192.168.1.2:1521:xe";

	public static Connection getConnection() throws Exception {
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, "KKI", "12");
		return con;
	}

}
