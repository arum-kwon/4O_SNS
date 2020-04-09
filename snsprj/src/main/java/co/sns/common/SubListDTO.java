package co.sns.common;

public class SubListDTO {
	/* SUB_LIST TABLE */
	int sub_no;
	String to_id;
	String from_id;
	
	
	/* Getters */
	public int getSub_no() {
		return sub_no;
	}
	public String getTo_id() {
		return to_id;
	}
	public String getFrom_id() {
		return from_id;
	}
	
	
	/* Setters */
	public void setSub_no(int sub_no) {
		this.sub_no = sub_no;
	}
	public void setTo_id(String to_id) {
		this.to_id = to_id;
	}
	public void setFrom_id(String from_id) {
		this.from_id = from_id;
	}
}
