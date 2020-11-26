<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel='stylesheet' href="dep/bootstrap.min.css">
<style>
html,body {
  height: 100%;
}

body {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}
.alert{
width: 100%;
  max-width: 330px;
  margin-left: 39.25%;
  margin-top: 22%;
  position: absolute;
  font-size: 16px;
}

.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="name"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

</style>

</head>
<body class="text-center">
    <script src="dep/bootstrap.min.js" ></script>
    <script src="dep/jquery-3.3.1.slim.min.js"></script>
    <script src="dep/popper.min.js"></script>

   <form class="form-signin" action="LoginCheck" method="post">
  <h1 class="h3 mb-3 font-weight-normal">Login</h1>
  <input type="text" name="user" class="form-control" placeholder="User Name" required autofocus>
  <input type="password" name="pass" class="form-control" placeholder="Password" required>
  <button class="btn btn-lg btn-success btn-block" name="sub" type="submit">Login</button>
  </form>
<br>
<%
if(null!=session.getAttribute("usernotexist")){  //usernotexist session will be null when some issue is raised
	
	%><div class="alert alert-danger" role="alert">Username and password combination doesnt exist</div><%
	session.setAttribute("usernotexist", null);
}
else if(null!=session.getAttribute("error")){
	%><div class="alert alert-danger" role="alert"><%=(String)session.getAttribute("error") %></div><%
	session.setAttribute("error", null);
}
%>

</body>
</html>