package co.sns.post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import co.sns.common.BoardListDTO;

public class LikeBoardDAO {

	//싱글톤
	static LikeBoardDAO instance = new LikeBoardDAO();
	static public LikeBoardDAO getInstance() {
		return instance;
	}
	
	public ArrayList<HashMap<String, Object>> getLikeBoardList(Connection conn, String myId) {
		String sql = "SELECT user_name, user_pro_img_name, b.* " + 
				"FROM user_list u JOIN (SELECT * FROM board_list " + 
				"WHERE board_no IN (SELECT board_no FROM board_like_list WHERE user_id=?)) b " + 
				"ON u.user_id=b.board_user_id ORDER BY board_wdate desc, board_no desc";
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, myId);
			ResultSet rs = psmt.executeQuery();
			BoardListDTO dto;

			while(rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
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
				list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
