<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
   *{
      margin: 0;
      padding: 0;
   }
   	/* footer 하단 고정 [S] */
	html, body {
	    margin: 0;
	    padding: 0;
 	    height: 100%;
	}
	
	#body-wrapper {
	    min-height: 100%;
 	    position: relative;
	}
	
	#body-content {
		margin-top: 0px;
	}
		
	footer {
		    width: 100%;
		    height: 9999px; /* footer의 높이 */
		    position: absolute;  
		    bottom: 0;
		    left: 0;
		    padding-top: 20px;
	}
	/* footer 하단 고정 [E] */
	#wrapper {
		position: relative;
		height: 2%;
		padding-bottom: 114px;
	}
	
	#footer {
		vertical-align: bottom;
		position: absolute;
		bottom: 0;
		color: white;
	}
</style>
</head>
<body>
   <!--하단  -->
    <footer id="footer">
   상호명 : 자취미생활 대표자명 : ㅇㅇㅇ 주소 :서울 금천구 디지털로9길 56 사업자등록번호:123-45-67890  TEL :012-4567-8989 FAX: 012-333-4444
      <br>COMPANYⓒMANDO.RIGHTS RESERVED.
   </footer>
    <!--하단끝  -->
   <script type="text/javascript">
   var str = '';
	str += '<input type="hidden" name="pageNum" value="1"/>';
	str += '<input type="hidden" name="amount" value="12"/>';

	$("#go_allList").click(function(e) {
		e.preventDefault();
		$("#pageParam").attr("action", "/product/allList");
		$("#pageParam").html(str);
		$("#pageParam").submit();
	});
	$("#go_101List").click(function(e) {
		e.preventDefault();
		$("#pageParam").attr("action", "/product/list_by_category");
		str += '<input type="hidden" name="category_idx" value="101"/>';
		$("#pageParam").html(str);
		$("#pageParam").submit();
	});
	$("#go_102List").click(function(e) {
		e.preventDefault();
		$("#pageParam").attr("action", "/product/list_by_category");
		str += '<input type="hidden" name="category_idx" value="102"/>';
		$("#pageParam").html(str);
		$("#pageParam").submit();
	});
	$("#go_103List").click(function(e) {
		e.preventDefault();
		$("#pageParam").attr("action", "/product/list_by_category");
		str += '<input type="hidden" name="category_idx" value="103"/>';
		$("#pageParam").html(str);
		$("#pageParam").submit();
	});
	$("#go_104List").click(function(e) {
		e.preventDefault();
		$("#pageParam").attr("action", "/product/list_by_category");
		str += '<input type="hidden" name="category_idx" value="104"/>';
		$("#pageParam").html(str);
		$("#pageParam").submit();
	});
	$("#go_105List").click(function(e) {
		e.preventDefault();
		$("#pageParam").attr("action", "/product/list_by_category");
		str += '<input type="hidden" name="category_idx" value="105"/>';
		$("#pageParam").html(str);
		$("#pageParam").submit();
	});
	$("#go_106List").click(function(e) {
		e.preventDefault();
		$("#pageParam").attr("action", "/product/list_by_category");
		str += '<input type="hidden" name="category_idx" value="106"/>';
		$("#pageParam").html(str);
		$("#pageParam").submit();
	});
</script>  
   </script>
</body>
</html>