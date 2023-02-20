<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자취미생활 참가서작성</title>
<style type="text/css">
@font-face {
    font-family: 'KyoboHand';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/KyoboHand.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
*{
  font-family: 'KyoboHand';
}
/*게시글 테이블 디자인*/
#getlist{
	margin : auto;
	border-collapse: collapse;
}
th{
	width : 100px;
	text-align: center;
	border-right: 1px solid black;
}
td{
	text-align: left;
	padding: 10px;
}
/*버튼중앙정렬*/
#joinback{
	text-align: center;
}

/*전송 버튼*/
#buyer{
	background-color: rgb(52, 152, 219);
	border: none;
	height: 30px;
	width: 75px;
	font-size: 15px;
	  border-radius: 5px;
	  color: white;
	  	margin-top: 15px;
}
/*닫기 버튼*/
#ListMoveBtn{
	background-color: rgb(94, 94, 94);
	border: none;
	height: 30px;
	width: 75px;
	font-size: 15px;
	  border-radius: 5px;
	  color: white;
	  	margin-top: 15px;
}

</style>
</head>
<body>
<hr class="my-hr3">
<h2 style="text-align: center;  font-family: 'yg-jalnan';">참가서작성</h2>
<hr class="my-hr3">
		<form method="post" role="form" id="testForm">
			<table id="getlist">
				<tbody>
					<tr>
						<th>연락처</th>
						<td><input type="text" name="phone" size="30" id="phone"><br>
						ex)010-0000-0000
						</td>
						
					</tr>
					<tr>
						<th>입금형식</th>
						<td><input type="radio" name="b_money" value="계좌이체" id="b_money">계좌이체
						<input type="radio" name="b_money" value="만나서현금결제"  id="b_money">만나서 현금 결제</td>
					</tr>
					<tr>
						<th>희망장소(선택)</th>
						<td><input type="text" name="b_location" size="30" id="b_location" placeholder="희망장소를 20자 이내로 입력해주세요."></td>
					</tr>
					<tr>
						<th>요청사항(선택)</th>
						<td><textarea rows="10" cols="30" name="b_equests" placeholder="내용을 100자이내로 입력하세요" id="b_equests"></textarea></td>
					</tr>
					
					<tr>
						<td colspan="2" id="joinback">
							<button  data-oper="attend" id="buyer">전송</button> 
							<button id="ListMoveBtn" data-oper="list">닫기</button>
							<input type="hidden" name="pageNum" value="${cri.pageNum }">
							<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="id" value="${id }">
							<input type="hidden" name="s_num" value="${s_num }">
							<input type="hidden" name="s_title" value="${s_title }">
						</td>
					</tr>
				</tbody>			
			</table>
		</form>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
	$(function(){
			var formObj = $("form[role=form]");
			var amount = "${cri.amount}";
			var pageNum = "${cri.pageNum}";
			
			
			//***버튼 클릭 스크립트***
			$("button").click(function(e){
				e.preventDefault(); //기본 이벤트 삭제
				
				var oper = $(this).data("oper");
				
				var value = {id : 'admin2' , phone: '020202',b_money : '계좌이체',b_location:'테스트동네',b_equests:'왜씹힐까', s_num: "${s_num }"};
				
				var queryString = $("form[id=testForm]").serialize();
				
				if(oper=="list"){
					window.close();
				}else{
					var phone = document.getElementById("phone");
			        var b_location = document.getElementById("b_location");
			        var b_equests = document.getElementById("b_equests");
			        var b_money = $('input[name=b_money]').is(":checked");
			        var brnRe = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
			        
					if(phone.value==''){
						alert("폰번호를 입력해주세요.")
						return;
				    }
				    if(!brnRe.test(phone.value)) {
				     	alert("전화번호를 잘못입력하셨습니다. 예시처럼입력해주세요.")
				     	return;
				    } 
			        if(b_money==''){
						alert("입금방식을 선택해주세요.")
			            return;
			        }
					if(b_location.value.length >20){
						alert("희망장소를 20자 이내로 입력해주세요")
			            return;
			        }
					if(b_equests.value.length>100){
						alert("내용을 100자 이내로 입력해주세요.")
						return;
					}
					
					$.ajax({
						type : 'post',
						url : '/seller/attend?pageNum=${cri.pageNum }&amount=${cri.amount}&s_num=${s_num}',
						data : queryString,
						success: function(data){
							alert("참여되었습니다.")
							opener.document.location.reload();
							self.close();
						},
						error: function(data){
							alert("참여되지않았습니다. 다시 시도해주세요.")
						}
					});
				}
				
				
			});
	});	
				
</script>
</body>
</html>
