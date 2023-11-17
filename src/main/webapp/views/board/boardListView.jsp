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
      .Usedtrade{
		height: 230px;
    	padding: 0 16px 0 16px;
		background-color: #d2edfa;
		margin-top: 72px;
	}
	.Usedtrade .content{
		padding-top: 50px;
		max-width: 768px;
		margin: 0 auto;
		position: relative;
		height: 100%;
		box-sizing: border-box;
	}
	.Usedtrade .content h1{
		font-weight: 700;
		line-height: 1.5;
		font-size: 34px;
		letter-spacing: -0.32px;
		text-align: right;
	}
	.Usedtrade .content span{
		line-height: 1.32;
		font-size: 18px;
		letter-spacing: -0.18px;
		margin-top: 16px;
		display: block;
		text-align: right;
	}
      .board_main{
      padding-top: 64px;
   }
   section h2.title{
      padding-top: 60px;
      padding-bottom: 32px;
      font-size: 24px;
      font-weight: 700;
      max-width: 768px;
      margin: 0 auto;
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

      .up-nav{
         display: flex;
         justify-content: flex-start;
         flex-wrap: wrap;
         width: 100%;
         margin: 0 auto;
         width: 757px;
         gap: 44px;
      }

      .nav {
         width: 223px;
         margin-bottom: 56px;
         border: none;
      }

   
   .product:hover{cursor : pointer};
   
   .contents-wrap{
       font-size: 30px;
       padding-top: 30px;
       display: flex;
       justify-content: center;
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
   
   

   
   .product img{
       width: 200px;
       height: 200px;
       background-position: center;
       border-radius: 12px;      
   }
   .product-menu{
      margin-top: 12px;
   }
   
   .product-menu .card-title {
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
   
   .product-menu .card-price {
      font-size: 15px;
      font-weight: 700;
      line-height: 1.5;
      margin-bottom: 4px;
   }
   .product-menu .card-state {
      font-size: 13px;
      color: #212529;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      margin-bottom: 4px;
      line-height: 1.5;
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
       
      <section class="Usedtrade">
         <div class="content">
            <h1 class="title">중고거래의 모든것<br>이곳에서 확인하세요!</h1>
         </div>
      </section>


        <section class="card-all">
         <h2 class="title">중고거래</h2>
            <div class="contents-wrap">

                <div class="up-nav">
                       <%for(Board b :list){ %>  
                        <nav class="nav">
                              <div class = "product" onclick="location.href='<%=contextPath%>/detailPage.bo?bno=<%=b.getBoardNo() %>'" >
                                 <img src="<%=contextPath %>/<%=b.getTitleImg() %>">
                                    <ul class="product-menu">
                                       <li class="card-title"><%=b.getBoardTitle() %></li>
                                       <li class="card-price"><%=b.getAmount() %>원</li>      
                                       <li class="card-state">판매중</li>
                                    </ul>   
                              </div>      
                        </nav>
                  <%} %>
                </div>  
              
                
                
            <ul class="paging-area" align="center">
               <%if(currentPage != 1){ %>
                  <li><button onclick="location.href='<%=contextPath%>/boardlist.bo?cpage=<%=currentPage - 1%>'">[이전]</button></li>
               <% }%>
               
               <%for(int p = startPage; p<=endPage; p++) {%>
                  <%if(p== currentPage){ %>
                     <li><button disabled><%=p %></button></li>
                  <%}else{ %>
                     <li class="current"><button onclick="location.href='<%=contextPath%>/boardlist.bo?cpage=<%=p%>'"><%=p %></button></li>
                     <%} %>
                  <%} %>
                  
                  <%if(currentPage != maxPage){ %>
                     <li><button onclick="location.href='<%=contextPath%>/boardlist.bo?cpage=<%=currentPage + 1%>'">[다음]</button></li>
                  <% }%>
                  </ul>              
                    

     </div>
 </section>






 <script>
   function imgClick(){
      location href = "<%=contextPath%>/boardlist.bo"
   }
   
   
   
 </script>

           
            

</body>
</html>