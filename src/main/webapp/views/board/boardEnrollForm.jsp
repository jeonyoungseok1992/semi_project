<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>


<!-- bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- jquery 3.7.1 -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

<style>
    .main{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 450px;
        height: 700px;
        background: white;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        
    }
    .picture{
        display: inline-block;
        justify-content: left;
        align-items: left;
        flex-direction: column;
        width: 450px;


    }
   .picture2 {
    display:inline-block;
	width: 480px;
    margin-top: 10px;
    }
   

    .mb-3{
        margin-top: 10px;
        position: static;
    }
    .button-wrap{
        margin: 20px;
    }

</style>

</head>
<body>
    <%@ include file="../common/header.jsp"%>
    <div class="main">
        <form action="<%=contextPath%>/insert.bo" method="post" enctype="multipart/form-data" style="padding-left: 20px; padding-right: 20px;width: 450px; height: 450px;">
            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
           
               <label class="picture">
                    <tr>
                      
                        
                            <td>
                                <img src="resources/images/img/pictures.svg" alt="사용자 정의 이미지" width="30px">
                                대표이미지
                            </td>

                            <br>
                            <td>
                                <img id="title-img" width="160" height="130" onclick="chooseFile(1);">
                            </td>
                    </tr>

                </label>


                <label class="picture2">
                    <tr >
                        <th>상세이미지</th>
                        <br>

                        <td><img id="content-img1" width="133" height="120" onclick="chooseFile(2);"></td>
                        <td><img id="content-img2" width="133" height="120" onclick="chooseFile(3);"></td>
                        <td><img id="content-img3" width="133" height="120" onclick="chooseFile(4);"></td>
                    </tr>



                </label>
                <div style="display: none;">
                    <input type="file" name="file1" id="file1" required onchange="loadImg(this,1)">
                    <input type="file" name="file2" id="file2" onchange="loadImg(this,2)">
                    <input type="file" name="file3" id="file3" onchange="loadImg(this,3)">
                    <input type="file" name="file4" id="file4" onchange="loadImg(this,4)">
                </div>
                
                  <script>
                function loadImg(inputFile, num){
                   

                    if(inputFile.files.length == 1) { 
                        const reader = new FileReader();

                      
                        reader.readAsDataURL(inputFile.files[0]);
                        
                        reader.onload = function(ev){          
                            switch(num){
                                case 1: document.getElementById('title-img').src = ev.target.result; break;
                                case 2: document.getElementById('content-img1').src = ev.target.result; break;
                                case 3: document.getElementById('content-img2').src = ev.target.result; break;
                                case 4: document.getElementById('content-img3').src = ev.target.result;

                            }
                        }

                    } else { 
                        switch(num){
                            case 1: document.getElementById('title-img').src = null; break;
                            case 2: document.getElementById('content-img1').src = null; break;
                            case 3: $("#content-img2").attr("src", null); break;
                            case 4: $("#content-img3").attr("src", null);
                        }
                    }
                }
                
                function chooseFile(num){
                    $("#file" + num).click();
                }
            </script>
            

            <div class="mb-3" align="left">
                <label for="exampleFormControlInput1" class="form-label" style="margin-bottom: 10px;">제목</label>
                <input type="text" name="title"   class="form-control" id="exampleFormControlInput1" placeholder="제목" required>
            </div>
            
            <div class="mb-3" align="left">
                <label for="exampleFormControlInput1" class="form-label">가격</label>
                <input type="number" name="amount"  class="form-control" id="exampleFormControlInput1" placeholder="₩ 가격을 입력해주세요." style="margin-bottom: 40px;" required>
            </div>
            
            <div  class="mb-3" align="left>

                <label for="exampleFormControlTextarea1" class="form-label">자세한설명</label>

            </div>
            <div class="mb-3">
                <textarea class="form-control"  name="content" id="exampleFormControlTextarea1" rows="3" placeholder="00동에 올릴 게시글 내용을 작성해주세요. &#10;신뢰할 수 있는 거래를 위해 자세히 적어주세요." style="resize: none; margin-top: -50px; " required></textarea>
            </div >
            
            <div class="d-grid gap-2"  align="center" >
          
            <input type="submit" value="작성완료"  class="btn btn-primary" style="width: 100%; background: rgb(255, 111, 15); border: none; height: 45px;">
            </div>
            
            
        </form>

    </div>
    
    
</body>
</html>