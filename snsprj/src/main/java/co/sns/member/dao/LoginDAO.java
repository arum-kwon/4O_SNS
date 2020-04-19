package co.sns.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.sns.common.UserListDTO;

public class LoginDAO {
	static LoginDAO instance = new LoginDAO();
	static public LoginDAO getInstance() {
		return instance;
	}
	
	private final String USER_INSERT = "insert into user_list(user_id, user_pw, user_pro_img_name, user_name, user_jdate) values(?,?,?,?,sysdate)"; 
	private final String USER_CHECK = "select * from user_list where user_id = ? and user_pw=?";
	private final String USER_ID_CHECK = "select user_id from user_list where user_id = ?";
	
	public UserListDTO selectMember(Connection conn, UserListDTO dto) {
		UserListDTO vo = null;
		try {
			PreparedStatement psmt = conn.prepareStatement(USER_CHECK);
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getUser_pw());
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				vo = new UserListDTO();
				
				vo.setUser_id(rs.getString("user_id"));
				vo.setUser_name(rs.getString("user_name"));
				vo.setUser_pro_img_name(rs.getString("user_pro_img_name"));
				vo.setUser_jdate(rs.getDate("user_jdate"));
				vo.setUser_info(rs.getString("user_info"));
				vo.setUser_birth(rs.getDate("user_birth"));
				vo.setUser_gender(rs.getString("user_gender"));
				vo.setUser_job(rs.getString("user_job"));
				vo.setInterest_enter(rs.getString("Interest_enter"));
				vo.setInterest_life(rs.getString("Interest_life"));
				vo.setInterest_hobby(rs.getString("Interest_hobby"));
				vo.setInterest_trends(rs.getString("Interest_trends"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public int JoinInsert(Connection conn, UserListDTO dto ) {
		int n = 0;
		try {
		PreparedStatement psmt = conn.prepareStatement(USER_INSERT);
		psmt.setString(1, dto.getUser_id());
		psmt.setString(2, dto.getUser_pw());
		psmt.setString(3, dto.getUser_pro_img_name());
		psmt.setString(4, dto.getUser_name());
		n = psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public int userIdCheck(Connection conn, String user_id) {
		int n = 0;
		try {
			PreparedStatement psmt = conn.prepareStatement(USER_ID_CHECK);
			psmt.setString(1, user_id);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				n=1;  
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
}
