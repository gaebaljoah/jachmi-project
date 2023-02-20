<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="#">
<style type="text/css">
	div{
		width: 95px;
		height: 150px;
		margin: auto;
		margin-top: 50px;
		border: 1px solid black;
		padding: 20px;
	}
	button {
		margin-bottom: 20px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		//------------비동기1 버튼 클릭 이벤트------------
		$("#btn1").on('click',function(){
			$.ajax({
				type:'get',
				url : '/test/ajaxTest1',
				dataType: 'text',
				success:function(result){
					alert(result)
				},
				error : function(xhr, status, er){
					console.log(xhr);
					console.log(status);
					console.log(er);
				}
			}); // end ajax
		}); // end #btn1 function 
		
		
		//------------비동기2 버튼 클릭 이벤트------------
		$("#btn2").on('click',function(){
			$.ajax({
				type:'get',
				url : '/test/ajaxTest2',
				data : {param:'Hello World'},
				dataType: 'text',
				success:function(result){
					alert(result)
				},
				error : function(xhr, status, er){
					console.log(xhr);
					console.log(status);
					console.log(er);
				}
			}); // end ajax
		}); // end #btn2 function
		
		
		//------------비동기3 버튼 클릭 이벤트------------
		$("#btn3").on('click',function(){
			var paramData = {
				param1 : 'hello',
				param2 : 'world'
			}
			
			$.ajax({
				type:'post',
				url : '/test/ajaxTest3',
				data : JSON.stringify(paramData),
				dataType: "JSON",
				contentType: "application/json; charset=utf-8",
				success:function(result){
					console.log(result)
					
					for(var i=0; i<result.length; i++){
						alert(result[i].tno + "/" + result[i].tmsg);
					}
					
				},
				error : function(xhr, status, er){
					console.log(xhr);
					console.log(status);
					console.log(er);
				}
			}); // end ajax
		}); // end #btn3 function
		
		
		
		//------------비동기4 버튼 클릭 이벤트------------
		$("#btn4").on('click',function(){
			var paramData = {
				tno : 999,
				tmsg : '테스트 문자'
			}
			
			$.ajax({
				type:'post',
				url : '/test/ajaxTest4',
				data : JSON.stringify(paramData),
				dataType: "JSON",
				contentType: "application/json; charset=utf-8",
				success:function(result){
					console.log(result)
					for(var i=0; i<result.length; i++){
						alert(result[i].tno + "/" + result[i].tmsg);
					}
				},
				error : function(xhr, status, er){
					console.log(xhr);
					console.log(status);
					console.log(er);
				}
			}); // end ajax
		}); // end #btn4 function
	});
</script>
</head>
<body>
	<div>
		<button id="btn1">비동기1 버튼</button> <br/>
		<button id="btn2">비동기2 버튼</button> <br/>
		<button id="btn3">비동기3 버튼</button> <br/>
		<button id="btn4">비동기4 버튼</button> <br/>
	</div>
</body>
</html>