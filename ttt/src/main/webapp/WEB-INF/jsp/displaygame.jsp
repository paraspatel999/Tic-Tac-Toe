<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tic Tac Toe</title>


<style type="text/css">
BODY {
background-image: url('./images/4.jpg');
	background-repeat: no-repeat;
	background-color: #cccccc;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;

	
	
}

h1{
color:white;}
h2{
color:white;}
h3{
color:yellow;
font-size:25px;}
table, th, td{
 
background-color:#FFFF99;
font-size:40px;

}

td {
    height: 50px;
	width:50px;
}



.button {
	-moz-box-shadow:inset 0px 1px 0px 0px #bee2f9;
	-webkit-box-shadow:inset 0px 1px 0px 0px #bee2f9;
	box-shadow:inset 0px 1px 0px 0px #bee2f9;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #63b8ee), color-stop(1, #468ccf) );
	background:-moz-linear-gradient( center top, #63b8ee 5%, #468ccf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#63b8ee', endColorstr='#468ccf');
	background-color:#63b8ee;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #3866a3;
	display:inline-block;
	color:#14396a;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:32px;
	line-height:32px;
	width:137px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #7cacde;
}
.button:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #468ccf), color-stop(1, #63b8ee) );
	background:-moz-linear-gradient( center top, #468ccf 5%, #63b8ee 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#468ccf', endColorstr='#63b8ee');
	background-color:#468ccf;
}.button:active {
	position:relative;
	top:1px;
}


wxx{
color:white;
font-size:30px;}
pxx{

font-size:40px;
color:yellow;}






</style>

</head>
<body>
<security:authorize access="hasRole('ROLE_USER')">
	<div align="center">
			<h1>
				Tic Tac Toe
			</h1>
			
			<wxx> Welcome    </wxx>&nbsp &nbsp  <pxx>${user}</pxx>
	
		
			<h2>${result} ${cont}</h2>
			
			<table border=1 cellpadding="15">
				<c:forEach begin="0" end="2" var="i">
					<tr>
						<c:forEach begin="0" end="2" var="j">
							<c:set var="d" value="${i}${j}" />
							<c:choose>
								<c:when test="${p1.contains(d)}">
									<td align="center"><font color="blue">X</font></td>
								</c:when>
								<c:when test="${ai.contains(d)}">
									<td align="center"><font color="red">O</font></td>
								</c:when>
								<c:otherwise>
								<c:choose>
									<c:when test="${not empty result}">
										<td></td>
									</c:when>

									<c:otherwise>
										<td align="center"><a href="gamelogic.html?i=${i}&j=${j}">_</a></td>
									</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>


						</c:forEach>
					</tr>
				</c:forEach>
			</table>
			<br />
			<br />
			<!-- <a href="newgame.html">New Game</a> |  -->
			<a href="newgame.html" class="button">New Game</a>
			<c:choose>
			<c:when test="${p1.size() eq 0}">
			<!-- <a href="welcome.html">Back to home</a>  | -->
			<a href="welcome.html" class="button">Back to home</a>  
			
			<a href="ttt/j_spring_security_logout" class="button">Logout</a>
			</c:when>
			
			<c:when test="${not empty result }">
			<!-- <a href="welcome.html">Back to home</a>  | -->
			<a href="welcome.html" class="button">Back to home</a>
			<a href="ttt/j_spring_security_logout" class="button" >LogOut</a>
				
			</c:when>
		
			<c:otherwise>
		
		    
			<!-- <a href="save_game.html" >Save Game</a>   | -->
			<a href="save_game.html" class="button">Save Game</a>
			<!-- <a href="logout.html">Logout</a> -->
			<a href="logout.html" class="button" >Logout</a>
			</c:otherwise>
			</c:choose>
			</div>
		
</security:authorize>		
</body>
</html>