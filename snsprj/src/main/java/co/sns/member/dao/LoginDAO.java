package co.sns.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {
	private final String driver = "oracle.jdbc.driver.OracleDriver";
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hr";
	private String password = "ht";
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
}
