<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");

	if(id==null) {
		out.println("<script>");
		out.println("alert('로그인 한 회원만 쓸 수 있습니다.');");
		out.println("location.href='../member/memberLogin.us?turn=ok';");
		out.println("</script>");
	}else if(!id.equals("admin")){
		out.println("<script>");
		out.println("alert('권한이 없습니다.');");
		out.println("location.href='../common/main.im';");
		out.println("</script>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#admin_menu{
	margin:0 auto;
	text-align:center;
	background-color:#f6f6f6;
	width:400px;
	height:230px;
	border:1px solid #ccc;
	border-radius:5px;
}
.mypage button {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: black;
	width: 100px;
	border: 0;
	padding: 10px;
	margin:2px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
.mypage button:hover, .mypage button:active, .mypage button:focus {
	background: #191919;
}
</style>
<script>
var isDOM = (document.getElementById ? true : false); 
var isIE4 = ((document.all && !isDOM) ? true : false); 
var isNS4 = (document.layers ? true : false); 
var isNS = navigator.appName == "Netscape";

function getRef(id) { 
if (isDOM) return document.getElementById(id); 
if (isIE4) return document.all[id]; 
if (isNS4) return document.layers[id]; 
}

function getSty(id) { 
x = getRef(id); 
return (isNS4 ? getRef(id) : getRef(id).style); 
}

var speed = 5; //작을 수록 빠름.. 
var fixWidth = 949; //[수정해야함]고정 픽셀

function moveRightEdge() { 
var yMenuFrom, yMenuTo, yOffset; 
var loopTime = 10; //1000 = 1초, 100 = 0.1초

if (isNS4) { 
 yMenuFrom = _floater.top-220; //[수정해야함]
 yMenuTo = windows.pageYOffset; // 위쪽 위치 
 var pWidth = window.innerHeight; //브라우져 안쪽 가로 길이 
} else if (isDOM) { 
 yMenuFrom = parseInt (_floater.style.top, 10)-220;//[수정해야함]
 yMenuTo = (isNS ? window.pageYOffset : ((document.documentElement.scrollTop) ? document.documentElement.scrollTop:document.body.scrollTop)); // 위쪽 위치 
 var pWidth = (isNS ? window.innerWidth -14 : document.body.clientWidth);; //브라우져 안쪽 가로 길이 
}

//if( pWidth > fixWidth ) _floater.style.left = (pWidth / 2 ) + ( fixWidth / 2) 
_floater.style.left = fixWidth + "px";
//alert(document.documentElement.scrollTop);
if (yMenuFrom != yMenuTo) { 
yOffset = Math.ceil(Math.abs(yMenuTo - yMenuFrom) / speed); 
if (yMenuTo < yMenuFrom) 
yOffset = -yOffset; 
if (isNS4) 
_floater.top += yOffset; 
else if (isDOM) 
_floater.style.top = parseInt (_floater.style.top, 10) + yOffset; 
} 
//alert(_floater.style.top);
setTimeout ("moveRightEdge()", loopTime); 
}

document.write('<div id="floater" style="left: 949px; top:220px; width:208px; height:310px; z-index:1; visibility: visible; position: absolute"> ');
document.write('<table width="208" border="0" cellpadding="0" cellspacing="0">');
document.write('<tr><td><a href="[링크할곳]booking"><img src="[링크할곳]page/images/scroll1.jpg" width="208" height="62" border="0"/></a></td></tr>');
document.write('<tr><td><a href="[링크할곳]hune"><img src="[링크할곳]page/images/scroll2.jpg"  width="208" height="52"border="0" /></a></td></tr>');
document.write('<tr><td><img src="[링크할곳]page/images/scroll3.jpg" width="208" height="81" /></td></tr>');
document.write('<tr><td><img src="[링크할곳]page/images/scroll5.jpg" width="208" height="54" /><td></tr>');
document.write('<tr><td background="images/scroll4.jpg" height="55px">&nbsp;<td></tr>');
document.write('</table>');
document.write('</div>');//[수정해야함]

//div 밑에 위치해야 한다. 
//오른쪽 스크롤 스크립트 시작

if (isNS4) { 
 var _floater = document["floater"]; 
 _floater.top = top.pageYOffset; 
 _floater.visibility = "visible"; 
 moveRightEdge(); 
} else if (isDOM) { 
 var _floater = getRef('floater'); 
 _floater.style.top = (isNS ? window.pageYOffset : document.body.scrollTop);// + 100; 
 _floater.style.visibility = "visible"; 
 moveRightEdge(); 
}
</script>
</head>
<link rel="stylesheet" type="text/css" href="/FarmParm/style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>
<div class="pageform">
	<h3>&nbsp;&nbsp;관리자 페이지</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<div id="admin_menu">
	<br><br>
		<button onclick="location.href='../memberList.us'">회원관리</button>

		<button onclick="location.href='./itemSearch.jsp'">입출고등록</button><br>
		<button onclick="location.href='./itemRegistForm.im'">상품등록</button>

		<button onclick="location.href='./itemList.im'">상품목록</button><br>
		<button onclick="location.href='./odList.od'">주문목록</button>
		<button onclick="location.href='#'">상품발송</button>
	</div>
	</div>
	
</div>
 <jsp:include page="/common/footer.jsp" flush="false"/>
</body>
</html>
