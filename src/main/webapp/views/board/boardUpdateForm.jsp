<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.semi.board.model.vo.*, com.semi.common.model.vo.Attachment" %>   
    
<%
	Board b = (Board)request.getAttribute("b");
	
	ArrayList<Attachment> atList = (ArrayList)request.getAttribute("atList");

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<style>
    .main{
        position: absolute;
        top: 40%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 450px;
        height: 600px;
        background: white;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    .main > h2 {
        padding-bottom: 32px;
        font-size: 24px;
        font-weight: 700;
        text-align: left;
        width: 100%;
    }
    .picture{
        display: flex;
        justify-content: left;
        align-items: left;
        flex-direction: column;

    }

    .mb-3{
        margin-top: 50px;
    }
    .button-wrap{
        margin: 20px;
    }
    /* #amount:invalid {
    border: 3px solid red;
} */


</style>
</head>
 <%@ include file="../common/header.jsp"%>
    <div class="main">
        <h2>글 수정하기</h2>
        <form action="update.bo?bno=${b.boardNo}" method="post" enctype="multipart/form-data" style="width: 450px; height: 450px;">
            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
            <input type="hidden" name="bno" value="${b.boardNo }">
            <input type="hidden" name="atList" value="${atList}">
            <div>
                <img id="content-img1" width="150" height="120" onclick="chooseFile(1);" src="${atList[0].filePath}${atList[0].changeName}">
                <img id="content-img2" width="150" height="120" onclick="chooseFile(2);" src="${atList[1].filePath}${atList[1].changeName}">
                <img id="content-img3" width="150" height="120" onclick="chooseFile(3);" src="${atList[2].filePath}${atList[2].changeName}">
                <img id="content-img4" width="150" height="120" onclick="chooseFile(4);" src="${atList[3].filePath}${atList[3].changeName}">
            </div>
      		



            <div style="display: none ">
                <input type="file" name="file1" id="file1" onchange="loadImg(this,1)">
                <input type="file" name="file2" id="file2" onchange="loadImg(this,2)">
                <input type="file" name="file3" id="file3" onchange="loadImg(this,3)">
                <input type="file" name="file4" id="file4" onchange="loadImg(this,4)">


            </div>
            
            <div class="mb-3" align="left">
                <label for="exampleFormControlInput1" class="form-label" style="margin-bottom: 10px;">제목</label>
                <input type="text" name="title"   class="form-control" id="title" placeholder="${b.boardTitle}" value="${b.boardTitle}" onclick="vWrite(this)" required >
            </div>
            
            <div class="mb-3" align="left">
                <label for="exampleFormControlInput1" class="form-label">가격(원)</label>
                <input type="text" pattern="[0-9]+"  oninput="validateAmount(this)" name="amount"  class="form-control" id="amount" placeholder="₩ ${b.amount}" value="${b.amount}" style="margin-bottom: 40px;" onclick="amountWrite(this)" required>
            	<span id="amountError" style="color: red;"></span>
            </div>
            
            <div style="margin-bottom: -35px;">
                <label for="exampleFormControlTextarea1" class="form-label" ></label>

            </div>
            <div class="mb-3">
                <textarea class="form-control"  name="content" id="exampleFormControlTextarea1" rows="3" placeholder="00동에 올릴 게시글 내용을 작성해주세요. &#10;신뢰할 수 있는 거래를 위해 자세히 적어주세요." style="resize: none; margin-top: -50px; " required>${b.boardContent}</textarea>
            </div >
            
            <div class="d-grid gap-2"  align="center">
          
            <input type="submit" value="수정완료"  class="btn btn-primary" style="width: 100%; background: rgb(255, 111, 15); border: none; height: 45px;">
            </div>
            
            
            <script>
                function loadImg(inputFile, num){
                    //console.log(inputFile);
                    //inputFile : 현재 변화가 생긴 input type=file 요소객체
                    // num : 몇번째 input요소인지 확인하기위한 파라미터

                    //inputFile.files[0]에 선택된 파일이 담겨있을 것이다.
                    //inputFile.files.length => 1일 것이다.

                    if(inputFile.files.length == 1){ //파일이 선택된 경우 => 미리보기 나타나게
                        //파일을 읽어들일 FileReader객체 생성
                        const reader = new FileReader();

                        //파일을 읽어들이는 메서드
                        //해당파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
                        reader.readAsDataURL(inputFile.files[0]);   // => 파일에 대한 url 생성됨.

                        //파일 읽어들이기 완료했을 때 실행 할 함수 정의
                        reader.onload = function(ev){    //reader 준비되었을 때 onload이기 때문에 자동실행  === window.onload
                        	//console.log(ev);  ==> function
                        	//console.log(ev.target);	==> reader
                        	//console.log(ev.target.result)  ;	==> file url
                            //$("#title-img").attr("src", ev.target.result);
                            //document.getElementById('title-img').src = ev.target.result;
                            
                            //FileReader의 result == 이미지 url

                            switch(num){
                                case 1 : document.getElementById('content-img1').src = ev.target.result; break;
                                case 2 : document.getElementById('content-img2').src = ev.target.result; break;
                                case 3 : document.getElementById('content-img3').src = ev.target.result; break;
                                case 4 : document.getElementById('content-img4').src = ev.target.result;
                            }

                        }


                    } else {    //선택된 파일이 취소된 경우 => 미리보기 사라지게
                        switch(num){
                                case 1 : document.getElementById('content-img1').src = null;
                                case 2 : document.getElementById('content-img2').src = null;
                                case 3 : document.getElementById('content-img3').src = null;
                                case 4 : document.getElementById('content-img4').src = null;
                            }

                    }
                }
            
            
                function chooseFile(num){
                   // $("#file"+ num).click();
                    document.getElementById("file"+num).click();
                }
            </script>
            <script>
                function vWrite(this){
                    document.getElementById("title").innerText = this.value;

                }

                function amountWrite(this){
                    document.getElementById("amount").innerText = this.value;
                }
                
                
                function validateAmount(input) {
                    var amountError = document.getElementById('amountError');
                    var inputValue = input.value;

                    // Check if the entered value is a number
                    if (!/^[0-9]+$/.test(inputValue)) {
                        amountError.textContent = 'Please enter only numbers.';
                    } else {
                        amountError.textContent = ''; // Clear the error message if the input is valid
                    }
                }

                
            </script>
            
            
            
            
        </form>

    </div>
                
<body>

</body>
</html>