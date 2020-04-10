package co.sns.common;

public class SerKeyListDTO {
	/* SER_KEY_LIST  TABLE  */
	int key_no;
	String keyword;
	int ser_count;
	
	
	/* Getters */
	public int getKey_no() {
		return key_no;
	}
	public String getKeyword() {
		return keyword;
	}
	public int getSer_count() {
		return ser_count;
	}
	
	
	/* Setters */
	public void setKey_no(int key_no) {
		this.key_no = key_no;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public void setSer_count(int ser_count) {
		this.ser_count = ser_count;
	}
}
