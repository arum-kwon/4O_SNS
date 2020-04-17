package co.sns.post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import co.sns.common.CommentListDTO;

public class CommentInsertDAO {

	//싱글톤
	static CommentInsertDAO instance = new CommentInsertDAO();
	static public CommentInsertDAO getInstance() {
		return instance;
	}
	
	public int insertComment(Connection conn, CommentListDTO dto) {
		String sql = "INSERT INTO COMMENT_LIST (COMMENT_NO, BOARD_NO, WDATE, COMMENT_CONTENT, USER_ID) " + 
				"VALUES (SEQ_COMMENT_NO.nextval, ?, sysdate, ?, ?) ";
		
		PreparedStatement psmt;
		int n = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getBoard_no());
			psmt.setString(2, dto.getComment_content());
			psmt.setString(3, dto.getUser_id());
			n = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	

}
