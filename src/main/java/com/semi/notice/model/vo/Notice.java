package com.semi.notice.model.vo;

import java.sql.Date;

public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter; // 공지사항에서 회원번호 | 작성자 아이디 | 작성자 이름
	private Date createDate;
	private String status;
	
	public Notice() {}

	//모든 필드를 초기화하는 생성자
	public Notice(int noticeNo, String noticeTitle, String noticeContent, String noticeWriter,
			Date createDate, String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.createDate = createDate;
		this.status = status;
	}
	
	public Notice(int noticeNo, String noticeTitle, String noticeWriter, String noticeContent, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeContent = noticeContent;
		this.createDate = createDate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}
	
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}


	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeWriter=" + noticeWriter + ", createDate=" + createDate + ", status=" + status + "]";
	}


	
}
