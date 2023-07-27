package vn.iotstar.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private final String serverName = "localhost";//laptop-sslks646\\sqlexpress
	private final String dbName = "DB_BOOK";
	private final String portNumber = "1433";
	private final String instance = "";// LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
	private final String userID = "sa";
	private final String password = "12345";
	
	
	public Connection getConnection() throws Exception {
		String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
		if (instance == null || instance.trim().isEmpty())
			url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
	}

	/* Insert your other code right after this comment */
	/*
	 * Change/update information of your database connection, DO NOT change name of
	 * instance variables in this class
	 */
	
	public static void main(String[] args) {
		try {
			System.out.println(new DBConnection().getConnection());
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
