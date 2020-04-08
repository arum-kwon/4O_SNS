package co.sns.common;

import java.util.Date;

public class SnsProjectDTO {
	/**BOARD_LIST  TABLE */
	int board_no; 
	String board_user_id;
	String board_content;
	String board_like;
	Date board_wdate;
	String board_img;

	/**MSS_LIST  TABLE */
	int mms_no;
	String mms_content;
	Date mms_wdate;
	String mms_check;
	String mms_receive_id;
	String mms_send_id;

	/**PRO_IMG_LIST  TABLE */
	int pro_img_no;
	String pro_img_name;

	/**SER_KEY_LIST  TABLE */
	int key_no;
	String keyword;
	String ser_count;

	/**SUB_LIST TABLE*/
	int sub_no;
	String to_id;
	String from_id;

	/**USER_LIST TABLE*/
	String user_id;
	String user_name;
	String user_pw;
	String user_header_img;
	int user_pro_img_no;
	String user_job;
	Date user_jdate;
	String user_gender;
	Date user_birth;
	String user_info;
	String Interest_enter;
	String Interest_life;
	String Interest_hobby;
	String Interest_trends;
	
	/** GETTER */
	public int getBoard_no() {
		return board_no;
	}
	public String getBoard_user_id() {
		return board_user_id;
	}
	public String getBoard_content() {
		return board_content;
	}
	public String getBoard_like() {
		return board_like;
	}
	public Date getBoard_wdate() {
		return board_wdate;
	}
	public String getBoard_img() {
		return board_img;
	}
	public int getMms_no() {
		return mms_no;
	}
	public String getMms_content() {
		return mms_content;
	}
	public Date getMms_wdate() {
		return mms_wdate;
	}
	public String getMms_check() {
		return mms_check;
	}
	public String getMms_receive_id() {
		return mms_receive_id;
	}
	public String getMms_send_id() {
		return mms_send_id;
	}
	public int getPro_img_no() {
		return pro_img_no;
	}
	public String getPro_img_name() {
		return pro_img_name;
	}
	public int getKey_no() {
		return key_no;
	}
	public String getKeyword() {
		return keyword;
	}
	public String getSer_count() {
		return ser_count;
	}
	public int getSub_no() {
		return sub_no;
	}
	public String getTo_id() {
		return to_id;
	}
	public String getFrom_id() {
		return from_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public String getUser_header_img() {
		return user_header_img;
	}
	public int getUser_pro_img_no() {
		return user_pro_img_no;
	}
	public String getUser_job() {
		return user_job;
	}
	public Date getUser_jdate() {
		return user_jdate;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public Date getUser_birth() {
		return user_birth;
	}
	public String getUser_info() {
		return user_info;
	}
	public String getInterest_enter() {
		return Interest_enter;
	}
	public String getInterest_life() {
		return Interest_life;
	}
	public String getInterest_hobby() {
		return Interest_hobby;
	}
	public String getInterest_trends() {
		return Interest_trends;
	}
	
	/** SETTER */
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public void setBoard_user_id(String board_user_id) {
		this.board_user_id = board_user_id;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public void setBoard_like(String board_like) {
		this.board_like = board_like;
	}
	public void setBoard_wdate(Date board_wdate) {
		this.board_wdate = board_wdate;
	}
	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}
	public void setMms_no(int mms_no) {
		this.mms_no = mms_no;
	}
	public void setMms_content(String mms_content) {
		this.mms_content = mms_content;
	}
	public void setMms_wdate(Date mms_wdate) {
		this.mms_wdate = mms_wdate;
	}
	public void setMms_check(String mms_check) {
		this.mms_check = mms_check;
	}
	public void setMms_receive_id(String mms_receive_id) {
		this.mms_receive_id = mms_receive_id;
	}
	public void setMms_send_id(String mms_send_id) {
		this.mms_send_id = mms_send_id;
	}
	public void setPro_img_no(int pro_img_no) {
		this.pro_img_no = pro_img_no;
	}
	public void setPro_img_name(String pro_img_name) {
		this.pro_img_name = pro_img_name;
	}
	public void setKey_no(int key_no) {
		this.key_no = key_no;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public void setSer_count(String ser_count) {
		this.ser_count = ser_count;
	}
	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public void setUser_header_img(String user_header_img) {
		this.user_header_img = user_header_img;
	}
	public void setUser_pro_img_no(int user_pro_img_no) {
		this.user_pro_img_no = user_pro_img_no;
	}
	public void setUser_job(String user_job) {
		this.user_job = user_job;
	}
	public void setUser_jdate(Date user_jdate) {
		this.user_jdate = user_jdate;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}
	public void setUser_info(String user_info) {
		this.user_info = user_info;
	}
	public void setInterest_enter(String interest_enter) {
		Interest_enter = interest_enter;
	}
	public void setInterest_life(String interest_life) {
		Interest_life = interest_life;
	}
	public void setInterest_hobby(String interest_hobby) {
		Interest_hobby = interest_hobby;
	}
	public void setInterest_trends(String interest_trends) {
		Interest_trends = interest_trends;
	}
	
	
	
	
	
}
