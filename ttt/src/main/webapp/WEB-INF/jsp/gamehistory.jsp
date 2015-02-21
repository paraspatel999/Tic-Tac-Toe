<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


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
table{
 
background-color:#FFFF66;}

wxx{
color:white;
font-size:30px;
}
pxx{

font-size:40px;
color:yellow;}

a{
color:lightblue;}






.logout {
	-moz-box-shadow:inset 0px 1px 0px 0px #f5978e;
	-webkit-box-shadow:inset 0px 1px 0px 0px #f5978e;
	box-shadow:inset 0px 1px 0px 0px #f5978e;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f24537), color-stop(1, #c62d1f) );
	background:-moz-linear-gradient( center top, #f24537 5%, #c62d1f 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f24537', endColorstr='#c62d1f');
	background-color:#f24537;
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
	border:1px solid #d02718;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:45px;
	line-height:45px;
	width:131px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #810e05;
}
.logout:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #c62d1f), color-stop(1, #f24537) );
	background:-moz-linear-gradient( center top, #c62d1f 5%, #f24537 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#c62d1f', endColorstr='#f24537');
	background-color:#c62d1f;
}.logout:active {
	position:relative;
	top:1px;
}








.back {
	-moz-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	-webkit-box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	box-shadow:inset 0px 1px 0px 0px #bbdaf7;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #79bbff), color-stop(1, #378de5) );
	background:-moz-linear-gradient( center top, #79bbff 5%, #378de5 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff', endColorstr='#378de5');
	background-color:#79bbff;
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
	border:1px solid #84bbf3;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:45px;
	line-height:45px;
	width:131px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #528ecc;
}
.back:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #378de5), color-stop(1, #79bbff) );
	background:-moz-linear-gradient( center top, #378de5 5%, #79bbff 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#378de5', endColorstr='#79bbff');
	background-color:#378de5;
}.back:active {
	position:relative;
	top:1px;
}











</style>
</head>
<body>
<security:authorize access="hasRole('ROLE_USER')">
<h1 align="center">
	<wxx> Welcome</wxx> <pxx>${user}</pxx>
	</h1>
	
	<br />
	<br />
	<!-- <a href="welcome.html">Back</a> -->

	<div align="right">
		<!-- <a href="login.html"><font face="cursive" size="5px" color="Blue">Logout</font></a> -->
	
		<a href="welcome.html" class="back">Back</a>
		<a href="ttt/j_spring_security_logout" class="logout">Logout</a>
	</div>
	<h1 align="center">
	<wxx>
		Summary of your
			games.</wxx>
	</h1>
	<table border="1" align="center">
		<tr>
			<td>The number of games completed.</td>
			<td align="center">${nop}</td>
		</tr>
		<tr>
			<td>The number of 1-player games completed.</td>
			<td align="center">${noa}</td>
		</tr>
		<tr>
			<td>The number of 2-player games completed.</td>
			<td align="center">${noh}</td>
		</tr>
		<tr>
			<td>The win rate against AI.</td>
			<td align="cnter">${wa}%</td>
		</tr>
		<tr>
			<td>The win rate against human players.</td>
			<td align="center">${wh}%</td>
		</tr>

	</table>
	<br />
	<br />
	<!-- <h4>
		<font face="cursive" size="5px" color="Blue">Summary of this
			month games you played. </font>
	</h4> -->
	
	<h1 align="center">
	<wxx>
		Summary of this
			month games you played.</wxx>
	</h1>
	<table border="1" align="center">
		<th></th>
		<th align="center">Played_On</th>
		<th align="center">Opponent</th>
		<th align="center">Duration(in miliseconds)</th>
		<th align="center">Outcome</th>
		<c:forEach items="${thismonth}" var="i" varStatus="j">
			<tr align="center">
				<td>${j.index+1}</td>
				<td><fmt:formatDate type="both" 
            value="${i.getEnd_time()}" /></td>
				<c:choose>
					<c:when test="${not empty i.getPlayer2() }">
						<c:choose>
							<c:when test="${i.getPlayer2().getUsername() eq user }">
								<td>${i.getPlayer1().getUsername()}</td>
							</c:when>
							<c:otherwise>
							<td>${i.getPlayer2().getUsername()}</td>
						</c:otherwise>
						</c:choose>
						

					</c:when>
					<c:otherwise>
						<td>AI Player</td>
					</c:otherwise>
				</c:choose>
				<td>${i.getDuration()}</td>
				<c:choose>
					<c:when test="${i.isTie() eq true }">
						<td>Tie</td>
					</c:when>
					<c:when test="${i.getWinner() eq null  }">
						<td>Loss</td>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${i.getWinner().getUsername() eq user }">
								<td>Win</td>
							</c:when>
							<c:otherwise>
								<td>Loss</td>
							</c:otherwise>
						</c:choose>

					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
		<tr></tr>
	</table>
</security:authorize>
</body>
</html>