<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jquery 3.7.1 -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>


<style>
    .outer{
        background: white;
        color: black;
        width: 1000px;
        margin: auto;
        margin-top: 100px;
    }
	h2{
	    font-size: 28px;
    	font-weight: 700;
    }
    #mem-enroll-form table{margin: auto;}
    #mem-enroll-form input{
        margin: 10px;
        width: 384px;
    	height: 45px;
        border: 1px solid #ced4da;
        border-radius: 5px; 
        padding-left: 15px;
        
    } 

#joinMember{

    width: 384px; background: rgb(255, 111, 15);  

    border: 1px solid;
    border-radius: 5px; 
    color: white; height: 45px;
}

#reset{
	width: 100px; background: white;  

    border: 1px solid;
    border-radius: 5px; 
    color: black; height: 45px;
}

#userId{
	width: 70px; background: white;  

    border: 1px solid;
    border-radius: 5px; 
    color: black; height: 45px;
}

</style>

</head>
<body>
   <%@ include file="../common/header.jsp"%>

    <div class="outer">
        <br>
        <h2 align="center">회원가입</h2>

        <form action="<%=contextPath%>/insert.me" id="mem-enroll-form" >
            <table style="width:auto;">
                <tr>
                    <td>아이디 *  </td> 
                    <br>
                    <td><input type="text" name="userId" maxlength="12"  placeholder="아이디를 입력해주세요."required></td>
                    <td><button id = "userId" type = "button" onclick="idCheck()">중복확인</button></td>
                    <!-- <td><button type="button" style="background-color: #FF8B3D;  border: 1px solid;
                        border-radius: 5px; 
                        color: white; height: 35px;">중복확인</button></td> -->
                </tr>
                <tr> 
                    <td>비밀번호*</td>
                    <td><input type="password" name="userPwd" maxlength="15" placeholder="비밀번호를 입력해주세요." required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>비밀번호 확인*</td>
                    <td><input type="password" name="userPwdCheck" maxlength="15" placeholder="비밀번호를 한 번 더 입력해주세요." required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>이름  *</td>
                    <td><input type="text" name="userName" maxlength="6" placeholder="이름을 입력해주세요." required></td>
                    <td></td>
                </tr> 
                <tr>
	                <form id = "form1">      
	                    <td style="height: 300px;  "> 주소</td>
	                   	<td style="list-style: none;">
                        <li><input type = "button" id = "btn" value="우편번호검색"><br> </li>
	                   	<li><input type="text" id="zipcode" name="zipcode" size="5" placeholder = "우편번호" readonly></li>     
						<li><input type="text" id="addr1" name="addr1" size="50" placeholder="도로명주소" readonly><br> </li>
                       
						<li><input type="text" id="addr2" name="addr2" size="50" placeholder="상세주소"></li>          
	                  <!--  <td><input type="text" name="address" placeholder="주소를 입력해주세요." ></td>
	                    <td></td>
	               		 --> 
	               		 </td>
	                </form>    
                </tr>
                
            </table>
            
            <!-- 도로명 주소 -->
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
				const btn = document.querySelector("#btn");

               
				btn.addEventListener("click", () => {
                    new daum.Postcode({
			        oncomplete: function(data) {
			            console.log(data);
                        let fullAddr = '';
                        let extraAddr = '';

                        if(data.userSelectedType === 'R'){
                            fullAddr = data.roadAddress;

                        } else{
                            fullAddr = data.jibunAddress;
                        }

                        document.getElementById('addr1').value=fullAddr;
                       
                        document.getElementById('zipcode').value =  data.zonecode;
			        }
			    }).open();

                });
			    
			</script>

            <br><br>

            <div align = "center" >
                <button type="submit" id="joinMember" onclick="return checkPwd()">회원가입</button>
            	<button type = "reset" id = "reset">초기화</button>
            </div>

            <br><br>

        </form>
		<script>
	       <!--비밀번호 제약-->
            function checkPwd(){
                let pwdInput = document.querySelector("#mem-enroll-form input[name=userPwd]");
                let pwdCheckInput = document.querySelector("#mem-enroll-form input[name=userPwdCheck]");
               
                if(pwdInput.value !== pwdCheckInput.value){
                    alert("비밀번호가 일치하지않습니다.");
                    return false;      
                }
            }
            
            function idCheck(){
            

            	const inInput = document.querySelector("#mem-enroll-form input[name=userId]");

                if(inInput.value.length == 0){
            		alert("아이디를 입력해주세요.");
            		return;
            	}

            	$.ajax({
            		url : "idCheck.me",
            		data : {
            			"checkId" : inInput.value
            		},
            		success : function(res){
            			if(res === "NNNNY"){
            				if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
            					let submitBtn = document.querySelector("#mem-enroll-form button[type=submit]");
            					submitBtn.removeAttribute("disabled");
                                disabled.setAttribute("readonly", true);
                            } else{
                                inInput.focus();
                            }
                        } else{
                            alert("사용하실 수 없는 아이디입니다. 다시 입력해주세요.");
                            inInput.focus();
                        }
                    },
                    error : function(){
                        console.log("아이디 중복체크용 ajax 통신 실패");
                    }	
            		
            	})
            }
        </script>
    </div>
</body>
</html>