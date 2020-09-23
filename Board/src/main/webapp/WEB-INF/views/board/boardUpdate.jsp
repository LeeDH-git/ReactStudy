<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
.center{
margin: 5px 25px; padding: 20px
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <form name="update" method="POST" action="${path}/board/boardUpdate?no=${data.no}">
    <div class="text-center">
    <h2>Update page</h2>
    </div>
    <div class="form-group">
        <label>글번호 : ${data.no}</label>
        <div class="text-right">
        <div>작성일자</div>
        <div><fmt:formatDate value="${data.date}" pattern="yyyy/MM/dd" /></div>
        <div><fmt:formatDate value="${data.time}" pattern="HH:mm:ss" /></div>
    </div>
        <div class="form-group">
            <label>이름</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="name" value="${data.name}">
        </div>
        <div class="form-group">
            <label>ID</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="id" value="${data.id}">
        </div>
        <div class="form-group">
            <label>GOAL</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="goal" value="${data.goal}">
        </div>        
        <div>        
            <input type="submit" class="btn btn-outline-info" value="완료"/>
            <input type="reset" class="btn btn-outline-info" value="리셋"/>
        </div>
    </div>    
   </form>
  </div>
   
</body>
</html>