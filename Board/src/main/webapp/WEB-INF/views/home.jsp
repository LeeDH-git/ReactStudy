<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.center{
margin: 5px 25px; padding: 20px
}
</style>
<html>
<form class="center">
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Assignment#1
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href='<c:url value='/board/list'/>' role="button" class="btn btn-outline-info">들어가기</a>

<table>
 <thead>

 </thead>
 
 <tbody>
  
 </tbody>

</table>

</body>
</form>
</html>
