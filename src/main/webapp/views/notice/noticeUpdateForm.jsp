<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.notice.model.vo.Notice, com.semi.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.notice-up-wrap {
		padding-top: 60px;
	    padding-bottom: 32px;
	    font-weight: 700;
	    width: 677px;
    	margin: 72px auto 0 auto;
	}
    .notice-up-wrap h4 {
        text-align: center;
	    font-size: 32px;
	    font-weight: 700;
	}
    .notice-up-wrap dl.title{
    	margin-top: 40px;
    }
    .notice-up-wrap dl.content {
        padding-top: 20px;
        margin-bottom: 32px;
    }
    .notice-up-wrap dt{
        text-align: left; 
        padding-bottom: 15px; 
        font-size: 14px; 
        font-weight: 700;
    }
    .notice-up-wrap dd input{
        width: 100%; 
        height: 46px; 
        padding: 14px 16px;
        background-color: #fff;
        line-height: 1.5;
        color: #333;
        font-weight: 600;
        border: 1px solid #dedede;
    }
    .notice-up-wrap textarea{
        width: 100%;
        padding: 14px 16px;
        background-color: #fff;
        line-height: 1.5;
        color: #333;
        font-weight: 600;
        border: 1px solid #dedede;
    }
    .notice-up-wrap .btn-wrap{
        text-align: right;
    }
    .notice-up-wrap .btn-wrap button {
        height: 48px;
        padding: 0 32px;
        border: 1px solid #dedede;
        border-radius: 2px;
        margin-left: 5px;
    }
    .notice-up-wrap .btn-wrap button.submit{
    	color: #fff;
	    background: #ff6f0f;
	    border: none;
	}
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="notice-up-wrap" align="center">
        <h4 align="center">자주묻는 질문 수정하기</h4>
        <form action="<%=contextPath %>/update.no" id="update-form" method="post">
        <input type="hidden" name="num" value="<%=n.getNoticeNo()%>">
	        <dl class="title">
	        	<dt><label>제목</label></dt>
	        	<dd><input type="text" name="title" required value="<%=n.getNoticeTitle()%>"></dd>
	        </dl>
	        <dl class="content">
	            <dt><label>내용</label></dt>
	            <dd><textarea name="content" rows="10" style="resize: none;" required><%=n.getNoticeContent()%></textarea></dd>
	        </dl>  
            <div class="btn-wrap">
            	<button class="submit" type="submit">수정하기</button>
                <button type="button" onclick="history.back();">뒤로가기</button>
            </div>
        </form>
    </div>

   
</body>
</html>