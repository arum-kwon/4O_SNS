package co.sns.search.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import co.sns.common.BoardListDTO;
import co.sns.common.ConnectionManager;
import co.sns.common.SerKeyListDTO;


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
		public ArrayList<BoardListDTO> getResultList(String key) {
			   ArrayList<BoardListDTO> datas = new ArrayList<BoardListDTO>();
			
			String sql = "SELECT * FROM BOARD_LIST WHERE board_content LIKE '%'||?||'%' order by board_wdate desc";
			try {
				conn = ConnectionManager.getConnnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, key);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					BoardListDTO board = new BoardListDTO();
					board.setBoard_no(rs.getInt("board_no"));
					board.setBoard_user_id(rs.getString("board_user_id"));
					board.setBoard_content(rs.getString("board_content"));
					board.setBoard_like(rs.getInt("board_like"));
					board.setBoard_wdate(rs.getDate("board_wdate"));
					board.setBoard_img(rs.getString("board_img"));
					datas.add(board);
				}
				rs.close();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally {
				ConnectionManager.close(conn);
			}
			return datas;
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
		
}
