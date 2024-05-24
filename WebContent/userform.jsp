<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>User Management System</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">User Management System</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/list">Users</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<c:if test="${list==null}">
<form action="insert" method="post">
</c:if>
<c:if test="${list!=null}">
<form action="update" method="post">
</c:if>

<c:if test="${list==null}">
<div class="container">
<h1 style="color:blue" class="font-monospace fw-bold">ADD USER </h1>
</div>
</c:if>
<c:if test="${list!=null}">
<div class="container">
<h1 style="color:blue" class="font-monospace fw-bold">EDIT USER </h1>
</div>
</c:if>
 <div class="mb-3">
  <input type="hidden" name="id" value="${list.id}">
</div>
<div class="container">
<div class="mb-3">
  <label for="formGroupExampleInput" class="form-label">Name:</label>
  <input type="text" class="form-control" id="formGroupExampleInput" value="${list.name}" placeholder="enter your name" name="name" required>
</div>
<div class="mb-3">
  <label for="formGroupExampleInput2" class="form-label">Email:</label>
  <input type="email" class="form-control" id="formGroupExampleInput2" value="${list.email}" placeholder="enter your email" name="email" required>
</div>
<div class="mb-3">
  <label for="formGroupExampleInput3" class="form-label">City:</label>
  <input type="text" class="form-control" id="formGroupExampleInput3" value="${list.city}" placeholder="enter your city name" name="city" required>
</div>
<div class="mb-3">
	<input type="submit" value="Submit" class="btn btn-outline-success">
</div>
</div> 
</form>
</body>
</html>