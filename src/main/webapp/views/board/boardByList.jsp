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
	}

</style>
</head>
<body>

        <%@ include file="/views/common/header.jsp" %>
        <div class="container">
            <div class="contents" id="contents">
                <div class="contents-wrap">
                    <div class = "sales-detail">나의 판매내역</div>
                </div>
           			
                <div class="up-nav">
                       <%for(Board b :list){ %>    
                    <nav class="nav" onclick="imgClick()">
                       
                        <div class = "product">
							<a href="#none"><img src="<%=contextPath %>/<%=b.getTitleImg() %>"></a>
                            <ul class="product-menu">
                                <li><a href="#none"><%=b.getBoardTitle() %></a></li>
                                <li><a href="#none">판매완료</a></li>
                                <li class="price"><a href="#none"><%=b.getAmount() %>원</a></li>
                            </ul>
                        </div>		
                    </nav>
					<%} %>
                </div>  
				<ul class="paging-area" align="center">
					<%if(currentPage != 1){ %>
						<li><button onclick="location.href='<%=contextPath%>/purchase.bo?cpage=<%=currentPage - 1%>'">[이전]</button></li>
					<% }%>
					
					<%for(int p = startPage; p<=endPage; p++) {%>
						<%if(p== currentPage){ %>
							<li><button disabled><%=p %></button></li>
						<%}else{ %>
							<li class="current"><button onclick="location.href='<%=contextPath%>/purchase.bo?cpage=<%=p%>'"><%=p %></button></li>
						   <%} %>
					   <%} %>
					   
					   <%if(currentPage != maxPage){ %>
						<li><button onclick="location.href='<%=contextPath%>/purchase.bo?cpage=<%=currentPage + 1%>'">[다음]</button></li>
					   <% }%>
				</ul>              
                    

     </div>
 </div>

 <script>
	function imgClick(){}

 </script>

           
            

</body>
</html>