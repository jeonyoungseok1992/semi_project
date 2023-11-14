<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.semi.notice.model.vo.Notice, com.semi.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<style>
	.accordion-qna{
	    position: relative;
		width: 677px;
    	margin: 72px auto 0 auto;
	}
	.accordion-qna a.insert{
		position: absolute;
	    top: 40px;
	    right: 0;
	    color: #fff;
	    background: #ff6f0f;
	    border: none;
	    display: block;
	}
	.accordion-qna h2{
		padding-top: 60px;
	    padding-bottom: 32px;
	    font-size: 24px;
	    font-weight: 700;
	}
	.qna-wrap{
		border-top: 1px solid #dedede;
	}
	.qna-wrap .nodata{
		margin-top: 24px;
	    padding: 80px 0;
	    color: #707070;
	    line-height: 2;
	    text-align: center;
	}
	.qna-wrap>dl {
	   border-bottom: 1px solid #dedede;
	}
	.qna-wrap .admin-btn > a{
		color: #fff;
	    background: #ff6f0f;
	    border: none;
	}
	.qna-wrap .admin-btn{
		text-align: right;
    	padding-top: 5px;
	}
	.qna-wrap .accordion-trigger {
	    position: relative;
	    padding-left: 48px;
	    width: 100%;
	    padding: 16px 52px 16px 20px;
	    text-align: left;
	}
	.qna-wrap .accordion-panel>div {
	    padding: 24px 48px;
	    font-size: var(--font-size-2);
	    line-height: 1.5;
	    background-color: #f9f9f9;
	}
	.accordion-title .title {
	    display: flex;
	    column-gap: 10px;
	    align-items: center;
	    line-height: 1.5;
	}
	.qna-wrap .accordion-trigger:after {
	    content: '🡣';
	    position: absolute;
	    top: 50%;
	    right: 21px;
	    transform: translateY(-50%);
	    transition: .3s;
	}
	.qna-wrap .accordion-trigger[aria-expanded="true"]:after {
	    transform: rotate(180deg) translateY(50%);
	}
</style>
<body>
	<jsp:include page="../common/header.jsp" />
		<section class="accordion-qna">
			<h2>자주 묻는 질문</h2>
			<% if (loginUser != null && loginUser.getUserId().equals("admin")) {%>
			        <!-- 현재 로그인한 사용자가 관리자일 경우에 보여짐-->
			        <a href="<%=contextPath %>/enroll.no" class="btn btn-sm btn-secondary insert">글쓰기</a>
				<%} %>
	        <div class="qna-wrap">
				<% if (list.isEmpty()) { %>
                 <!-- case1. 공지사항 없을경우 -->
                 <div class="nodata">
                     <strong class="text-md">등록된 FAQ가 없습니다.</strong>
                 </div>
                 <%} else { %>
                 <!-- case2. 공지사항이 있을경우 -->
                <% for (Notice n : list) { %>
                
				<dl class="">
				<% if (loginUser != null && loginUser.getUserId().equals("admin")) {%>
					<div class="admin-btn">	
						<a href="<%=contextPath %>/updateForm.no?num=<%=n.getNoticeNo()%>" class="btn btn-sm btn-warning">수정하기</a>
						<a href="<%=contextPath %>/delete.no?num=<%=n.getNoticeNo()%>" class="btn btn-sm btn-danger">삭제하기</a>
					</div>
				<%} %>	
					<dt class="accordion-title">
						<button type="button" aria-expanded="false" class="accordion-trigger" aria-controls="panel1" id="acc1id">
							<span class="title"><%=n.getNoticeTitle() %></span>
						</button>
					</dt>
					<dd class="accordion-panel" role="region" id="panel1" aria-labelledby="acc1id" style="display: none;">
						<div>
							<div class="cont">
		                       <%=n.getNoticeContent() %>
		                    </div>
						</div>
					</dd>
				</dl>
				<%} %>
            <%} %>
			</div>	
        </section>
		<script>
		    $(document).ready(function() {
		        $('.accordion-qna').each(function() {
		            if ($(this).data('init') || !$(this).find('dl').length) return;
		            $(this).data('init', true);
		
		            var $this = $(this);
		            var isSingle = $this.data('type') == 'single' ? true : false;
		
		            $this.on('click.toggle', '.accordion-trigger', function(evt, isFirst) {
		                var $list = $this.find('dl');
		                var $listAll = $this.find('.accordion-panel');
		                var $listParent = $(this).closest('dl');
		                var $listContent = $(this).closest('dl').find('.accordion-panel');
		                var $trigger = $list.find('.accordion-trigger');
		                var isExpanded = $(this).attr('aria-expanded');
		
		                if (isSingle) {
		                    if (!isFirst) {
		                        $listParent.toggleClass('open');
		                    }
		                    if (isExpanded == 'true') {
		                        $(this).attr('aria-expanded', false);
		                    } else {
		                        $(this).attr('aria-expanded', true);
		                    }
		                    $listContent.stop(true, true).slideToggle();
		                } else {
		                    $list.not($listParent).removeClass('open');
		                    if (!isFirst) {
		                        $listParent.toggleClass('open');
		                    }
		                    if (isExpanded == 'true') {
		                        $(this).attr('aria-expanded', false);
		                    } else {
		                        $(this).attr('aria-expanded', true);
		                    }
		                    $trigger.not($(this)).attr('aria-expanded', false);
		                    $listAll.not($listContent).slideUp();
		                    $listContent.stop(true, true).slideToggle();
		                }
		            });
		        });
		    });
		</script>
</body>
</html>