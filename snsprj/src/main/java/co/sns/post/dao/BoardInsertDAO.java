package co.sns.post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import co.sns.common.BoardListDTO;
import co.sns.common.ConnectionManager;
import co.sns.common.SerKeyListDTO;
import co.sns.search.dao.SearchDAO;

public class BoardInsertDAO {
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
	
	//작성글 insert method
			public int insertBoard(BoardListDTO dto) {
				String sql ="insert into board_list VALUES (SEQ_BOARD_NO.nextval, 'aaa', ?, 0, sysdate, ?)";
				int n=0;
				try {
					
					conn = ConnectionManager.getConnnection();
					pstmt = conn.prepareStatement(sql);
					//pstmt.setString(1, dto.getBoard_user_id());
					pstmt.setString(1, dto.getBoard_content());
					pstmt.setString(2, dto.getBoard_img());
					
					n = pstmt.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
					
				}
				return n ;
			
			}

			
}
