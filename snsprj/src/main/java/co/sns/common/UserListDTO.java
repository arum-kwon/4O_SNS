package co.sns.common;

import java.util.Date;

public class UserListDTO {
	/* USER_LIST TABLE */
	String user_id;
	String user_name;
	String user_pw;
	String user_header_img;
	String user_pro_img_name;
	Date user_jdate;
	String user_info;
	Date user_birth;
	String user_gender;
	String user_job;
	String Interest_enter;
	String Interest_life;
	String Interest_hobby;
	String Interest_trends;
	
	
	/* Getters */
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
	public String getUser_pro_img_name() {
		return user_pro_img_name;
	}
	public Date getUser_jdate() {
		return user_jdate;
	}
	public String getUser_info() {
		return user_info;
	}
	public Date getUser_birth() {
		return user_birth;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public String getUser_job() {
		return user_job;
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
	
	
	/* Setters */
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
	public void setUser_pro_img_name(String user_pro_img_name) {
		this.user_pro_img_name = user_pro_img_name;
	}
	public void setUser_jdate(Date user_jdate) {
		this.user_jdate = user_jdate;
	}
	public void setUser_info(String user_info) {
		this.user_info = user_info;
	}
	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public void setUser_job(String user_job) {
		this.user_job = user_job;
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
