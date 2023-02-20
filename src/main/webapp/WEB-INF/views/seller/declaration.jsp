<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글신고</title>
<style type="text/css">
@font-face {
    font-family: 'yg-jalnan';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'KyoboHand';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/KyoboHand.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
h2{
	color: red;
	 font-family: 'yg-jalnan';
}
*{
  font-family: 'KyoboHand';
}
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
/*취소 버튼*/
#boardModBtn{
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
/*버튼중앙정렬*/
#joinback{
	text-align: center;
}
</style>
</head>
<body>
<hr class="my-hr3">
<h2 style="text-align: center;">※신고※</h2>
<hr class="my-hr3">


<form action="/seller/declaration" method="post" role="form" id="testForm">
			<table id="getlist">
				<tbody>
					<tr>
						<th>신고게시글</th>
						<td>${s_num }
						<input type="hidden" name="reportContent" value="${s_num }">
						</td>
					</tr>
					<tr>
						<th>신고사유<br>(중복선택가능)</th>
						<td><input type="checkbox" name="reportContent" value="부당한거래요구">부당한거래요구<br>
						<input type="checkbox" name="reportContent" value="광고/홍보">광고/홍보<br>
						<input type="checkbox" name="reportContent" value="중복/도배성">중복/도배성<br>
						<input type="checkbox" name="reportContent" value="비방/음란물">비방/음란물<br>
						<input type="checkbox" name="reportContent" value="기타">기타</td>
					</tr>
					<tr>
						<th>기타사유입력</th>
						<td><textarea rows="10" cols="30" name="reportContent" placeholder="내용을 입력하세요" id="ggg"></textarea></td>
					</tr>
					
					<tr>
						<td colspan="2" id="joinback">
							<button id="buyer" data-oper="attend">신고하기</button> 
							<button id="boardModBtn" data-oper="list">취소</button>
							<input type="hidden" name="pageNum" value="${cri.pageNum }">
							<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="s_num" value="${s_num }">
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
				}else if(oper == "reset"){
					formObj[0].reset();	//복수객체로보고있음.
				}else{
					   var reportContent = $('input[name=reportContent]').is(":checked");
					   var checkval = $("input[name=reportContent]:checked").val();
					    var length = $("textarea[name=reportContent]");
					    var ggg = document.getElementById("ggg");
					    
					   
					   if(reportContent==''){
							alert("신고사유를 한가지라도 선택해주세요.")
				            return;
				        }
					   if(ggg.value.length>200){
							alert("내용을 200자 이내로 입력해주세요.")
							return;
						}
					   /*if(checkval=='기타'){
							alert("하단 입력칸에 기타사유를 입력해주세요.")
							console.log(reportContent.value)
							console.log(reportContent.val)
				            return;
				        }*/
					
					$.ajax({
						type : 'post',
						url : '/seller/declaration',
						//data : $("#testForm").serialize(),
						data : queryString,
						success: function(data){
						},
						error: function(xhr, status, error){
						}
						
					});
					alert("신고되었습니다.")
					self.close();
					
				}	
			});		
	});				
					
					
	
	
			
	</script>
</body>
</html>