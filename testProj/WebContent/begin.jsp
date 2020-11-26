<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="firstlogin.Crypter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
<link rel='stylesheet' href="dep/bootstrap.min.css">
</head>
<body>
    <script src="dep/bootstrap.min.js" ></script>
    <script src="dep/jquery-3.3.1.slim.min.js"></script>
    <script src="dep/popper.min.js"></script>
<%
String stat = (String)session.getAttribute("logged");  //checking if any logged in session available
if(null!=stat && stat.equalsIgnoreCase("yes")){  //if user session existed, this code will be executed
	Crypter c = new Crypter();
	String user = c.deCrypt((String)session.getAttribute("username"));   //user is welcomed.
	user= user.substring(0,1).toUpperCase()+user.substring(1);
	%>
	<div class="jumbotron" align="center" style="margin-top:12%;height:20%;">
  <h1 class="display-4  font-weight-bold">Hello, <%=user%></h1>
  <p class="lead">Hope you are doing well.. More features coming soon..</p>
  <hr class="my-4">
  <p>You can use logout for now... :)</p>
  <a class="btn btn-secondary btn-lg" href="#" role="button">User Area</a>
  <a class="btn btn-primary btn-lg" href="Logout" role="button">Logout</a>
</div>
	<%
}
else{  //if user session doesn't existed, this code will be executed
	%>
	<div class="jumbotron" align="center" style="margin-top:15%;height:20%;">
	<p class="lead font-weight-bold">Hello.. Do something..</p>
  <hr class="my-4">
	<a class='btn btn-primary btn-lg' href="login.jsp"  role="button">login</a>   
	<a class='btn btn-primary btn-lg' href="register.jsp"  role="button">Register</a>  
	</div>
	<%
}
%>

</body>
</html>