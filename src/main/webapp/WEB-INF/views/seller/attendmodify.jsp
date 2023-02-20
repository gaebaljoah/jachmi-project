<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자취미생활 참가서수정</title>
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

/*수정 버튼*/
#modify{
	background-color: rgb(52, 152, 219);
	border: none;
	height: 30px;
	width: 75px;
	font-size: 15px;
	  border-radius: 5px;
	  color: white;
	  	margin-top: 15px;
}
/*삭제 버튼*/
#delete{
	background-color: rgb(224, 224, 224);
	border: none;
	height: 30px;
	width: 75px;
	font-size: 15px;
	border-radius: 5px;
	color: white;
	margin-top: 15px;
}
/*닫기 버튼*/
#list{
	background-color: rgb(94,94,94);
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
<h2 style="text-align: center;  font-family: 'yg-jalnan';">참가서 수정및삭제</h2>
<hr class="my-hr3">
<form action="/seller/attendmodify" method="post" role="form" id="testForm">
			<table id="getlist">
				<tbody>
					<tr>
						<th>연락처</th>
						<td><input type="text" name="phone" size="30" value="${vo.phone }" id="phone"></td>
					</tr>
					<tr>
						<th>입금형식</th>
						<td>
						<input type="radio" name="b_money" value="계좌이체" id="b_money"<c:if test="${vo.b_money eq '계좌이체'}">checked</c:if>>계좌이체
						<input type="radio" name="b_money" value="만나서현금결제" id="b_money" <c:if test="${vo.b_money eq '만나서현금결제'}">checked</c:if>>만나서 현금 결제
						</td>
					</tr>
					<tr>
						<th>희망장소</th>
						<td><input type="text" name="b_location" size="30" value="${vo.b_location }" id="b_location" placeholder="희망장소를 20자 이내로 입력해주세요.(선택)"></td>
					</tr>
					<tr>
						<th>요청사항</th>
						<td><textarea rows="10" cols="30" name="b_equests"  placeholder="내용을 100자이내로 입력하세요(선택)" id="b_equests">${vo.b_equests }</textarea></td>
					</tr>
					
					<tr>
						<td colspan="2" id="joinback">
							<button  id="modify" data-oper="attend">수정</button> 
							<button  id="delete" data-oper="reset">삭제</button>
							<button id="list" data-oper="list">닫기</button>
							<input type="hidden" name="s_num" value="${vo.s_num }">
							<input type="hidden" name="b_num" value="${vo.b_num }">
							<input type="hidden" name="id" value="${id }">
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
				
				var queryString = $("form[id=testForm]").serialize();
				
				var value = {id : 'admin2' , phone: '020202',b_money : '계좌이체',b_location:'테스트동네',b_equests:'왜씹힐까', s_num: "${s_num }"};
				
				if(oper=="list"){
					window.close();
				}else if(oper == "reset"){
					$.ajax({
						type : 'post',
						url : '/seller/delete',
						//data : $("#testForm").serialize(),
						data : queryString,
						success: function(data){
							alert("result : " + data);
						},
						error: function(xhr, status, error){
							//alert(queryString);
//							alert($("#testForm").serialize());
						}
					});
					alert("삭제되었습니다.")
					self.close();
					
				}else{
					
					var phone = document.getElementById("phone");
			        var b_location = document.getElementById("b_location");
			        var b_equests = document.getElementById("b_equests");
			        var b_money = $('input[name=b_money]').is(":checked");
			        
					if(phone.value==''){
						alert("폰번호를 입력해주세요.")
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
						url : '/seller/attendmodify',
						//data : $("#testForm").serialize(),
						data : queryString,
						success: function(data){
							alert("result : " + data);
						},
						error: function(xhr, status, error){
							//alert(queryString);
//							alert($("#testForm").serialize());
						}
					});
					alert("수정되었습니다.")
					self.close();
					
				}	
			});		
	});				
					
					
	
	
			
	</script>
</body>
</html>