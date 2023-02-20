<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<div>
	<form id="removeForm">
	</form>
</div>

<script type="text/javascript" src="/resources/js/util.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script type="text/javascript">
	onload = function() {
		var removeForm = $("#removeForm");
		
		if(confirm("답변을 삭제하시겠습니까?")){
			removeForm.attr("action", "/faq/faq_remove");
			removeForm.attr("method", "post");
			removeForm.append('<input type="hidden" name="pageNum" value="'+${param.pageNum }+'">');
			removeForm.append('<input type="hidden" name="amount" value="'+${param.amount }+'">');
			removeForm.append('<input type="hidden" name="faq_idx" value="'+${param.faq_idx }+'">');
			removeForm.submit();	
		}else{
			removeForm.attr("action", "/faq/faq_list");
			removeForm.attr("method", "get");
			removeForm.append('<input type="hidden" name="pageNum" value="'+${param.pageNum }+'">');
			removeForm.append('<input type="hidden" name="amount" value="'+${param.amount }+'">');
			removeForm.submit();				
		}		
	}
</script>			