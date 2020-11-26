<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="firstlogin.Crypter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
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
.form-signin .abc {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin .abcd {
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
    
	
   <form class="form-signin" action="register.jsp" method="post">
  <h1 class="h3 mb-3 font-weight-normal">Register</h1>
  <input type="text" name="user" class="form-control" placeholder="User Name" required autofocus>
  <input type="password" name="pass" class="form-control abc" placeholder="Password" required>
  <input type="password" name="retype" class="form-control abcd" placeholder="Retype Password" required>
  <button class="btn btn-lg btn-success btn-block" name="reg" type="submit">Register</button>
</form>
<br>
<%

if(null!=session.getAttribute("userexist")){  //if userexist session is not null, this alert is shown
	%><div class="alert alert-danger" role="alert">Username already taken</div><%
	session.setAttribute("userexist", null); //userexist session is made null
}
else if(null!=session.getAttribute("error")){  //if error session is not null, this alert is shown
	%><div class="alert alert-danger" role="alert"><%=(String)session.getAttribute("error") %></div><%
	session.setAttribute("error", null);  //error session is made null
}
else{ //if those sessions are not there.. then we are good to go
if(null!=request.getParameter("reg")){  //if reg button is click.. this is page is reloading and it comes here
	String user = request.getParameter("user");   //post values are taken to variables
	String pass1 = request.getParameter("pass");
	String pass2 = request.getParameter("retype");
	if(!pass1.equals(pass2)){  //passwords are checked.. if doesnt match below text is displayed
		%><div class="alert alert-danger" role="alert">Password mismatch</div><%
	}
	else{ //if all good
		Crypter c = new Crypter();  //Crypter class is initialized
		session.setAttribute("username", c.enCrypt(user));  //username is encypted and added to session
		session.setAttribute("password", c.enCrypt(pass1));  //password is encypted and added to session
		response.sendRedirect("RegisterCheck"); //page is redirected
	}
}
}
%>

</body>
</html>
