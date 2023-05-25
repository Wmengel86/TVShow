<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<div class="container">

	<h1>Add a Show</h1>

	<a class = "text-white" href="/home">back home</a>

	<div class="container">
		<form:form action="/shows" modelAttribute="show" class="form" method="post">
		
			<div class="form-row">
			 	<form:errors path="title" class="error"/>
				<form:label for="title" path="title">Title:</form:label>
				<form:input type="text" path="title" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="network" class="error"/>
				<form:label for="network" path="network">network:</form:label>
				<form:input type="text" path="network" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="description" class="error"/>
				<form:label for="description" path="description">Description:</form:label>
				<form:textarea path="description" class="form-control"/>
			</div>
			
			<div class="form-row">
				<form:errors path="user" class="error"/>
				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
			</div>
			
			<div class="form-row">
				<input class="bg-danger text-white" type="submit" value="Submit" class="btn-primary"/>
			</div>
			
		</form:form>
	</div>



</div>

</body>
</html>