package com.semi.board.model.vo;

public class Reply {

	private int replyNo;
	private String replyContent;
	private int refBoardNo;
	private String replyWriter;
	private String createDate;
	private String status;
	private int replyUserNo;
	private String profileUrl;
	
	public Reply() {}
	
	
	
	

	public Reply(int replyNo, String replyContent, String replyWriter, String createDate, int replyUserNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.replyUserNo = replyUserNo;
	}





	public Reply(int replyNo, String replyContent, int refBoardNo, String replyWriter, String createDate,
			String status) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.refBoardNo = refBoardNo;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.status = status;
	}

	//리플리스트 가져올 때
	public Reply(int replyNo, String replyContent, String replyWriter, String createDate, String profileUrl) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.profileUrl = profileUrl;
	}
	
	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getRefBoardNo() {
		return refBoardNo;
	}

	public void setRefBoardNo(int refBoardNo) {
		this.refBoardNo = refBoardNo;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	public String getProfileUrl() {
		return profileUrl;
	}



	public void setProfileUrl(String profileUrl) {
		this.profileUrl = profileUrl;
	}



	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", refBoardNo=" + refBoardNo
				+ ", replyWriter=" + replyWriter + ", createDate=" + createDate + ", status=" + status + ", profileUrl="
				+ profileUrl + "]";
	}



	
}
