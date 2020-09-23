<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
th,td{padding:15px;}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body>
<div class="container">
<div class="text-center">
    <h2>Detail page</h2>
    </div>
    <table class="table table-hover" style="text-align: center; border:1px solid #dddddd">
        <th> 정보 </th>
        <th> 데이터 </th>
        <tr>
            <td>작성일자</td>
            <td><fmt:formatDate value="${data.date}" pattern="yyyy-MM-dd" />
            </td>
        </tr>
        <tr>
            <td>글번호</td><td>${data.no}</td>
        </tr>
        <tr>
            <td>이름</td><td>${data.name}</td>
        </tr>
        <tr>
            <td>goal</td><td>${data.goal}</td>
        </tr>
        <tr><td>ID</td><td>${data.id}</td></tr>
        
    </table>
    <div class="text-center">
    	<a href="/board/boardUpdate?no=${data.no}"role="button" class="btn btn-outline-info">수정</a>
    	<button type="button" class="btn btn-outline-info"><a href="/board/list">돌아가기</a></button>
    	
    </div>
    </div>
    
</body>
</html>
