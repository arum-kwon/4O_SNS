package co.sns.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import co.sns.common.UserListDTO;
import co.sns.post.dao.TimeLineDAO;


public class LoginDAO {

	//싱글톤
	static LoginDAO instance = new LoginDAO();
	static public LoginDAO getInstance() {
		return instance;
	}

	
	
	private final String USER_LIST_INSERT = "insert into user_list(USER_ID\r\n" + 
			",USER_NAME\r\n" + 
			",USER_PW\r\n" + 
			",USER_HEADER_IMG\r\n" + 
			",USER_PRO_IMG_NAME\r\n" + 
			",USER_JDATE\r\n" + 
			",USER_INFO\r\n" + 
			",USER_BIRTH\r\n" + 
			",USER_GENDER\r\n" + 
			",USER_JOB\r\n" + 
			",INTEREST_ENTER\r\n" + 
			",INTEREST_LIFE\r\n" + 
			",INTEREST_HOBBY\r\n" + 
			",INTEREST_TRENDS) values(?,?,?,?,?,sysdate,?,?,?,?,?,?,?,?)";

	
	public int userListInsert(Connection conn, UserListDTO spj) {
		
		int n = 0;
		try {
			PreparedStatement psmt = conn.prepareStatement(USER_LIST_INSERT);
			psmt.setString(1, spj.getUser_id());
			psmt.setString(2, spj.getUser_name());
			psmt.setString(3, spj.getUser_pw());
			psmt.setString(4, spj.getUser_header_img());
			psmt.setString(5, spj.getUser_pro_img_name());
			//	psmt.setDate(6,new java.sql.Date(spj.getUser_jdate().getTime()));
			psmt.setString(6, spj.getUser_info());
			psmt.setDate(7, new java.sql.Date(System.currentTimeMillis()));
			psmt.setString(8, spj.getUser_gender());
			psmt.setString(9, spj.getUser_job());
			psmt.setString(10, spj.getInterest_enter());
			psmt.setString(11, spj.getInterest_life());
			psmt.setString(12, spj.getInterest_hobby());
			psmt.setNString(13, spj.getInterest_trends());
			n=psmt.executeUpdate();			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return n;
		
	}
	
}
 

