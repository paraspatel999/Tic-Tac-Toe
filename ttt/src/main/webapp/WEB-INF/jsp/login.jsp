<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>


<style type="text/css">
BODY {
background-image: url('./images/3.jpg');
	background-repeat: no-repeat;
	background-color: #cccccc;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;

	
	
}

h1{
	background-color: white;
}
TD {
	font-size: 15pt;
	face="Times New Roman";
	height:30pt;
	color:white;
}

input{
  background:#F0F0F0 ;
  filter:alpha(opacity=90);
  opacity:0.9;
  color: black;
  font-family: Monaco, Courier, MonoSpace;
  -moz-border-radius: 15px;
  -webkit-border-radius: 15px;
  border-radius: 12px;
  font-size: 18px;
  padding: 5px 5px 5px 10px;
  margin:0 auto;
}

.1playergame {
	-moz-box-shadow:inset 0px 1px 6px -11px #97c4fe;
	-webkit-box-shadow:inset 0px 1px 6px -11px #97c4fe;
	box-shadow:inset 0px 1px 6px -11px #97c4fe;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #3d94f6), color-stop(1, #1e62d0) );
	background:-moz-linear-gradient( center top, #3d94f6 5%, #1e62d0 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3d94f6', endColorstr='#1e62d0');
	background-color:#3d94f6;
	-webkit-border-top-left-radius:20px;
	-moz-border-radius-topleft:20px;
	border-top-left-radius:20px;
	-webkit-border-top-right-radius:20px;
	-moz-border-radius-topright:20px;
	border-top-right-radius:20px;
	-webkit-border-bottom-right-radius:20px;
	-moz-border-radius-bottomright:20px;
	border-bottom-right-radius:20px;
	-webkit-border-bottom-left-radius:20px;
	-moz-border-radius-bottomleft:20px;
	border-bottom-left-radius:20px;
	text-indent:0px;
	border:5px solid #337fed;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:23px;
	font-weight:bold;
	font-style:normal;
	height:43px;
	line-height:43px;
	width:200px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 0px 0px #1570cd;
}
.1playergame:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #1e62d0), color-stop(1, #3d94f6) );
	background:-moz-linear-gradient( center top, #1e62d0 5%, #3d94f6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e62d0', endColorstr='#3d94f6');
	background-color:#1e62d0;
}.1playergame:active {
	position:relative;
	top:1px;
}




.oneplayer {
	-moz-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	-webkit-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	box-shadow:inset 0px 1px 0px 0px #97c4fe;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #3d94f6), color-stop(1, #1e62d0) );
	background:-moz-linear-gradient( center top, #3d94f6 5%, #1e62d0 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3d94f6', endColorstr='#1e62d0');
	background-color:#3d94f6;
	-webkit-border-top-left-radius:6px;
	-moz-border-radius-topleft:6px;
	border-top-left-radius:6px;
	-webkit-border-top-right-radius:6px;
	-moz-border-radius-topright:6px;
	border-top-right-radius:6px;
	-webkit-border-bottom-right-radius:6px;
	-moz-border-radius-bottomright:6px;
	border-bottom-right-radius:6px;
	-webkit-border-bottom-left-radius:6px;
	-moz-border-radius-bottomleft:6px;
	border-bottom-left-radius:6px;
	text-indent:0;
	border:1px solid #337fed;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:50px;
	line-height:50px;
	width:100px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #1570cd;
}
.oneplayer:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #1e62d0), color-stop(1, #3d94f6) );
	background:-moz-linear-gradient( center top, #1e62d0 5%, #3d94f6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e62d0', endColorstr='#3d94f6');
	background-color:#1e62d0;
}.oneplayer:active {
	position:relative;
	top:1px;
}

.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}


a{
color:#00CCFF;}
a:hover
{
background-color:white;
color:black;
}

</style>




</head>
<body>
<br/><br/>
<c:if test="${not empty error}">
		<div class="errorblock">
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if>

<div align="center">
<!-- <h1 align="center"> -->
<font face="script" size="20px" color="#7D0552" >Login</font>

<form name='f' action="<c:url value='j_spring_security_check' />" method='POST'>

		<table>
			<tr>
				<td>Username:</td>
				<td><input type="text" name='j_username' value='' />
				</td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name='j_password' />
				</td>
			</tr>
			<tr>
				<td colspan='2' align="center"><input name="submit" type="submit"
					value="LOGIN" />
				</td>
			</tr>
			
		</table>

	</form>
<%-- <form:form method="post" action="j_spring_security_check"  modelAttribute="user">
 
    <table cellpadding="5px">
    <tr>
        <td align="right">User_name</td>
        <td><form:input path="user_name" name="j_username"/></td> 
    </tr>
    <tr>
        <td align="right">Password</td>
        <td><form:input path="password"  name="j_password"/></td>
    </tr>
    
    
    <tr>
    
        <td>
        
            <input type="submit" class="oneplayer" value="Login" />
        </td>
        <td align="right">
        <a href="register.html" >New Registration</a>
        </td>
    </tr>
</table>  
     
</form:form> --%><br/><br/>

<a href="register.html">New Registration</a> 
</div>
</body>
</html>