<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
  
   <style>
   
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

   .paging-area{
      margin-top: 200px;
   }

   .paging-area button{
      width: 40px;
      height: 40px;
      font-size: large;
      font-weight: bolder;
      font-style: italic;

   }

   .product-menu{
      font-size: 20px;
   }
 </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <br>
    <h1 align="center">게시판</h1>
    <br>

    <div class="container" align="center"  >
        <div class="up-nav" >    
        <c:forEach var="b" items="${ list }">
            <nav class="nav">
                <div id="product"> 
                    <ul>
                        <li><a href="detailPage.bo?bno=${b.boardNo}">${b.boardTitle} </a></li>
                        
                        <li><a href="detailPage.bo?bno=${b.boardNo}"> <img src="${b.titleImg}" style="width: 150px; height: 120px;" > </a></li>
                        <li>${b.boardWriter}</li>
                        <li>${b.amount}</li>
                        <li>${b.createDate}</li>
                        <br>
                        <br>
                    </ul>
            </nav>
        </c:forEach>

        </div>
                               
                     
                 
                
            </div >
         
                <div id="paging-area" align="center">
                    <c:if test="${ pi.currentPage ne 1}">
                        <c:choose>
                            <c:when test="${empty condition}">
                                <a href="list.bo?cpage=${ pi.currentPage - 1 }">[이전]</a>
                            </c:when>
                            <c:otherwise>
                                <a href="search.bo?cpage=${ pi.currentPage - 1 }&condition=${condition}&keyword=${keyword}">[이전]</a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    
                    
                    <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <c:choose>
                            <c:when test="${empty condition}">
                                <a href="list.bo?cpage=${ i }">${ i }</a>
                            </c:when>
                            <c:otherwise>
                                <a href="search.bo?cpage=${ i }&condition=${condition}&keyword=${keyword}">${ i }</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    
                    
                    <c:if test="${ pi.currentPage ne pi.maxPage}">
                        <c:choose>
                            <c:when test="${empty condition}">
                                <a href="list.bo?cpage=${ pi.currentPage + 1 }">[다음]</a>
                            </c:when>
                            <c:otherwise>
                                <a href="search.bo?cpage=${ pi.currentPage + 1 }&condition=${condition}&keyword=${keyword}">[다음]</a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>

           
	            
          
       

       
    </div>
</body>
</html>