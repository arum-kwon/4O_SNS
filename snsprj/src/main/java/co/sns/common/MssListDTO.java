package co.sns.common;

import java.util.Date;

public class MssListDTO {
	/* MSS_LIST  TABLE */
	int mss_no;
	String mss_content;
	Date mss_wdate;
	int mss_check;
	String mss_receive_id;
	String mss_send_id;
	
	
	/* Getters */
	public int getMss_no() {
		return mss_no;
	}
	public String getMss_content() {
		return mss_content;
	}
	public Date getMss_wdate() {
		return mss_wdate;
	}
	public int getMss_check() {
		return mss_check;
	}
	public String getMss_receive_id() {
		return mss_receive_id;
	}
	public String getMss_send_id() {
		return mss_send_id;
	}
	
	
	/* Setters */
	public void setMss_no(int mss_no) {
		this.mss_no = mss_no;
	}
	public void setMss_content(String mss_content) {
		this.mss_content = mss_content;
	}
	public void setMss_wdate(Date mss_wdate) {
		this.mss_wdate = mss_wdate;
	}
	public void setMss_check(int mss_check) {
		this.mss_check = mss_check;
	}
	public void setMss_receive_id(String mss_receive_id) {
		this.mss_receive_id = mss_receive_id;
	}
	public void setMss_send_id(String mss_send_id) {
		this.mss_send_id = mss_send_id;
	}
	
	
	
}
