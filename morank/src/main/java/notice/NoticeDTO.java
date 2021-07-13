package notice;

public class NoticeDTO {
	private int noticeid;
	private String noticeTitle;
	private String noticeContent;
	
	public int getNoticeid() {
		return noticeid;
	}
	public void setNoticeid(int noticeid) {
		this.noticeid = noticeid;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public NoticeDTO() {
		
	}
	public NoticeDTO(int noticeid, String noticeTitle, String noticeContent) {
		super();
		this.noticeid = noticeid;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}
	
	
}
