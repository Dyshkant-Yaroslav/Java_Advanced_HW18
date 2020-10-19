<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>Lesson-18</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>



	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">Spring MVC -Logos</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">All participants</a></li>
				<li><a href="new">new Participant</a></li>
			</ul>
		</div>
	</nav>


	<div class="container">

		<c:choose>
			<c:when test="${mode == 'PRTCPNT_VIEW'}">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Email</th>
							<th>Level</th>
							<th>Skill</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="participants" items="${participants}">
							<tr>
								<td>${participants.id}</td>
								<td>${participants.name}</td>
								<td>${participants.email}</td>
								<td>${participants.level}</td>
								<td>${participants.primarySkill}</td>
								<td><a href="update?id= ${participants.id}">edit</a></td>
								<td><a href="delete?id= ${participants.id}">delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>

			<c:when test="${mode == 'PRTCPNT_EDIT' || mode == 'PRTCPNT_CREATE'}">
				<form action="save" method="POST">
				
				<input type="hidden" value="${participants.id}" class="form-control" id="id" name="id">
				
					<div class="form-group">
						<label for="bookName">Name:</label> <input type="text"
							class="form-control" id="name" name="name"
							value="${participants.name}">
					</div>


					<div class="form-group">
						<label for="email">email:</label> <input type="text"
							class="form-control" id="email" name="email"
							value="${participants.email}">
					</div>
					
						<div class="form-group">
						<label for="level">level:</label> <input type="text"
							class="form-control" id="level" name="level"
							value="${participants.level}">
					</div>
					
						<div class="form-group">
						<label for="primarySkill">Skill:</label> <input type="text"
							class="form-control" id=primarySkill name="primarySkill"
							value="${participants.primarySkill}">
					</div>
					
				
					
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</c:when>

		</c:choose>
	</div>
</body>
</html>
