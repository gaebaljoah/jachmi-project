<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="../include/header.jsp" %>
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

			/*form div부분*/
			.whole{
				text-align: center;
				margin-left: 10px;
				margin-top: 30px;
				
			}
			/*회원탈퇴 div*/
			.unregister{
				font-size: small;
				font-weight: bold;
				text-align: center;
				
			}
			/*내용변경칸*/
            input{
                position:relative;
                margin:auto;
                border:none;
                border-bottom: solid 1px #8aa1a1;
                text-align: center;
				height: 30px;              
				width: 20%;
            }
            /*성명~성별 div - 추후없애도될것같음 */
            .modifyMember{
            	margin:auto;
            }
            /*성명~성별 사이의간격 */
    		.input-box{
    			margin-bottom : 50px;
    		}	
    		
    		.bmodify{
    			border:  none;
    			background-color: white;
    		}
    		.button1{
    			margin-left: 5%;
    		}
    		/*이메일변경버튼*/
    		#modify1{
    			margin-left: 5%;
    			border:  none;
    			background-color: white;
    			position: absolute;
                right : 700px;
                bottom: 15px;
                background-color: #00a8f3;
                border: #e0feff;
                border-radius: 13px;
                height: 30px;
                color : white;
                width: 70px;
    			
    		}
    		
    		/* 저장하기 버튼 */
    		#modify2{
    		 background-color: #00a8f3;
                border:none;
                color:white;
                border-radius: 5px;
                width:25%;
                height:35px;
                font-size: 14pt;
    			
    		}
    		/*주소검색버튼*/
    		#addressSearch{
    			position: absolute;
                right : 700px;
                bottom: 15px;
                background-color: #00a8f3;
                border: #e0feff;
                border-radius: 13px;
                height: 30px;
                color : white;
                width: 100px;
    		}
    		button{
    			cursor:pointer;
    			background-color: red;
    		}
    		.move{
    			text-decoration: underline;
    			color: black;
    			text-align: center;
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
                margin:43px 0;
                
            }
            /* 아이디 비밀번호 박스 창  */
            .input-box > input{
                background:transparent;
                border:none;
                border-bottom: solid 1px #ccc;
                padding:20px 0px 5px 0px;
                font-size:14pt;
                width:25%;
           
            }
             /* 아이디 비밀번호 클릭부분 */
            input::placeholder{
                color:transparent;
               
            }
            
            label{
            text-align : center;
                color:#8aa1a1;
                font-size:10pt;
                pointer-events: none;
                position: absolute;
                left:250px;
                top:0px;
                transition: all 0.2s ease ;
                width : 50%;
            }
    		
</style>


 <!-- 본문시작 -->
	<div id="body-wrapper">
	<div id="body-content">

<h1 style="text-align: center; margin-bottom: 10px;" >회원정보수정</h1>
<hr class="my-hr3">
	<div class="whole">
	  <form action="/member/modify" method="POST" id="myinfoform">

            <div class="modifyMember">
             <div class="input-box">
                <label for="name">성명</label>
                <input id="name" name="name" value="${signIn.name }" readonly="readonly">
            </div>
            
            <div class="input-box">
                <label for="phone">연락처</label>
                <input id="phone" name="phone" value="${signIn.phone }" readonly="readonly">
            </div>
            
            <div class="input-box">
                <label for="name">생일</label>
                <input id="birth" name="birth" value="${signIn.birth }" readonly="readonly">
            </div>
            
             <div class="input-box">
                <label for="name">성별</label>
         		<input id="gender" name="gender" value="${signIn.gender }"  readonly="readonly">
            </div>
             
             </div>

             <div class="modifyMember2">
             <div class="input-box">
                <label for="email">이메일</label>
                <input id="email" type="email" name="email" value="${signIn.email }">
             	 <button id="modify1">변경</button>
            </div>
            
            <div class="input-box">
                <label for="addr">주소</label>
                <input id="c_main_address" type="text" name="addr" value="${signIn.addr }">
           		<button type="button" id="addressSearch" onclick="findAddr()">주소검색</button>
            </div>
             
            <div class="input-box">
                <label for="addr_ck">상세주소</label>
                <input id="addr_ck" type="text" name="addr_ck" value="${signIn.addr_ck }">
            </div>
                <button id="modify2">저장하기</button>
                
             </div>
            <input type="hidden" name="id" value="${signIn.id}">
<!--             <input type="submit" value="저장"  id="addressSearch"> -->          
        </form>

	</div>
	
	<br>
	
	<div class="unregister">
		<a class="move" href="unregister">회원탈퇴하기</a>
	</div>
	
	

	<Div id="Pop" style="position:absolute; left:100px; top:100px; width:100px; height:100px; z-index:1;display:none;">
		<h3>이름</h3>
	</Div>
	

</div>

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
				
/* 			$("#check").on("click",function(e){
					e.preventDefault();
            	      var result;
            	      var id = '';
            	      
            	      <c:if test="${result != null }">
            	         result = ${result};
            	        </c:if>
            	        <c:if test="${id != null }">
            	        id = '${id}}';
            	       </c:if>

            	        if(result ==1){
            	         $("#resultCk").html("중복된 아이디입니다. 다른아이디를 입력해주세요.");
            	         $("#username").val(mid);
            	      }else if(result == 0){
            	         $("#resultCk").html("사용 가능");
            	         $("#username").val(username);
            	         $("input[name=idDuplication]").attr('value','idCheck')
            	      }else{
            	         $("#resultCk").html("");
            	      }
            	   
            	    }); */
			
			
/*
 
 			  <tr>
                  <td><input type="text" name="mid" id="mid" placeholder="아이디">
                        <span id="resultCk"></span>
                        <input type="hidden" name="idDuplication" value="iduncheck">
                  <input type="button" id="check" value="중복확인" onclick="idcheck(this.form)"></td>
               </tr>
 */
 
	$("#modify1").on('click',function(e){
		e.preventDefault();
		var data = {
			id : '${signIn.id}',
			email : $("#email").val()
		}
		
		$.ajax({
			type:'post',
			url : '/member/myinfo',
			data : JSON.stringify(data),
			dataType: "JSON",
			contentType: "application/json; charset=utf-8",
			success:function(result){
				alert("이메일이변경되었습니다.")
				console.log(result)
			
			},
			error : function(xhr, status, er){
				console.log(xhr);
				console.log(status);
				console.log(er);
			}
		}); 
	}); 
	
 	$("#modify2").on('click',function(e){
		e.preventDefault();
		var data = {
			id : '${signIn.id}',
			c_main_address : $("#c_main_address").val(),
			addr_ck : $("#addr_ck").val()
		}
		
		$.ajax({
			type:'post',
			url : '/member/myinfo2',
			data : JSON.stringify(data),
			dataType: "JSON",
			contentType: "application/json; charset=utf-8",
			success:function(result){
				console.log(result)
				 alert("주소가변경되었습니다.")
			
			},
			error : function(xhr, status, er){
				console.log(xhr);
				console.log(status);
				console.log(er);
			}
		}); 
	}); 


 	
/*
	$("#btn1").on('click',function(){
		$.ajax({
			type:'get',
			url : '/member/myinfo2',
			dataType: 'text',
			success:function(result){
				alert(result)
			},
			error : function(xhr, status, er){
				console.log(xhr);
				console.log(status);
				console.log(er);
			}
		}); 
	}); 
*/

	
</script>

 <!-- 본문끝 -->

<%@ include file="../include/footer2.jsp" %>    
</div>