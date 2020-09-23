<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<title>삽입</title>
</head>
<body>
<div class="container">
    <form class="" name="vo" method="post" action="${path}/board/boardWrite">
    <div class="text-center">
        <h2>Create Page</h2>
        </div>
        <div class="form-group">
              <label for="exampleFormControlInput1">ID</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="id" placeholder="ID 작성해주세요.">
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput1">Name</label>
            <input type="text" class="form-control" id="exampleFormControlInput1" name="name" placeholder="NAME 적어주세요.">
        </div>
        <div class="form-group">
            <label for="exampleFormControlTextarea1">Goal</label>
            <input class="form-control" id="exampleFormControlTextarea1" name="goal" placeholder="GOAL 적어주세요.">
        </div>
        
		<div class="form-group row center">
			<div>
			    <label for="exampleFormControlTextarea1">Position</label>
			    
			    
			    
				<select class="form-control" name="position_code" id="position_code">
					<option>---</option>
					
					
					<c:forEach items="${poslist}" var="poslist">
						<option value="${poslist.position_code}">${poslist.position_name}</option>
						
            		</c:forEach>
				</select>
			</div>
		</div>
	<br><br>
    <button type="submit" class="btn btn-outline-info">등록</button>
    <button type="button" class="btn btn-outline-info"><a href="/board/list">돌아가기</a></button>
    </form>
    </div>
</body>
</html>
