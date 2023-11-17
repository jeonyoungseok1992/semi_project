<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.common.model.vo.PageInfo, java.util.ArrayList, com.semi.board.model.vo.Board"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
	.board_main{
      padding-top: 64px;
   }
   .title{
       text-align: center;
       font-size: 32px;
       font-weight: 700;
   }
   .cards-wrap {
      display: flex;
       justify-content: flex-start;
       flex-wrap: wrap;
       width: 100%;
       margin: 0 auto;
       margin-top: 40px;
       width: 757px;
       gap: 44px;
   }
   .cards-wrap .cards {
       width: 223px;
       margin-bottom: 56px;
       border: none;
   }
   .cards-wrap .cards > a {
       text-decoration: none;
       color: #212529;
   }
   .card-photo {
      width: 100%;
       padding-top: 100%;
       position: relative;
       overflow: hidden;
       border-radius: 12px;
       background-color: #F8F9FA;
       box-sizing: border-box;
   }
   .card-photo > img {
      position: absolute;
       top: 0;
       bottom: 0;
       width: 100%;
       height: 100%;
       box-sizing: border-box;
       border-radius: 12px;
       border: 1px solid transparent;
   }
   .card-desc {
      margin-top: 12px;
   }
   .card-desc .card-title {
      font-size: 16px;
       letter-spacing: -0.02px;
       color: #212529;
       overflow: hidden;
       white-space: nowrap;
       text-overflow: ellipsis;
       margin-bottom: 4px;
       line-height: 1.5;
       font-weight: normal;
   }
   .card-desc .card-price {
      font-size: 15px;
       font-weight: 700;
       line-height: 1.5;
       margin-bottom: 4px;
   }
   .card-desc .card-address{
      font-size: 13px;
       color: #212529;
       overflow: hidden;
       white-space: nowrap;
       text-overflow: ellipsis;
       margin-bottom: 4px;
       line-height: 1.5;
   }
   .card-desc .card-counts{
      color: #868e96;
       font-size: 13px;
   }

	/* contents */
	.contents{
	    padding-top: 80px;
	    width: 80%;
	    height : 850px;
	    margin: 0 auto;
	}
	
	
	.contents .contents-wrap{
	    font-size: 30px;
	    padding-top: 30px;
	    display: flex;
	    justify-content: center;
	}
	.sales-detail {
		font-weight: 700;
	}
	
	/* 이미지 */
	/* .container .nav img{
	    display: block;
	    width: 150%;
	    height: 150;
	} */
	
	
	/* .product:first-child{
	    margin-left: 220px;
	} */
	
	
	
	.product  {
	    padding-top: 50px;
	    flex: 1;
	    
	     /* flex-grow : 1; */
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	   
	    
	}
	
	.product img{
	    width: 200px;
	    height: 200px;
	    background-position: center;
	    border-radius: 12px;	   
	}
	
	.contents .nav .product-menu li{
	    text-align: center;
	    font-size: 16px;
	    color: black;
	    align-items: center;
	    justify-content: center;
	}
	.contents .nav .product-menu li.price a{
		font-weight: 700;
	}

	.up-nav{
		margin-top: 100px;
		display: flex;
		justify-content: space-evenly;
		align-items:center;

	}

	.paging-area{
		margin-top: 32px;
		margin-bottom: 100px;
		width: 100%;
	}

</style>
</head>
<body>

        <%@ include file="/views/common/header.jsp" %>
        <div class="container">
            <div class="contents" id="contents">
                <div class="contents-wrap">
                    <div class = "sales-detail" >나의 구매내역</div>
                </div>
				<div class="cards-wrap">
					<%for(Board b :list){ %>
					<div class="cards" onclick="location.href='<%=contextPath%>/detailPage.bo?bno=<%=b.getBoardNo() %>'">
						<a>
						<div class="card-photo ">
							<img src="<%=contextPath %>/<%=b.getTitleImg() %>">
						</div>
						<div class="card-desc">
							<h2 class="card-title"><%=b.getBoardTitle() %></h2>
							<div class="card-price">
								<%=b.getAmount() %>원
							</div>
							<div class="card-address">
								구매완료
							</div>
						</div>
						</a>
					</div>
					<%} %>

					<ul class="paging-area" align="center">
						<%if(currentPage != 1){ %>
							<li><button onclick="location.href='<%=contextPath%>/buyDetail.bo?cpage=<%=currentPage - 1%>'">[이전]</button></li>
						<% }%>
						
						<%for(int p = startPage; p<=endPage; p++) {%>
							<%if(p== currentPage){ %>
								<li class="current"><button disabled><%=p %></button>
							<%}else{ %>
								<li><button onclick="location.href='<%=contextPath%>/buyDetail.bo?cpage=<%=p%>'"><%=p %></button></li>
							   <%} %>
						   <%} %>
						   
						   <%if(currentPage != maxPage){ %>
							<li><button onclick="location.href='<%=contextPath%>/buyDetail.bo?cpage=<%=currentPage + 1%>'">[다음]</button></li>
						   <% }%>
					</ul>  
				</div>


				            
                    
     </div>
 </div>

 <script>
	function imgClick(){}

 </script>

           
            

</body>
</html>