<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	div.header {
		position: sticky;
		top: 0;
		background-color: blue;
}
	#chat {
		background-color: #fff;
	}
</style>
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/chat/chat.css" />
<!-- <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
</head>
<body>
<div class="chat_wrap">
	<div class="header">
		<h3>상담(${id})</h3>
		<input type="button" value="∨" class ="sockCloseBtn">
	</div>
	<div id="chat">
	</div>
		
	<!-- 반복문 데이터 출력 -->
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
       		<div class="{{printLeftRight sender}}">
          		<div class="sender">{{sender}}</div>
          		<div class="message">{{message}}</div>
          		<div class="date">{{regdate}}</div>
       		</div>
		{{/each}}
    </script>
	<!-- 새로운채팅출력 -->
	<script id="temp1" type="text/x-handlebars-template">
       	<div class="{{printLeftRight sender}}">
          	<div class="sender">{{sender}}</div>
          	<div class="message">{{message}}</div>
          	<div class="date">{{regdate}}</div>
       	</div>	
    </script>
	<script>
		var id = "${id}";
		Handlebars.registerHelper("printLeftRight", function(sender) {
			if (id != sender) {
				return "left";
			} else {
				return "right";
			}
		});
		Handlebars.registerHelper("printNone", function(sender) {
			if (id != sender) {
				return "none";
			}
		});	
	</script>
	<div class="input-div">
		<textarea id="txtMessage" cols="30" rows="10" placeholder="메시지를 입력한 후에 엔터키를 누르세요."></textarea>
	</div>
</div>
</body>
<!-- 메시지 입력시 오른쪽 왼쪽으로 기입되는 방식 지정 -->
<script type="text/javascript">
	getList();
	var id = "${id}";
	// 엔터 이벤트
	$("#txtMessage").on("keypress", function(e) {
		if(e.keyCode == 13 && !e.shiftKey){
			e.preventDefault();
			var message = $("#txtMessage").val();
			if(message == ""){
				alert("메시지를 입력하세요.");
				$("#txtMessage").focus();
				return;
			}
			// 서버로 메시지 보내기
			$("#txtMessage").val("");
			
			// DB로 데이터 보내기
			$.ajax({
				type:'post',
				url:'/chat/insert',
				data:{
					sender:id,
					message:message
				},
				success:function(){
					sock.send(id + "|" + message);
				}
			});
		}
	});
	
	// 채팅창 닫기
	$(".sockCloseBtn").on("click", function() {
		parent.window.$(".chat-ifr").css('visibility', 'hidden');
		parent.window.$(".openChat").show();
	});
	
 	var sock = new SockJS("http://localhost:8092/echo");
	sock.onmessage = onMessage;

	// 서버로부터 메시지 받기
	function onMessage(msg) {
		var items = msg.data.split("|");
		var sender = items[0];
		var message = items[1];
		var date = items[2];
		var data = {
			"message" : message,
			"sender" : sender,
			"regdate" : date
		}
		
		var temp = Handlebars.compile($("#temp1").html());
		$("#chat").append(temp(data));
		
		// 문서의 지정된 위치로 스크롤
		window.scrollTo(0, $("#chat").prop("scrollHeight"))
	}
	
	function getList() {
		$.ajax({
			type : 'get',
			url : '/chat.json',
			dataType : 'json',
			data:{
				sender:id
			},
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#chat").append(temp(data));
			}
		});
	}
</script>
</html>