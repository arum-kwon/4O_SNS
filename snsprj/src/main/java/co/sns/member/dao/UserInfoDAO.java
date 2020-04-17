package co.sns.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import co.sns.common.BoardListDTO;
import co.sns.common.ConnectionManager;

public class UserInfoDAO {

	//싱글톤
	static UserInfoDAO instance = new UserInfoDAO();
	static public UserInfoDAO getInstance() {
		return instance;
	}

	PreparedStatement psmt;
	ResultSet rs;
	/**
	* 유저의 개인 정보
	*/
	public HashMap<String, Object> getUserInfo(Connection conn, String myId, String userId) {
		String sql = "SELECT u.*, TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), USER_BIRTH) / 12 + 1 ) || '살' AS user_birthage,  case when user_id in (SELECT to_id FROM sub_list where from_id=?) then 1 else 0 end as sub " + 
				"FROM user_list u where user_id=? ";

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, myId);
			psmt.setString(2, userId);
			rs = psmt.executeQuery();
			BoardListDTO dto;

			while(rs.next()) {
				map = new HashMap<String, Object>();
				map.put("user_id", rs.getString("user_id"));
				map.put("user_name", rs.getString("user_name"));
				map.put("user_pro_img_name", rs.getString("user_pro_img_name"));
				map.put("user_jdate", rs.getString("user_jdate"));
				map.put("user_header_img", rs.getString("user_header_img"));
				map.put("user_info", rs.getString("user_info"));
				map.put("user_birth", rs.getString("user_birth"));
				map.put("user_birthage", rs.getString("user_birthage"));
				map.put("user_job", rs.getString("user_job"));
				map.put("user_gender", rs.getString("user_gender"));
				map.put("Interest_enter", rs.getString("Interest_enter"));
				map.put("Interest_life", rs.getString("Interest_life"));
				map.put("Interest_hobby", rs.getString("Interest_hobby"));
				map.put("Interest_trends", rs.getString("Interest_trends"));
				map.put("sub", rs.getString("sub"));//구독 정보 수집
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, psmt, conn);
		}
		
		return map;
	}
	
	/**
	* 유저가 쓴 글
	*/
	public ArrayList<HashMap<String, Object>> getBoardList(Connection conn, String myId, String userId) {
		String sql = "SELECT b.*,  case when board_no in (SELECT board_no FROM board_like_list where user_id=?) then 1 else 0 end as bLike " + 
				"FROM board_list b WHERE board_user_id = ? ORDER BY b.board_wdate desc, b.board_no desc ";
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, myId);
			psmt.setString(2, userId);
			rs = psmt.executeQuery();

			while(rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("board_no", rs.getString("board_no"));
				map.put("board_user_id", rs.getString("board_user_id"));
				map.put("board_content", rs.getString("board_content"));
				map.put("board_like", rs.getString("board_like"));
				map.put("board_wdate", rs.getString("board_wdate"));
				map.put("board_img", rs.getString("board_img"));
				map.put("blike", rs.getString("bLike")); //좋아요 정보 수집
				
				list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.close(rs, psmt, conn);
		}
		
		return list;
	}
}
