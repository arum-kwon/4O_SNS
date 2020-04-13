package co.sns.sub.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.sns.common.SubListDTO;
import co.sns.common.UserBListDTO;

public class SubDao {
	private final String driver = "oracle.jdbc.driver.OracleDriver";
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "hs";
	private String password = "hs";
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
		
	private final String SUB_LIST = "SELECT USER_ID, USER_NAME, USER_JOB, USER_PRO_IMG_NAME " 
			+ "FROM USER_LIST " 
			+ "WHERE USER_ID IN (SELECT TO_ID FROM SUB_LIST WHERE FROM_ID = ?)";
	
	public SubDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
		}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<UserBListDTO> select(String id){
		ArrayList<UserBListDTO> list = new ArrayList<UserBListDTO>();
		UserBListDTO member = null;
		try {
			psmt = conn.prepareStatement(SUB_LIST);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				member = new UserBListDTO();
				member.setUser_id(rs.getString("user_id"));
				member.setUser_name(rs.getString("user_name"));
//				member.setUser_pw(rs.getString("user_pw"));
//				member.setUser_header_img(rs.getString("user_header_img"));
//				member.setUser_pro_img_no(rs.getInt("user_pro_img_no"));
				member.setUser_job(rs.getString("user_job"));
//				member.setUser_jdate(rs.getString("user_jdate"));
//				member.setUser_gender(rs.getString("user_gender"));
//				member.setUser_birth(rs.getDate("user_birth"));
//				member.setUser_info(rs.getString("user_info"));
//				member.setInterest_enter(rs.getString("interest_enter"));
//				member.setInterest_life(rs.getString("interest_life"));
//				member.setInterest_hobby(rs.getString("interest_hobby"));
//				member.setInterest_trends(rs.getString("interest_trends"));					
				member.setUser_pro_img_name(rs.getString("user_pro_img_name"));
				list.add(member);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
