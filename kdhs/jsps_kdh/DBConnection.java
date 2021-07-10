package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getCon() throws SQLException{
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			con = DriverManager.getConnection(url,"kdh","kdh331");
			return con;
		}catch(ClassNotFoundException ce) {
			System.out.println(ce.getMessage());
			return null;
		}
	}
}
