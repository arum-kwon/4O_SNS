package co.sns.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.sns.common.BoardListDTO;
import co.sns.common.UserBListDTO;

public class UserDao {
	
	static UserDao instance = new UserDao();
	static public UserDao getInstance() {
		return instance;
	}
	

	private final String USER_LIST = "select distinct bl.board_user_id, ul.user_id, bl.BOARD_NO, bl.BOARD_CONTENT, bl.BOARD_LIKE, bl.BOARD_WDATE,BOARD_IMG,\r\n"
			+ "UL.USER_ID, UL.USER_NAME, UL.USER_HEADER_IMG, UL.USER_PRO_IMG_NAME, UL.USER_JDATE, UL.USER_INFO, TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), USER_BIRTH) / 12 + 1 ) || '살' AS USER_BIRTHAGE, \r\n"
			+ "UL.USER_GENDER, UL.USER_JOB, UL.INTEREST_ENTER, UL.INTEREST_LIFE, UL.INTEREST_HOBBY, UL.INTEREST_TRENDS, case when board_no in (SELECT board_no FROM board_like_list where user_id=?) then 1 else 0 end as bLike "
			+ "from board_list bl, user_list ul\r\n"
			+ "where ul.user_id = (select distinct bl.board_user_id from board_list where bl.board_user_id = ?) ORDER BY bl.BOARD_WDATE desc";
	
	private final String USER_SELECT = "select user_id, user_name, user_pw, user_header_img, user_pro_img_name, user_jdate, user_info, USER_BIRTH,  TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), USER_BIRTH) / 12 + 1 ) AS USER_BIRTHAGE , user_gender, user_job, interest_enter, interest_life, interest_hobby, interest_trends " + 
			"from user_list where user_id = ? ";
	
	private final String USER_BOARD_SELECTALL = "select board_no, board_user_id, board_content, board_like, board_wdate, board_img from board_list where board_user_id = ? ";	
	
	private final String USER_INFO_UPDATE = "UPDATE USER_LIST SET USER_BIRTH = ?, USER_NAME = ?, USER_INFO = ?, USER_JOB = ?, USER_GENDER = ?, INTEREST_ENTER =  ?, INTEREST_LIFE = ?, INTEREST_HOBBY = ?, INTEREST_TRENDS = ?, USER_PRO_IMG_NAME = ? WHERE USER_ID = ?";
	
	private final String BOARD_VIEW = "select board_no, board_user_id, board_content, board_like, board_wdate, board_img from board_list where board_no = ? ";
	
	private final String USER_INSERT = "insert into user_list (user_id, user_name, user_pw, user_pro_img_name, user_jdate) values(?,?,?,?,sysdate) ";
	
	private final String SUBRECOMMEND = "WITH WITH_VIEW\r\n " + 
			"AS (SELECT user_id, interest_enter, interest_life, interest_hobby, interest_trends " + 
			"FROM  user_list " + 
			"where user_id = ?) " + 
			"SELECT * FROM( " + 
			"select ul.user_id, ul.user_name, ul.user_job, ul.user_pro_img_name, TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), USER_BIRTH) / 12 + 1 ) || '살' AS USER_BIRTHAGE, ul.user_info, " + 
			"ul.interest_enter, ul.interest_life, ul.interest_hobby, ul.interest_trends, " +
			"CASE WHEN ul.interest_enter = i.interest_enter THEN 1 ELSE 0 END   + " + 
			"CASE WHEN ul.interest_life = i.interest_life THEN 1 ELSE 0 END  + " + 
			"CASE WHEN ul.interest_hobby = i.interest_hobby THEN 1 ELSE 0 END  + " + 
			"CASE WHEN ul.interest_trends = i.interest_trends THEN 1 ELSE 0 END AS cnt " + 
			"from user_list ul, WITH_VIEW i " + 
			"where ul.user_id <> ? ) " + 
			"where cnt >= 3 \r\n " +
			"and user_id not in (select to_id from sub_list where from_id = ?) " +
			"ORDER BY cnt DESC ";
	
	public ArrayList<BoardListDTO> selectBoardList(Connection conn, UserBListDTO vo) {
		ArrayList<BoardListDTO> list = new ArrayList<BoardListDTO>();
		BoardListDTO board = null;
		try {
			PreparedStatement psmt = conn.prepareStatement(USER_BOARD_SELECTALL);
			psmt.setString(1, vo.getUser_id());
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				board = new BoardListDTO();
				board.setBoard_no(rs.getInt("board_no"));
				board.setBoard_user_id(rs.getString("board_user_id"));
				board.setBoard_content(rs.getString("board_content"));
				board.setBoard_like(rs.getInt("board_like"));
				board.setBoard_wdate(rs.getDate("board_wdate"));
				board.setBoard_img(rs.getString("board_img"));
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	} 
	
	public UserBListDTO selectUserInfo2(Connection conn, UserBListDTO dto) {
		UserBListDTO member = null;
		try {
			PreparedStatement psmt = conn.prepareStatement(USER_SELECT);
			psmt.setString(1, dto.getUser_id());
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				member = new UserBListDTO();
				member.setUser_id(rs.getString("user_id"));
				member.setUser_name(rs.getString("user_name"));
				member.setUser_pw(rs.getString("user_pw"));
				member.setUser_header_img(rs.getString("user_header_img"));
				member.setUser_pro_img_name(rs.getString("user_pro_img_name"));
				member.setUser_job(rs.getString("user_job"));
				member.setUser_jdate(rs.getDate("user_jdate"));
				member.setUser_gender(rs.getString("user_gender"));
				member.setUser_birthage(rs.getString("user_birthage"));
				member.setUser_info(rs.getString("user_info"));
				member.setInterest_enter(rs.getString("interest_enter"));
				member.setInterest_life(rs.getString("interest_life"));
				member.setInterest_hobby(rs.getString("interest_hobby"));
				member.setInterest_trends(rs.getString("interest_trends"));			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public UserBListDTO selectUserInfo(Connection conn, UserBListDTO vo) {
		UserBListDTO member = null;
		try {
			PreparedStatement psmt = conn.prepareStatement(USER_SELECT);
			psmt.setString(1, vo.getUser_id());
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				member = new UserBListDTO();
				member.setUser_id(rs.getString("user_id"));
				member.setUser_name(rs.getString("user_name"));
//				member.setUser_pw(rs.getString("user_pw"));
				member.setUser_header_img(rs.getString("user_header_img"));
				member.setUser_pro_img_name(rs.getString("user_pro_img_name"));
				member.setUser_job(rs.getString("user_job"));
				member.setUser_jdate(rs.getDate("user_jdate"));
				member.setUser_gender(rs.getString("user_gender"));
				member.setUser_birthage(rs.getString("user_birthage"));
				member.setUser_info(rs.getString("user_info"));
				member.setInterest_enter(rs.getString("interest_enter"));
				member.setInterest_life(rs.getString("interest_life"));
				member.setInterest_hobby(rs.getString("interest_hobby"));
				member.setInterest_trends(rs.getString("interest_trends"));
//				member.setBoard_user_id(rs.getString("board_user_id"));
//				member.setBoard_content(rs.getString("board_content"));
//				member.setBoard_like(rs.getInt("board_like"));
//				member.setBoard_wdate(rs.getDate("board_wdate"));
//				member.setBoard_img(rs.getString("board_img"));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public String subInfo(Connection conn, String my_id, String user_id) {
		String sql = "SELECT case when ? in (SELECT to_id FROM sub_list where from_id=?) then 1 else 0 end as sub FROM dual";
		String result ="";
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			psmt.setString(2, my_id);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				result = (rs.getString("sub"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public ArrayList<UserBListDTO> select(Connection conn, UserBListDTO vo, String my_id) {
		ArrayList<UserBListDTO> list = new ArrayList<UserBListDTO>();
		UserBListDTO member = null;
		
		try {
			PreparedStatement psmt = conn.prepareStatement(USER_LIST);
			psmt.setString(1, my_id);
			psmt.setString(2, vo.getUser_id());
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				member = new UserBListDTO();
				member.setUser_id(rs.getString("user_id"));
				member.setUser_name(rs.getString("user_name"));
//				member.setUser_pw(rs.getString("user_pw")); 얘 들어가면 왜 부적합한 열이라고 에러가 뜰까요?
				member.setUser_header_img(rs.getString("user_header_img"));
				member.setUser_pro_img_name(rs.getString("user_pro_img_name"));
				member.setUser_job(rs.getString("user_job"));
				member.setUser_jdate(rs.getDate("user_jdate"));
				member.setUser_gender(rs.getString("user_gender"));
				member.setUser_birthage(rs.getString("user_birthage"));
				member.setUser_info(rs.getString("user_info"));
				member.setInterest_enter(rs.getString("interest_enter"));
				member.setInterest_life(rs.getString("interest_life"));
				member.setInterest_hobby(rs.getString("interest_hobby"));
				member.setInterest_trends(rs.getString("interest_trends"));
				member.setBoard_no(rs.getInt("board_no"));
				member.setBoard_user_id(rs.getString("board_user_id"));
				member.setBoard_content(rs.getString("board_content"));
				member.setBoard_like(rs.getInt("board_like"));
				member.setBoard_wdate(rs.getDate("board_wdate"));
				member.setBoard_img(rs.getString("board_img"));
				member.setBlike(rs.getString("bLike"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<UserBListDTO> subrecommend(Connection conn, UserBListDTO vo) {
		ArrayList<UserBListDTO> list = new ArrayList<UserBListDTO>();
		UserBListDTO member = null;
		try {
			PreparedStatement psmt = conn.prepareStatement(SUBRECOMMEND);
			psmt.setString(1, vo.getUser_id());
			psmt.setString(2, vo.getUser_id());
			psmt.setString(3, vo.getUser_id());
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				member = new UserBListDTO();
				member.setUser_id(rs.getString("user_id"));
				member.setUser_name(rs.getString("user_name"));
				member.setUser_job(rs.getString("user_job"));
				member.setUser_pro_img_name(rs.getString("user_pro_img_name"));
				member.setUser_birthage(rs.getString("user_birthage"));
				member.setUser_info(rs.getString("user_info"));
				member.setInterest_enter(rs.getString("interest_enter"));
				member.setInterest_life(rs.getString("interest_life"));
				member.setInterest_hobby(rs.getString("interest_hobby"));
				member.setInterest_trends(rs.getString("interest_trends"));
				list.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	 
	
	public int insert(Connection conn, UserBListDTO vo) {
		int n = 0;
		try {
			PreparedStatement psmt = conn.prepareStatement(USER_INSERT);
			psmt.setString(1, vo.getUser_id());
			psmt.setString(2, vo.getUser_name());
			psmt.setString(3, vo.getUser_pw());
			psmt.setString(4, vo.getUser_pro_img_name());			
			n = psmt.executeUpdate();
			System.out.println(n + "건 가입발생.");
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	public UserBListDTO board_select(Connection conn, UserBListDTO vo) {
		UserBListDTO member = null;
		try {
			PreparedStatement psmt = conn.prepareStatement(BOARD_VIEW);
			psmt.setInt(1, vo.getBoard_no());
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) {
				member = new UserBListDTO();
				member.setBoard_no(rs.getInt("board_no"));
				member.setBoard_user_id(rs.getString("board_user_id"));
				member.setBoard_content(rs.getString("board_content"));
				member.setBoard_like(rs.getInt("board_like"));
				member.setBoard_wdate(rs.getDate("board_wdate"));
				member.setBoard_img(rs.getString("board_img"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return member;
	}

	

	public int update(Connection conn, UserBListDTO vo) {
		int n = 0;
		try {			
			PreparedStatement psmt = conn.prepareStatement(USER_INFO_UPDATE);
			if(vo.getUser_birth() != null) {
				psmt.setDate(1, new java.sql.Date(vo.getUser_birth().getTime()));
			}else {
				psmt.setDate(1, null);
			}
			psmt.setString(2, vo.getUser_name());
			psmt.setString(3, vo.getUser_info());
			psmt.setString(4, vo.getUser_job());
			psmt.setString(5, vo.getUser_gender());
			psmt.setString(6, vo.getInterest_enter());
			psmt.setString(7, vo.getInterest_life());
			psmt.setString(8, vo.getInterest_hobby());
			psmt.setString(9, vo.getInterest_trends());
			psmt.setString(10, vo.getUser_pro_img_name());
			psmt.setString(11, vo.getUser_id());
			n = psmt.executeUpdate();
			System.out.println(n + "건 업데이트 되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
}
