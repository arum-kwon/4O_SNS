package co.sns.sub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import co.sns.common.UserListDTO;


public class SubToMeDao {
	//싱글톤
	static SubToMeDao instance = new SubToMeDao();
	static public SubToMeDao getInstance() {
		return instance;
	}
	
	
	
	public ArrayList<UserListDTO> getToMeList(Connection conn, String myId) {
		ArrayList<UserListDTO> list = new ArrayList<UserListDTO>();
		
		try {
			String sql = "SELECT USER_ID, USER_NAME, USER_PRO_IMG_NAME " + 
					"FROM (SELECT sub_no,FROM_ID FROM SUB_LIST WHERE TO_ID=?) JOIN USER_LIST ON (USER_ID = FROM_ID) " + 
					"ORDER BY sub_no desc";
			
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, myId);
			ResultSet rs = psmt.executeQuery();
			UserListDTO dto;
			
			while(rs.next()) {
				dto = new UserListDTO();
				dto.setUser_id(rs.getString("USER_ID"));
				dto.setUser_name(rs.getString("USER_NAME"));
				dto.setUser_pro_img_name(rs.getString("USER_PRO_IMG_NAME"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
