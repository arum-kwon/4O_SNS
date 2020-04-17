package co.sns.post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import co.sns.common.BoardListDTO;
import co.sns.common.ConnectionManager;

public class ClickLikeDAO {

	//싱글톤
	static ClickLikeDAO instance = new ClickLikeDAO();
	static public ClickLikeDAO getInstance() {
		return instance;
	}
	
	

	public boolean updateLike(Connection conn, String myId, int boardNo) {
		String insert = "insert INTO board_like_list VALUES (SEQ_LIKE_NO.nextval, ?, ?)";
		String update = "update board_list set board_like=board_like+1 where board_no=?";
		int n =0;
		int m =0;
		
		try {
			conn.setAutoCommit(false);
			PreparedStatement psmt = conn.prepareStatement(insert);
			psmt.setInt(1, boardNo);
			psmt.setString(2, myId);
			n = psmt.executeUpdate();
			
			if(n != 0) {
				psmt = conn.prepareStatement(update);
				psmt.setInt(1, boardNo);
				m = psmt.executeUpdate();
			}
			if(m != 0) {
				conn.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
				return false;
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return true;
	}
	
	public boolean updateUnLike(Connection conn, String myId, int boardNo) {
		String delete = "delete from board_like_list where board_no=? AND user_id=?";
		String update = "update board_list set board_like=board_like-1 where board_no=?";
		int n =0;
		int m =0;
		
		try {
			conn.setAutoCommit(false);
			PreparedStatement psmt = conn.prepareStatement(delete);
			psmt.setInt(1, boardNo);
			psmt.setString(2, myId);
			n = psmt.executeUpdate();
			
			if(n != 0) {
				psmt = conn.prepareStatement(update);
				psmt.setInt(1, boardNo);
				m = psmt.executeUpdate();
			}
			if(m != 0) {
				conn.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
				return false;
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
		return true;		
	}
}
