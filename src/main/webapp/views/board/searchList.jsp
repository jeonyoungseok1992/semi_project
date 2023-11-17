<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .board_main {
        padding-top: 64px;
        margin-top: 72px;
    }
   .board_main .title{
       text-align: center;
       font-size: 32px;
       font-weight: 700;
   }
   .board_main .cards-wrap {
      display: flex;
       justify-content: flex-start;
       flex-wrap: wrap;
       width: 100%;
       margin: 0 auto;
       margin-top: 40px;
       width: 757px;
       gap: 44px;
   }
   .board_main .cards-wrap .cards {
       width: 223px;
       margin-bottom: 56px;
       border: none;
   }
   .board_main .cards-wrap .cards > a {
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
   
   .product:hover{cursor : pointer};
   
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
         hover{cursor : pointer};
       
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

   #paging-area{
   		display : flex;
      margin-top: 32px;
      margin-bottom: 100px;
      width: 100%;
      padding-left : 400px
   }
   
 


   .product-menu{
      font-size: 20px;
   }
 </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <section class="board_main">
        <h1 class="title">검색결과</h1>
        <div class="cards-wrap">
            <c:forEach var="b" items="${ list }">
                <div class="cards" id="product">
                    <a href="detailPage.bo?bno=${b.boardNo}"> 
                       <div class="card-photo ">
                        <img src="${b.titleImg}">
                     </div>
                    <div class="card-desc">
                       <h2 class="card-title">${b.boardTitle}</h2>
                       <div class="card-price">
                        ${b.amount}
                       </div>
                       <div class="card-address">
                        ${b.boardWriter}
                       </div>
                       <div class="card-counts">
                           <span>
                            ${b.createDate}
                           </span>
                       </div>
                     </div>
                    </a>
                 </div>
            </c:forEach>
       
            <ul id="paging-area" align="center">
                <c:if test="${ pi.currentPage ne 1}">
                    <c:choose>
                        <c:when test="${empty condition}">
                            <li><a href="list.bo?cpage=${ pi.currentPage - 1 }">[이전]</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="search.bo?cpage=${ pi.currentPage - 1 }&condition=${condition}&keyword=${keyword}">[이전]</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                
                
                <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <c:choose>
                        <c:when test="${empty condition}">
                            <li class="current"><a href="list.bo?cpage=${ i }">${ i }</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="search.bo?cpage=${ i }&condition=${condition}&keyword=${keyword}">${ i }</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                
                <c:if test="${ pi.currentPage ne pi.maxPage}">
                    <c:choose>
                        <c:when test="${empty condition}">
                            <li><a href="list.bo?cpage=${ pi.currentPage + 1 }">[다음]</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="search.bo?cpage=${ pi.currentPage + 1 }&condition=${condition}&keyword=${keyword}">[다음]</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </ul>
          

        </div>
    </section>

</body>
</html>