<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tic Toe Tac</title>


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
color:white;
text-transform:uppercase;
}



.welcome {
	-moz-box-shadow:inset 0px 10px 11px 0px #e184f3;
	-webkit-box-shadow:inset 0px 10px 11px 0px #e184f3;
	box-shadow:inset 0px 10px 11px 0px #e184f3;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #c123de), color-stop(1, #a20dbd) );
	background:-moz-linear-gradient( center top, #c123de 5%, #a20dbd 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#c123de', endColorstr='#a20dbd');
	background-color:#c123de;
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
	text-indent:0;
	border:6px solid #a511c0;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:24px;
	font-weight:bold;
	font-style:normal;
	height:62px;
	line-height:62px;
	width:200px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #9b14b3;
}
.welcome:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #a20dbd), color-stop(1, #c123de) );
	background:-moz-linear-gradient( center top, #a20dbd 5%, #c123de 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#a20dbd', endColorstr='#c123de');
	background-color:#a20dbd;
}.welcome:active {
	position:relative;
	top:1px;
}









/* Logout */



.logout {
	-moz-box-shadow:inset 0px 1px 0px 0px #f29c93;
	-webkit-box-shadow:inset 0px 1px 0px 0px #f29c93;
	box-shadow:inset 0px 1px 0px 0px #f29c93;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fe1a00), color-stop(1, #ce0100) );
	background:-moz-linear-gradient( center top, #fe1a00 5%, #ce0100 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fe1a00', endColorstr='#ce0100');
	background-color:#fe1a00;
	-webkit-border-top-left-radius:37px;
	-moz-border-radius-topleft:37px;
	border-top-left-radius:37px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:37px;
	-moz-border-radius-bottomright:37px;
	border-bottom-right-radius:37px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #d83526;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:65px;
	line-height:65px;
	width:131px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #b23e35;
}
.logout:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ce0100), color-stop(1, #fe1a00) );
	background:-moz-linear-gradient( center top, #ce0100 5%, #fe1a00 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ce0100', endColorstr='#fe1a00');
	background-color:#ce0100;
}.logout:active {
	position:relative;
	top:1px;
}









</style>














</head>
<body>
<security:authorize access="hasRole('ROLE_USER')">

<h1 align="center">Welcome ${user}</h1>
<!-- 
<div align="right"><a href="login.html"><font face="cursive" size="5px" color="Blue" >Logout</font></a></div>

 -->

<div align="center">
<!-- 
<a href="displaygame.html"><font face="cursive" size="4px" color="Blue" >Play a Game with AI</font></a>
<a href="player2.html"><font face="cursive" size="4px" color="Blue" >Play a Game with Player2</font></a><br/>
<a href="display_resumegame.html"><font face="cursive" size="4px" color="Blue" >Saved Games</font></a><br/>
<a href="gameHistory.html"><font face="cursive" size="4px" color="Blue" >Game history</font></a><br/>
 -->
<a href="displaygame.html" class="welcome">Play againt AI</a> 
<a href="player2.html" class="welcome">2 Player Game</a> <br>
<br>

<a href="display_resumegame.html" class="welcome">Saved Games</a>
<a href="gameHistory.html" class="welcome">Game history</a>
<h3 align="center"><a href="ttt/j_spring_security_logout" class="logout">Logout</a></h3>

</div> 







<!-- 

css coding from here
<div class="button"><div class="outer"><div class="height"><div class="inner"><a href="displaygame.html">Game with AI</div></div></div></div>
<div class="button"><div class="outer"><div class="height"><div class="inner"><a href="player2.html">2 Player Game</div></div></div></div>
<div class="button"><div class="outer"><div class="height"><div class="inner"><a href="display_resumegame.html">Saved Games</div></div></div></div>
<div class="button"><div class="outer"><div class="height"><div class="inner"><a href="gameHistory.html">Game History</div></div></div></div>
 -->












</security:authorize>
</body>
</html>