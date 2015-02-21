<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

td{
        table-layout:fixed; 
        height: 50;
        width: 50;
   align: center;     
      
        
    }
    
h3{
color:white;}

table, th, td{
 
background-color:#FFFF99;
font-size:40px;

}

td {
    height: 50px;
	width:50px;
}




wxx{
color:white;
font-size:30px;
}
pxx{

font-size:40px;
color:yellow;}

a{
color:lightblue;}

h3{
color:white;}




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

<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
 var flag=false;
	$(function() {
		$
				.ajax({
					url : "game.json",
					cache : false,
					success : function(data) {
						var u = "${user}";
						$('#status').empty();
						$('#gamename').empty();						
                       $('#tab').empty();                    
						for (var k = 0; k < data.g.length; k++) {                         
							var h =data.g[k].host ;
							var n = data.g[k].join;									
							var hp=data.g[k].host_Position;
							var jp=data.g[k].join_position;				
									
							if (h === u) {
								$('#status')
										.append(
												"<p><font face='Modern' size='4px' color='#F70D1A'>"
														+ n
														+ " </font> join the game make your move.</p>");

								$('#gamename')
										.append(
												"<font face='Modern' size='4px' color='#F70D1A'>"
														+ h
														+ "  vs  <font face='Modern' size='5px' color='#F70D1A'>"
														+ n + "</font>");

								
								
								for(var i=0;i<3;i++)
								{
									$('#tab').append("<tr id='"+i+"'></tr>");
									for(var j=0;j<3;j++)
										{
										    if($.inArray(i+""+j,hp)>-1)
										    	{
										    	   $('#'+i).append("<td align='center'><font color='blue'>X</font></td>");
										    	}
										    else if($.inArray(i+""+j,jp)>-1)
										    	{
										    	$('#'+i).append("<td align='center' ><font color='red'>O</font></td>");   
										    	}
										    else if(data.g[k].turn===false && data.g[k].result === null) 
										    	{
										    	$('#'+i).append("<td align='center' ><a href='plaer2gamelogic.html?i="+i+"&j="+j+"'>-</a></td>");
										    	}

										    else  
										    	{
										    	$('#'+i).append("<td align='center' > </td>");
										    	}
										}
									
								
                                 									
								
								}
								
								
								$('#msg').empty();
								if(data.g[k].result != null)
								$('#result').append("<h4 color='RED'>"+data.g[k].result+"</h4>");
								break;
							} else if(n===u){
								$('#status')
										.append(
												"<p><font face='Modern' size='4px' color='#F70D1A'>"
														+ h
														+ " </font> host the game wait for ur turn..</p>");

								$('#gamename')
										.append(
												"<font face='Modern' size='4px' color='#F70D1A'>"
														+ h
														+ "  vs  <font face='Modern' size='5px' color='#F70D1A'>"
														+ n + "</font>");
								for(var i=0;i<3;i++)
								{
									$('#tab').append("<tr id='"+i+"'></tr>");
									for(var j=0;j<3;j++)
										{
										    if($.inArray(i+""+j,hp)>-1)
										    	{
										    	   $('#'+i).append("<td align='center' ><font color='blue'>X</font></td>");
										    	}
										    else if($.inArray(i+""+j,jp)>-1)
										    	{
										    	$('#'+i).append("<td align='center' ><font color='red'>O</font></td>");   
										    	}
										    else if(data.g[k].turn===true && data.g[k].result === null)
										    	{
										    	$('#'+i).append("<td align='center' ><a href='plaer2gamelogic.html?i="+i+"&j="+j+"'>-</a></td>");
										    	}

										    else 
										    	{
										    	$('#'+i).append("<td align='center' > </td>");
										    	}
										}
									
								
                                 									
								
								}
								$('#msg').empty();
								if(data.g[k].result != null)
								$('#result').append("<h4 color='RED'>"+data.g[k].result+"</h4>");
								break;
							}

						}
					}
				});
		updategame();
	});

	
	function updategame() {
		$
				.ajax({
					url : "game.deferred.json",
					cache : false,
					success : function(data) {
						
						
						var u = "${user}";
						$('#status').empty();
						$('#gamename').empty();
			         	$('#msg').empty();
			         	  $('#tab').empty();
				
						for (var k = 0; k < data.length; k++) {
							
                            
							var h = data[k].host;
							var n = data[k].join;
							var hp=data[k].host_Position;
							var jp=data[k].join_position;
							if (h === u) {
								$('#status')
										.append(
												"<p><font face='Modern' size='4px' color='#F70D1A'>"
														+ n
														+ " </font> join the game make your move.</p>");

								$('#gamename')
										.append(
												"<font face='Modern' size='4px' color='#F70D1A'>"
														+ h
														+ "  vs  <font face='Modern' size='5px' color='#F70D1A'>"
														+ n + "</font>");
								 
								
								for(var i=0;i<3;i++)
								{
									$('#tab').append("<tr id='"+i+"'></tr>");
									for(var j=0;j<3;j++)
										{
										    if($.inArray(i+""+j,hp)>-1)
										    	{
										    	
										    	   $('#'+i).append("<td align='center' ><font color='blue'>X</font></td>");
										    	}
										    else if($.inArray(i+""+j,jp)>-1)
										    	{
										    	$('#'+i).append("<td align='center' ><font color='red'>O</font></td>");   
										    	}
										    else if(data[k].turn===false && data[k].result === null)
										    	{
										    	$('#'+i).append("<td align='center' ><a href='plaer2gamelogic.html?i="+i+"&j="+j+"'>-</a></td>");
										    	}

										    else 
										    	{
										    	$('#'+i).append("<td align='center' > </td>");
										    	}
										}
									
								
                                 									
								
								}
								
								$('#msg').empty();
								if(data[k].result!=null)
								  $('#result').append("<h4 color='RED'>"+data[k].result+"</h4>");

								break;
							} else  if(n===u){
								$('#status')
										.append(
												"<p><font face='Modern' size='4px' color='#F70D1A'>"
														+ h
														+ " </font> host the game wait for ur turn..</p>");

								$('#gamename')
										.append(
												"<font face='Modern' size='4px' color='#F70D1A'>"
														+ h
														+ "  vs  <font face='Modern' size='5px' color='#F70D1A'>"
														+ n + "</font>");
								
								
								for(var i=0;i<3;i++)
								{
									$('#tab').append("<tr id='"+i+"'></tr>");
									for(var j=0;j<3;j++)
										{
										    if($.inArray(i+""+j,hp)>-1)
										    	{
										    	
										    	   $('#'+i).append("<td align='center' ><font color='blue'>X</font></td>");
										    	}
										    else if($.inArray(i+""+j,jp)>-1)
										    	{
										    	$('#'+i).append("<td align='center'><font color='red'>O</font></td>");   
										    	}
										    else if(data[k].turn===true && data[k].result === null)
										    	{
										    	$('#'+i).append("<td align='center' ><a href='plaer2gamelogic.html?i="+i+"&j="+j+"'>-</a></td>");
										    	}

										    else  
										    	{
										    	$('#'+i).append("<td align='center'> </td>");
										    	}
										}
									
								
                                 									
								
								}
								$('#msg').empty();
								if(data[k].result != null )
								  $('#result').append("<h4 color='RED'>"+data[k].result+"</h4>");
								break;
							}
						}
						
						updategame();

					},
				});
	}
	
</script>
</head>
<body>
	<div align="center">
	<h1 align="center">
	<wxx> Tic Tac Toe</wxx> 
	</h1>
			<h1 align="center">
	<wxx> 2 Player Game</wxx>
	</h1>
			<h1 align="center">
	<wxx> Welcome </wxx> <pxx>${user}</pxx>
	</h1>
		
		
		<div align="right">
		<!-- <a href="login.html"><font face="cursive" size="5px" color="Blue">Logout</font></a> -->
	
		<a href="welcome.html" class="back">Back</a>
		<a href="login.html" class="logout">Logout</a>
	</div>
		<%-- <br /> <br /> Welcome <font face="Modern" size="5px" color="green">${user}</font><br /> --%>
		<br /> <br />
		<h3 id="msg">${wait}</h3>
		<h3 id="status"></h3>
		<h3 id="gamename"></h3>
		<br />
		<br />
		<div id="board">
  <table border="1"  cellpadding="15" id="tab">
  
  </table>
			
		</div>


<h3 id="result"></h3>


	</div>

	<br />
	<!-- <a href="canclegame.html?i=1">Back</a> -->
</body>
</html>