package co.sns.common;

import java.util.Date;

public class BoardListDTO {
	/* BOARD_LIST TABLE */
	int board_no; 
	String board_user_id;
	String board_content;
	int board_like;
	Date board_wdate;
	String board_img;
	
	/* Getters */
	public int getBoard_no() {
		return board_no;
	}
	public String getBoard_user_id() {
		return board_user_id;
	}
	public String getBoard_content() {
		return board_content;
	}
	public int getBoard_like() {
		return board_like;
	}
	public Date getBoard_wdate() {
		return board_wdate;
	}
	public String getBoard_img() {
		return board_img;
	}
	
	/* Setters */
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public void setBoard_user_id(String board_user_id) {
		this.board_user_id = board_user_id;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}
	public void setBoard_wdate(Date board_wdate) {
		this.board_wdate = board_wdate;
	}
	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}
	
	
}
