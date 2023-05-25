<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
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
<div class = "container">
<h1>Edit Show</h1><a class = "text-white" href="/shows/${show.id}">Go back</a>
	<br>
	<div>
	<h1>Show</h1>
	<form:form action="/shows/edit/${show.id}" method="post" modelAttribute="show" class="form">
		<div class="form-row">
			<form:errors path="title" class="error"/>
			<form:label for="title" path="title">Title: </form:label><br>
			<form:input style="width:250px;" path="title"/>
		</div>
	
		<div class="form-row">
			<form:errors path="network" class="error"/>
			<form:label for="network" path="network">Network: </form:label><br>
			<form:input style="width:250px;" path="network"/>
		</div>
		
		<div class="form-row">
			<form:errors path="description" class="error"/>
			<form:label for="description" path="description">Description: </form:label><br>
			<form:textarea style="width:250px;" rows="3" path="description"/>
		</div>
		
		<div class="form-row">
			<form:errors path="user" class="error"/>
			<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
		</div>
		
		<div>
			<input class="bg-danger text-white" type="submit" value="Submit"/>  <a href="/shows/delete/${show.id}">delete</a>
		</div>
		
		
	
	</form:form>
	</div>
</div>
</body>
</html>