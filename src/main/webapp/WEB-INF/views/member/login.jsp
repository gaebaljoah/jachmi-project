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
	            margin-top : 200px;
	            text-align: center;
	            margin: auto;
            }
            /* 로고이미지 */
            #logoimg{
            	margin-top : 150px;
            	width: 400px;
            }	
            /*로그인폼*/
            #loginform{
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
            input:placeholder-shown + label{
                color:#aaa;
                font-size:14pt;
                top:15px;
                width : 58%;
            }
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

            input:focus, input:not(:placeholder-shown){
                border-bottom: solid 1px #8aa1a1;
                outline:none;
            }
            /* 로그인버튼 */
            input[type=submit]{
                background-color: #00a8f3;
                border:none;
                color:white;
                border-radius: 5px;
                width:50%;
                height:35px;
                font-size: 14pt;
                margin-top:100px;
            }
            input[type=submit]:hover{
            		cursor: pointer;
            }
            
            /*회원가입,비밀번호 위치*/
            #jf{
            	margin : auto;
            	text-align : center;
            	margin-left: 38%;
            }
            /*비밀번호 찾기 버튼  */
            #forgot{
                text-align: right;
                font-size:10pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }
            #forgot:hover{
            	cursor: pointer;
            }
             /*회원가입  버튼  */
            #join{
                text-align: right;
                font-size:10pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }
            #join:hover{
            	cursor: pointer;
            }
            
</style>
<div id="top">
<a href="/"><img alt="" src="<spring:url value='/resources/image/logo.png'/>" id="logoimg"></a>
<h2 style="text-align: center; margin-bottom: 10px;" >로그인</h2>
</div>
	  <form action="/member/login" method="post" id="loginform">
            <div class="input-box">
                <input id="username" type="text" name="id" placeholder="아이디">
                <label for="username">아이디</label>
            </div>

            <div class="input-box">
                <input id="password" type="password" name="pw" placeholder="비밀번호">
                <label for="password">비밀번호</label>
            </div>
            <div id="jf">
	            <a id="join">회원가입 /</a>
	            <a id="forgot">비밀번호 찾기</a>
            </div>
            
            <input type="submit" value="로그인" onclick="">
      </form>
	
<script type="text/javascript">
// 	function login_ck() {
// 		if(${result } == 0){
// 			alert("아이디와 비밀번호가 일치하지 않습니다.");
// 		}
// 	}
// 	window.onload = login_ck
</script>