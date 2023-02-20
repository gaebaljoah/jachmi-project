<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<style>
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
*{
 font-family: 'NanumSquareNeo-Variable';
}
			/* 로그인,로고이미지 묶음 */
            #top{
	            margin-top : 100px;
	            text-align: center;
	            margin: auto;
            }
            /* 로고이미지 */
            #logoimg{
            	margin-top : 30px;
            	width: 400px;
            }	
            /*로그인폼*/
            #joinform{
                padding:10px;
                text-align: center;
                margin-top: 10%;
                width: 700px;
                margin: auto;
            }
            
            .input-box{
                position:relative;
                margin:10px 0;
            }
            /* 아이디 비밀번호 박스 창  */
            .input-box > input{
                background:transparent;
                border:none;
                border-bottom: solid 1px #ccc;
                padding:20px 0px 5px 0px;
                font-size:14pt;
                width:55%;
           
            }
             /* 아이디 비밀번호 클릭부분 */
            input::placeholder{
                color:transparent;
            }
           /*아이디 비밀번호 라벨 */
            /* input:placeholder-shown + label{
                color:#aaa;
                font-size:14pt;
                top:15px;
                width : 58%;
            } */ 
            
            
            /* 아이디,비밀번호창을 클릭했을때 효과 */
            input:focus + label, label{
            	text-align : center;
                color:#8aa1a1;
                font-size:10pt;
                pointer-events: none;
                position: absolute;
                left:0px;
                top:0px;
                transition: all 0.2s ease ;
                -webkit-transition: all 0.2s ease;
                -moz-transition: all 0.2s ease;
                -o-transition: all 0.2s ease;
                 width : 50%;
            }

            /*주소 클릭했을때 밀리는부분*/
            input:focus, input:not(:placeholder-shown){
                border-bottom: solid 1px #8aa1a1;
                outline:none;
            }
            /* 회원가입버튼 */
            input[type=button]{
                background-color: #00a8f3;
                border:none;
                color:white;
                border-radius: 5px;
                width:50%;
                height:35px;
                font-size: 14pt;
            }
            input[type=button]:hover{
            		cursor: pointer;
            }
            
            #forgot:hover{
            	cursor: pointer;
            }
            
            /*주소찾기 버튼*/
            #addressSearch{
                position: absolute;
                left : 480px;
                bottom: 15px;
                background-color: #00a8f3;
                border: #e0feff;
                border-radius: 13px;
                height: 30px;
                color : white;
                
            }
              /*성별 선택*/
            #gender{
             position: absolute;
                bottom: 15px;
                border: #e0feff;
                height: 30px;
                left: 250px;
                top : 5px;
            }
        
</style>
<div id="top">
<a href="/"><img alt="" src="<spring:url value='/resources/image/logo.png'/>" id="logoimg"></a>
<h2 style="text-align: center; margin: 0;">회원가입</h2>
</div>
	  <form action="" method="POST" id="joinform">
	              
             <div class="input-box">
                <input id="name" type="text" name="name" placeholder="이름">
                <label for="name">이름</label>
            </div>
            
            
            <div class="input-box">
                <input id="id" type="text" name="id" placeholder="아이디">
                <label for="id">아이디</label>
               	<div><font id="id_feedback" size="2"></font></div>
            </div>
         
            <div class="input-box">
                <input id="password" type="password" name="pw" placeholder="비밀번호">
                <label for="password">비밀번호</label>
            </div>
            
             <div class="input-box">
                <input id="password2" type="password" name="pw2" placeholder="비밀번호재확인" onKeyUp="fn_compare_pwd();">
                <label for="password">비밀번호재확인</label><br>
                 <span id="s_result" style="font-size: 12px; color:red">비밀번호가 일치하지 않습니다.</span>
            </div>

             <div class="input-box">
                <input id="birth" type="text" name="birth" placeholder="생년월일">
                <label for="name">생년월일</label>
            </div>
           
             <div class="input-box">
                 <input type="text" placeholder="성별" readonly="readonly">
                <label for="name">성별</label>
                <select id="gender" name="gender">
                	<option value="남">남</option>
                	<option value="여">여</option>
                </select>
            </div>
            
            <div class="input-box">
                <input id="phone" type="text" name="phone" placeholder="연락처">
                <label for="phone">휴대전화</label>
            </div>
             <div class="input-box">
                <input id="email" type="email" name="email" placeholder="이메일">
                <label for="email">이메일</label>
            </div>
            
            <div class="input-box">
                <input id="c_main_address" type="text" name="addr" placeholder="주소">
                <label for="addr">주소</label>
                <button type="button" id="addressSearch" onclick="findAddr()">주소검색</button>
            </div>
             
            <div class="input-box">
                <input id="addr_ck" type="text" name="addr_ck" placeholder="상세주소">
                <label for="addr_ck">상세주소</label>
            </div>

            <input class="join" type="button" value="가입하기">

        </form>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function findAddr() {
	new daum.Postcode({
    	oncomplete: function(data) {
        	// 사용자 주소를 받아올 변수를 정의한다.
            var addr = '';
            
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우(R)
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            
            // 부모창의 주소칸에 받아온 주소를 넣는다.
            $("#c_main_address").val(addr);
    	}
 	}).open();
}



	$(".join").click(function(e){
		e.preventDefault();
		
		var f = document.getElementById("joinform");
		
		if(f.name.value == '' || f.id.value == '' || f.pw.value == '' || f.pw2.value == '' || 
				f.birth.value == '' || f.gender.value == '' || f.phone.value == '' || 
				f.email.value == '' || f.addr.value == '' || f.addr_ck.value == '') {
			alert("모든 정보를 입력해주세요.");
		}else{
			f.submit();
		}
		
	});
	
	 var compare_result = false;
	 function fn_compare_pwd(){
	     var pwd1 = $("#password").val();
	     var pwd2 = $("#password2").val();
	
	     var $s_result = $("#s_result");
	     
	     if(pwd1 == pwd2){
	         compare_result = true;
	         $s_result.text("비밀번호가 일치합니다.");
	         document.getElementById('s_result').style.color = "blue";
	         return;
	     }
	     compare_result = false;
	     $s_result.text("비밀번호가 일치하지 않습니다.");
	     document.getElementById('s_result').style.color = "red";
	}
/* 	 			var idval = $('#id').val()
	 	        var idvalcheck = /^[a-z0-9]+$/
	 			if(!idvalcheck.test(idval) || idval.length<6){
	 				
	 				alert('아이디는 영소문자,숫자로 구성된 6글자 이상으로 조합하시오.')
	 			    $('#id').focus()
	 			       
	 			} */

	 	$("#id").keyup(function(){
	 			var id = $("#id").val();

				$.ajax({
					type:'post',
					url : '/member/idCheck',
					data : {id: id},
					dataType: 'json',
					success:function(result){
						console.log(result)
						 if(result==1){
							 $("#id_feedback").html('이미 사용중인 아이디입니다.');
							 $("#id_feedback").attr('color','#dc3545');
						 } else{
							 $("#id_feedback").html('사용할 수 있는 아이디입니다.');
							 $("#id_feedback").attr('color','#2fb380');
						 }
					},
					error : function(xhr, status, er){
						console.log(xhr);
						console.log(status);
						console.log(er);
					}
				}); 
		}); 



</script>