package searchdto;

public class likeyVO {
	private String user_id;
	private String info_id;
	private String user_ip;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getInfo_id() {
		return info_id;
	}
	public void setInfo_id(String info_id) {
		this.info_id = info_id;
	}
	public String getUser_ip() {
		return user_ip;
	}
	public void setUser_ip(String user_ip) {
		this.user_ip = user_ip;
	}
	
	public likeyVO() {
		
	}
	public likeyVO(String user_id, String info_id, String user_ip) {
		super();
		this.user_id = user_id;
		this.info_id = info_id;
		this.user_ip = user_ip;
	} 
	
	
}
