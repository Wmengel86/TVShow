<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="bg-primary text-white">

<div class="container">
		<h1>Welcome, <c:out value="${user.userName}"/></h1>
		
		<h3>Tv Shows:</h3>
		<a class = "text-white" href="/logout">logout</a>
		<a class = "text-white" href="/addPage">+ Add a Show</a>
		
		<table class="table text-white">
		
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Network</th>
		
			</tr>
			<c:forEach var="show" items="${shows}">
			
				<tr>
					<td><c:out value="${show.id}"/></td>
					<td><a class = "text-white" href="shows/${show.id}"><c:out value="${show.title}"/></a></td>
					<td><c:out value="${show.network}"/></td>
					
				</tr>
			</c:forEach>
		
		</table>
	</div>


</body>
</html>