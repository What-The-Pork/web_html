package searchdto;

public class rankingVO {
	private String SmallC_id;
	private String info_id;
	private String info_name;
	private String user_id;
	private int cnt;
	
	public String getSmallC_id() {
		return SmallC_id;
	}
	public void setSmallC_id(String smallC_id) {
		SmallC_id = smallC_id;
	}
	public String getInfo_id() {
		return info_id;
	}
	public void setInfo_id(String info_id) {
		this.info_id = info_id;
	}
	public String getInfo_name() {
		return info_name;
	}
	public void setInfo_name(String info_name) {
		this.info_name = info_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public rankingVO() {
		
	}
	
	public rankingVO(String smallC_id, String info_id, String info_name, String user_id, int cnt) {
		super();
		SmallC_id = smallC_id;
		this.info_id = info_id;
		this.info_name = info_name;
		this.user_id = user_id;
		this.cnt = cnt;
	}
	
	
}
