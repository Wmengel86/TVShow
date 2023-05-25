<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="bg-primary text-white">

<div class="container text-white">
		<h1><c:out value="${show.title}"/></h1>
		
		<a class = "text-white" href="/home">back to Shows</a>
		
		<table>
	    <tbody>
			<tr>
				<td>Posted By:</td>
				<td style="padding-left: 24px;"><c:out value="${show.user.userName}"></c:out></td>
			</tr>
			<tr>
				<td>Network:</td>
				<td style="padding-left: 24px;"><c:out value="${show.network}"></c:out></td>
			</tr>
			<tr>
				<td>Description:</td>
				<td style="padding-left: 24px;"><c:out value="${show.description}"></c:out></td>
			</tr>
				
	    </tbody>
	</table>
		<a class = "text-white" href="/shows/edit/${show.id}">edit</a>
	</div>

</body>
</html>