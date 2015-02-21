<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
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
table{
 
background-color:white;}

wxx{
color:white;
font-size:30px;
}
pxx{

font-size:40px;
color:yellow;}

a{
color:lightblue;}

h1{
color:white;}






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



table, th, td{
 
background-color:#FFFF99;
font-size:40px;

h3
{
color:white;
}
td {
    height: 50px;
	width:50px;
}

</style>
</head>
<body>
	<div align="center">
			<h1>
				Tic Tac Toe
			</h1>
			
			<wxx> Welcome    </wxx> <pxx>Guest</pxx>
	
			
			<br/><br/>
			
			<h1 align="center">${result} ${cont}</h1>
			<br/>
			<br/>
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
										<td align="center"></td>
									</c:when>

									<c:otherwise>
										<td align="center"><a href="guestgame.html?i=${i}&j=${j}">_</a></td>
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
			<a href="guestgamedisplay.html" class="back">New Game</a> 
			&nbsp &nbsp
			
			<a href="http://localhost:8080/ttt/" class="back">Back</a>  
			
			
			
			
		
		
		
		   
			</div>
		
</body>
</html>