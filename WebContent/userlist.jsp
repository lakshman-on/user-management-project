<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "com.um.model.*" %>
<%@page import = "java.util.ArrayList" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="a" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
<h1 style="color: blue" align="center">USER MANAGEMENT SYSTEM</h1>
<hr align="center" color="Black" size="5" width="100%" noshade >
<div class="container">
<a href="<%=request.getContextPath()%>/add" class="btn btn-outline-success">Add User</a>
<br><br>
<table class="table table-striped">
<thead>
<tr>
<th>ID</th>
<th>NAME</th>
<th>EMAIL</th>
<th>CITY</th>
<th>ACTIONS</th>
</tr>
</thead>
<tbody>
<a:forEach items="${display}" var="u">
    <tr>
        <td><a:out value="${u.id}" ></a:out></td>
        <td><a:out value="${u.name}" ></a:out></td>
        <td><a:out value="${u.email}" ></a:out></td>
        <td><a:out value="${u.city}" ></a:out></td>
        <td>
            <a href="edit?id=<a:out value="${u.id}"></a:out>">Edit</a> &nbsp; 
            <a href="delete?id=<a:out value="${u.id}"></a:out>">Delete</a>
        </td>
    </tr>
</a:forEach>
</tbody>
</table>
</div>
</body>
</html>