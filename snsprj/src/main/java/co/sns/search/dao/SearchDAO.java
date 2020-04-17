package co.sns.search.dao;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import co.sns.common.BoardListDTO;
import co.sns.common.ConnectionManager;
import co.sns.common.SerKeyListDTO;
import co.sns.common.UserListDTO;


public class SearchDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;

	//싱글톤 구현
	static SearchDAO instance;	
	public static SearchDAO getInstance() {
		if (instance == null)
			instance = new SearchDAO();
		return instance;
	}
	
	// 검색결과 리스트 메서드
		public ArrayList<Map<String, Object>> getResultList(String key, String userid) {
			ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			   	
			String sql = "SELECT b.board_no, b.board_content, b.board_wdate, b.board_like, b.board_img, u.user_id, u.user_name, u.user_pro_img_name, case when b.board_no in (SELECT board_no FROM board_like_list where user_id=?) then 1 else 0 end as bLike FROM board_list b INNER JOIN  user_list u ON  b.board_user_id = u.user_id AND  b.board_content  Like '%'||?||'%' order by board_wdate desc";
			try {
				conn = ConnectionManager.getConnnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid );
				pstmt.setString(2, key);
				
				ResultSet rs = pstmt.executeQuery();
			
				
				while(rs.next()) {
						HashMap<String, Object> map = new HashMap<String, Object>();
						
						map.put("board_no", rs.getString("board_no"));
						map.put("board_content", rs.getString("board_content"));
						map.put("board_wdate", rs.getDate("board_wdate"));
						map.put("board_like", rs.getInt("board_like"));
						map.put("board_img", rs.getString("board_img"));
						map.put("user_id", rs.getString("user_id"));
						map.put("user_name", rs.getString("user_name"));
						map.put("user_pro_img_name", rs.getString("user_pro_img_name"));
						map.put("bLike", rs.getString("blike"));	

						list.add(map);

				}
						

//				return list;		
//					BoardListDTO board = new BoardListDTO();
//					UserListDTO user = new UserListDTO();
//					board.setBoard_no(rs.getInt("board_no"));
//					board.setBoard_user_id(rs.getString("board_user_id"));
//					board.setBoard_content(rs.getString("board_content"));
//					board.setBoard_like(rs.getInt("board_like"));
//					board.setBoard_wdate(rs.getDate("board_wdate"));
//					board.setBoard_img(rs.getString("board_img"));
//					
//					datas.add(board);
//				}
				rs.close();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				ConnectionManager.close(conn);
			}
			return list;
		}
		
	//검색 키워드 인설트,업데이트 메서드
		public int serch(String key) {
			String sql ="MERGE into ser_key_list USING DUAL ON (keyword = ? ) WHEN MATCHED THEN update set ser_count = ser_count+1 WHEN NOT MATCHED THEN insert(key_no, keyword, ser_count) VALUES (seq_key_no.nextval, ?, 1)";
			int n=0;
			try {
				SerKeyListDTO dto = new SerKeyListDTO();
				conn = ConnectionManager.getConnnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, key);
				pstmt.setString(2, key);
				n = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
				
			}
			return n ;
		
		}
		
		
		// hot 리스트 메서드
		public  ArrayList<SerKeyListDTO> hot() {
			ArrayList<SerKeyListDTO> hotkeys = new ArrayList<SerKeyListDTO>();
			String sql ="select keyword FROM (select keyword from ser_key_list order by ser_count desc) WHERE rownum <=5";
			try {
				conn = co.sns.common.ConnectionManager.getConnnection();
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					SerKeyListDTO hotkey = new SerKeyListDTO();
					hotkey.setKeyword(rs.getString("keyword"));
					hotkeys.add(hotkey);
				}
				rs.close();
				System.out.println(hotkeys);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				co.sns.common.ConnectionManager.close(conn);
			}
			return hotkeys;
		}
		
		//keyword 카운트 1로 초기화 메소드
		public int reset() throws SQLException {
			int n =0;
			String sql = "update ser_key_list set ser_count =1";
			
			conn = co.sns.common.ConnectionManager.getConnnection();
			pstmt = conn.prepareStatement(sql);
			n = pstmt.executeUpdate();
			
			return n;
			
		}
}
