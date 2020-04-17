package co.sns.post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import co.sns.common.BoardListDTO;
import co.sns.common.CommentListDTO;

public class BoardDetailDAO {
	//싱글톤
	static BoardDetailDAO instance = new BoardDetailDAO();
	static public BoardDetailDAO getInstance() {
		return instance;
	}

	/**
	* 게시글의 정보만 가져옴
	*/
	public HashMap<String, Object> getBoardInfo(Connection conn, int boardNo, String myId) {
		String sql = "SELECT USER_ID, USER_NAME, USER_PRO_IMG_NAME, b.* , case when board_no in (SELECT board_no FROM board_like_list where user_id=?) then 1 else 0 end as bLike " + 
				"				FROM user_list JOIN (SELECT * FROM board_list WHERE board_no = ?) b  " + 
				"				ON(user_id = board_user_id) ";

		HashMap<String, Object> map = new HashMap<String, Object>();
		
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, myId);
			psmt.setInt(2, boardNo);
			ResultSet rs = psmt.executeQuery();
			BoardListDTO dto;

			while(rs.next()) {
				map = new HashMap<String, Object>();
				dto = new BoardListDTO();
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_img(rs.getString("board_img"));
				dto.setBoard_like(rs.getInt("board_like"));
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setBoard_user_id(rs.getString("board_user_id"));
				dto.setBoard_wdate(rs.getDate("board_wdate"));
				map.put("board", dto);
				map.put("user_name", rs.getString("user_name"));
				map.put("user_pro_img_name", rs.getString("user_pro_img_name"));
				map.put("blike", rs.getString("bLike"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}

	
	/**
	* 게시글에 딸린 댓글을 가져옴
	*/
	public ArrayList<HashMap<String, Object>> getComment(Connection conn, int boardNo) {
		String sql = "SELECT USER_NAME, USER_PRO_IMG_NAME, c.* " + 
				"FROM user_list u JOIN (SELECT * " + 
				"                    FROM comment_list " + 
				"                    WHERE board_no IN (SELECT board_no FROM board_list WHERE board_no = ?)) c " + 
				"ON(u.user_id = c.user_id) ORDER BY WDATE DESC, comment_no DESC";
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, boardNo);
			ResultSet rs = psmt.executeQuery();
			CommentListDTO dto =null;

			while(rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				dto = new CommentListDTO();
				dto.setComment_no(rs.getInt("comment_no"));
				dto.setBoard_no(rs.getInt("board_no"));
				dto.setWdate(rs.getDate("wdate"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setComment_content(rs.getString("comment_content"));
				map.put("comment", dto);
				
				map.put("user_name", rs.getString("user_name"));
				map.put("user_pro_img_name", rs.getString("user_pro_img_name"));
				list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
