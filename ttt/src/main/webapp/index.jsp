<html>
<head>

<style type="text/css">
BODY {
	background-image: url('./images/2.gif');
	background-repeat: no-repeat;
	background-color: #FFFFFF;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	
	background-size: 590px;
}

/* login button */
.login {
	-moz-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	-webkit-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	box-shadow:inset 0px 1px 0px 0px #97c4fe;
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
	text-indent:0;
	border:5px solid #337fed;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:24px;
	font-weight:bold;
	font-style:normal;
	height:49px;
	line-height:49px;
	width:174px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #1570cd;
}
.login:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #1e62d0), color-stop(1, #3d94f6) );
	background:-moz-linear-gradient( center top, #1e62d0 5%, #3d94f6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e62d0', endColorstr='#3d94f6');
	background-color:#1e62d0;
}.login:active {
	position:relative;
	top:1px;
}





/* guest button */

.guestbutton {
	-moz-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	-webkit-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	box-shadow:inset 0px 1px 0px 0px #97c4fe;
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
	text-indent:0;
	border:5px solid #337fed;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:24px;
	font-weight:bold;
	font-style:normal;
	height:49px;
	line-height:49px;
	width:200px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #1570cd;
}
.guestbutton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #1e62d0), color-stop(1, #3d94f6) );
	background:-moz-linear-gradient( center top, #1e62d0 5%, #3d94f6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e62d0', endColorstr='#3d94f6');
	background-color:#1e62d0;
}.guestbutton:active {
	position:relative;
	top:1px;
}



h1{
color:red;}
</style>











</head>


<body>

<div align="center">
<h1 align="center">Welcome to TIC TAC TOE Game</h1>
<!-- <font face="script" size="20px" color="#7D0552" >Tic Tac Toe</font> -->
<br/>
<br/>
<!-- <a href="http://localhost:8080/ttt/login.html"><font face="cursive" size="4px" color="Blue" >Click Here To Login>>>></font></a>
 -->
<a href="http://localhost:8080/ttt/login.html" class="login">Login</a>
<br>
<br>
<!-- <a href="http://localhost:8080/ttt/guestgamedisplay.html"><font face="cursive" size="4px" color="Blue" >Click Here To Play as Guest  >>>></font></a> -->
<a href="http://localhost:8080/ttt/guestgamedisplay.html" class="guestbutton">Play as Guest</a>

</div>
</body>

</html>
