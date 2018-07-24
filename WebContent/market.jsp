<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
    font-family: Arial, Helvetica, sans-serif;
}
.header {
    padding: 10px; /* some padding */
    text-align:center;
    background: #fff; /* green background */
     /* white text color */
}
.right{
	text-align:right;
}
.right a{
	text-decoration:none;
	font-size:12px;
}
/* Increase the font size of the <h1> element */
.header h1 {
    font-size: 40px;
}
/* Style the top navigation bar */
.navbar {
    overflow: hidden; /* Hide overflow */
    background-color: #333; /* Dark background color */
     display: flex;
    justify-content: center;
}

/* Style the navigation bar links */
#market{
	display: block; /* Change the display to block, for responsive reasons (see below) */
    color: #4CAF50; /* White text color */
    text-align: center; /* Center the text */
    padding: 14px 20px; /* Add some padding */
    text-decoration: none; /* Remove underline */
}
#market:hover {
    background-color: #4CAF50;
    color: white;
}
#menu{
	background-color:#4CAF50;
	display: block; /* Change the display to block, for responsive reasons (see below) */
    color: black; /* White text color */
    text-align: center; /* Center the text */
    padding: 14px 20px; /* Add some padding */
    text-decoration: none; /* Remove underline */
}
#menu:hover {
    background-color:#4CAF50;
    color: black;
}
.navbar a {
    /* Make sure that the links stay side-by-side */
    display: block; /* Change the display to block, for responsive reasons (see below) */
    color: white; /* White text color */
    text-align: center; /* Center the text */
    padding: 14px 20px; /* Add some padding */
    text-decoration: none; /* Remove underline */
}

/* Right-aligned link */
.navbar a.right {
    float: right; /* Float a link to the right */
}

/* Change color on hover/mouse-over */
.navbar a:hover {
    background-color: #ddd;
    color:black;
}
	#container{
				display:flex;
				flex-wrap:wrap;
				margin:0 auto;
				padding:20px 0px 0px 150px;
				width:1200px;
			}
			#container ul{
				 list-style:none;
			}
			#container ul li{
				 position: relative;
				float:left;
				 overflow: hidden;
			}
			#container img{
				width:200px;
				height:150px;
				margin:5px 15px 0 15px;
				border:1px solid #ccc;
				z-index:5;
			}
			#container .caption {
				position: absolute;
				  top:200px;
				  width:200px;
				  height:150px;
				  margin:5px 17px 17px 15px;
				  padding-top:20px;
				  background:rgba(76,175,80,0.6);
				  opacity:0;
				  -moz-transition: all 0.2s ease-in-out;
				  -o-transition: all 0.2s ease-in-out;
				  -webkit-transition: all 0.2s ease-in-out;
				  transition: all 0.2s ease-in-out;
				  z-index:10;
			}
			#container li:hover .caption {
			  opacity: 1;
			  -moz-transform: translateY(-200px);
			  -ms-transform: translateY(-200px);
			  -o-transform: translateY(-200px);
			  -webkit-transform: translateY(-200px);
			  transform: translateY(-200px);
			}     
			#container .caption h1, .prod-list .caption p {
			  color: #fff;
			  font-size:1em;
			  text-align: center;
			}  

footer {
    padding: 24px; /* some padding */
    text-align:center;
    background: #333; /* green background */
    color:white;/* white text color */
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 5px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: #ddd;
    color: black;
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 121px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 5px;
    text-decoration: none;
    padding:10px;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1;}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
</head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<div class="header">
   <a href="common/main.jsp"><img src="images/farm_logo.png" width="150px"></a>
  <div>A website created by me.</div>
</div>

마켓
</body>
</html>