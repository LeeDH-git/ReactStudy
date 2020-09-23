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
<title>조인목록</title>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
</head>

<body>
<div class="container">
<h1 class="text-center">JoinList page</h1>
<table class="table table-hover" style="text-align: center; border:1px solid #dddddd">
 <thead>
  <tr>
  <th scope="col">ID</th>
  <th scope="col">성함</th>
  <th scope="col">현재직급</th>


  
  </tr>
 </thead>
 
 <tbody>
	 <c:forEach items="${plist}" var="plist">
	 <tr>
            <td class="text_ct">${plist.id}</td>
            <td class="text_ct"><a href="${path}/board/boardDetail?no=${plist.no}">${plist.name}</a></td>
            <td class="text_ct">${plist.position_name}</td>
	 </tr>
	</c:forEach>
 </tbody> 
</table>
<div class="text-center">
    <button type="button" class="btn btn-outline-info"><a href="/board/list">돌아가기</a></button>
</div>
</div>
</body>
</html>
