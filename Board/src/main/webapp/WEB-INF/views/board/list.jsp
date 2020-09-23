<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
th,td{padding:15px;}
.center{
margin: 5px 25px; padding: 20px
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>목록</title>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			var url = "delete";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");				 
				$.ajax({
				    url : url,                    // 전송 URL
				    type : 'POST',                // GET or POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("삭제 성공");
	                        location.replace("list")
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});
			}
		}
	</script>
</head>

<body>
<div class="container">
<h1 style="text-align:center">List page</h1>
	<table class="table table-hover" style="text-align: center; border:1px solid #dddddd">
		 <thead>
		  <tr>
		  <th style="background-color:#fafafa;"><input id="allCheck" type="checkbox" name="allCheck"/></th>
		  <th style="background-color:#fafafa;">번호</th>
		  <th style="background-color:#fafafa;">ID</th>
		  <th style="background-color:#fafafa;">성함</th>
		  <th style="background-color:#fafafa;">목표</th>
		  <th style="background-color:#fafafa;">작성일</th>
		  <th style="background-color:#fafafa;">작성시간</th>
		  </tr>
		 </thead>
	 
		 <tbody>
			 <c:forEach items="${list}" var="list">
			 <tr>
			 		<td class="checkbox"><input name="RowCheck" type="checkbox" value="${list.no}"/></td>
		            <td class="text_ct">${list.no}</td>
		            <td class="text_ct">${list.id}</td>
		            <td class="text_ct"><a href="${path}/board/boardDetail?no=${list.no}">${list.name}</a></td>
		            <td class="text_ct">${list.goal}</td>
		            <td class="text_ct"><fmt:formatDate value="${list.date}" pattern="yyyy/MM/dd" /></td>
		            <td class="text_ct"><fmt:formatDate value="${list.time}" pattern="HH:mm:ss" /></td>
		            
			 </tr>
			</c:forEach>
		 </tbody> 
	</table>
	
	<div class="text-center">
	<a href="<c:url value='/board/boardWrite'/>" role="button" class="btn btn-outline-info">글쓰기</a>
	
	<input type="button" value="선택삭제" class="btn btn-outline-info" onclick="deleteValue();">
	
	<a href="<c:url value='/board/joinlist'/>" role="button" class="btn btn-outline-info">직급</a>
	</div>
	
		<!-- search{s} -->
		<form name="Search" method="get" action="/board/list">
				<div class="form-group row center">
					<div style="padding-right:10px">
						<select class="form-control form-control-sm" name="searchType" id="searchType">
							<option value="name">이름</option>
							<option value="id">아이디</option>
							<option value="goal">목표</option>
						</select>
					</div>
					<div style="padding-right:10px">
						<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
					</div>
					<div>
						<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
					</div>
				</div>
			</form>
			<!-- search{e} -->
</div>
			
			
</body>
</html>
