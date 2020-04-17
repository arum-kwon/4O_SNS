package co.sns.post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import co.sns.common.BoardListDTO;

public class TimeLineDAO {

	//싱글톤
	static TimeLineDAO instance = new TimeLineDAO();
	static public TimeLineDAO getInstance() {
		return instance;
	}

	
	
	
	//list    map    board : dto
	//               user_id : val
	//               user_name : val 
	//               user_pro_img_name : val
	// list[0].board.getboard_no     /  list[0].user_id
	public ArrayList<HashMap<String, Object>> getTimeLineList(Connection conn, String myId, String order) {
		String sql = "SELECT b.*, u.*, case when board_no in (SELECT board_no FROM board_like_list where user_id=?) then 1 else 0 end as bLike " + 
				"				FROM board_list b join  " + 
				"				        ( SELECT  user_id, user_name, user_pro_img_name  " + 
				"                        FROM  user_list WHERE user_id in (SELECT to_id FROM sub_list where from_id=? OR user_id=?) ) u   " + 
				"				on board_user_id in u.user_id ";
		String latest = "order by board_wdate desc, board_no desc";
		String liked = "order by board_like desc, board_wdate desc, board_no desc";
		HashMap<String, String> orderStr = new HashMap<String, String>();
		orderStr.put("latest", latest);
		orderStr.put("liked", liked);
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		try {
			sql = sql + orderStr.get(order);
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, myId);
			psmt.setString(2, myId);
			psmt.setString(3, myId);
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
				map.put("blike", rs.getString("blike"));
				list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
