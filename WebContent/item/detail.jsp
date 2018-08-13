<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, java.text.*"  %>
<%@page import="vo.BoardBean"%>
<%@page import="vo.PageInfo"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.mypage button {
	font-family:"Nanum Gothic";
	font-weight: 700;
	text-transform: uppercase;
	outline: 0;
	background: black;
	width: 100px;
	border: 0;
	padding: 10px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#td_left{
	background-color:#F6F6F6;
	width:100px;
}
#td_info{
	text-align:right;
}
#td_check{
	width:50px;
}
#top_menu{
	background-color:#333;
	height:20px;
	color:white;
	padding:0;
}
#detail_board{
	margin:0 auto;
	border-collapse: collapse;
    width: 700px;
    height:100px;
    font-size:10px;
	background-color:white;
	text-align:center;
}
#detail_board tr td{
	font-size:12px;
}
#detail_board tr:nth-child(even) {background-color: #f2f2f2;}
#idetail{
	margin:0 auto;
	display:inline-block;
}
#id_img{
	float:left;
}
#id_text{
	padding:0 50px 0 50px;
	float:left;
	font-size:12px;
}
#saled{
	color:#4CAF50;
}
dt{
	display:inline-block;
	width:80px;
	text-align:left;
}
dd{
	display:inline-block;
	width:80px;
	text-align:center;
}
#gbutton{
	float:right;
	margin-right:50px;
	margin-top:20px;
	font-family:"Nanum Gothic";
	font-weight: 500;
	text-transform: uppercase;
}
#wbutton{
	float:right;
	margin-right:50px;
	margin-top:20px;
	font-family:"Nanum Gothic";
	font-weight: 500;
	text-transform: uppercase;
	outline: 0;
	background: #fff;
	border: 0;
	padding: 5px;
	border : 1px solid #ccc;
	border-radius : 5px;
	color: #191919;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}
#wbutton:active{
	background: #F6F6F6;
}
#td_right_s{
	width:100px;
}
#commandCell{
	margin-left:658px;
}
#qna_regist{
	margin-left:47px;
	font-family:"Nanum Gothic";
	font-weight: 500;
}
#pageList{
	text-align:center;
}
#leftalign{
	text-align:left;
}
</style>
<script>
	function goto_url(act) {
		document.itemform.action = act;
		var qty = document.getElementById("qty").value;
		var stock = document.getElementById("stock").value;
		var reg_qty = /^[1-9]{1}$|^[1-4]{1}[0-9]{1}$|^50$/;
		if (!reg_qty.test(qty)) {
			alert("1~50의 숫자만 가능합니다.");
			document.qty.focus();
			return false;
		}
		if (parseInt(qty)>parseInt(stock)) {
			alert("주문 가능 개수 초과");
			document.qty.focus();
			return false;
		}
		document.itemform.submit();
	}
	
	function doImgPop(img){ 
		 img1= new Image(); 
		 img1.src=(img); 
		 imgControll(img); 
		} 
		  
		function imgControll(img){ 
		 if((img1.width!=0)&&(img1.height!=0)){ 
		    viewImage(img); 
		  } 
		  else{ 
		     controller="imgControll('"+img+"')"; 
		     intervalID=setTimeout(controller,20); 
		  } 
		}
		function viewImage(img){ 
		 W=img1.width; 
		 H=img1.height; 
		 O="width="+W+",height="+H+",scrollbars=yes"; 
		 imgWin=window.open("","",O); 
		 imgWin.document.write("<html><head><title>::::: 이미지상세보기 :::::</title></head>");
		 imgWin.document.write("<body topmargin=0 leftmargin=0>");
		 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
		 imgWin.document.close();
	}
</script>
</head>
<link rel="stylesheet" type="text/css" href="style/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<body>
<jsp:include page="/common/top_menu.jsp" flush="false"/>

<c:if test="${todayImageMap!=null }">
<div class="recent_view">
		<h4>&nbsp;&nbsp;최근 본 상품</h4>
		<table>
		<tr>
			<c:forEach var="todayImage" items="${todayImageMap }" varStatus="status" begin="0" end="5" step="1">
				<td><a href="uitemView.im?item_code=${todayImage.key }"><img src="images/${todayImage.value }" id="todayImage"/></a></td>
			</c:forEach>
		</tr>
		</table>
</div>
</c:if>
<c:set var="price" value="${item.price }"/>
<c:set var="sale" value="${item.sale }"/>
<%
int price = (int)pageContext.getAttribute("price");
int sale = (int)pageContext.getAttribute("sale");
double saled = 1-(double)sale/100;
int uprice = (int)(price*saled);
pageContext.setAttribute("uprice", uprice);
%>

<div class="goodsform">
	<h3>&nbsp;&nbsp;상품 페이지</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form method="post" name="itemform">
	<div id="idetail">
	<input type="hidden" name="stock" id="stock" value=${stock }>
		<div id="id_img">
			<img src="images/${item.img_path }" width="400px">
		</div>
		<div id="id_text">
			<dl>
				<dt>상품이름</dt>
				<dd><b>${item.item_name }</b></dd>
			</dl>
			<dl>
				<dt>가격</dt>
				<dd><fmt:formatNumber value="${item.price }" type="number"/>원</dd>
			</dl>
			<c:if test="${item.sale>0 }">
				<dl>
					<dt>할인가</dt>
					<dd><b id="saled"><fmt:formatNumber value="${uprice }" type="number"/></b>원</dd>
				</dl>
			</c:if>
			<dl>
				<dt>원산지</dt>
				<dd>${item.origin }</dd>
			</dl>
			<hr color="#4CAF50" size="5">
			<dl>
				<dt>수량</dt>
				<c:choose>
				<c:when test="${stock<=0 }">
					<dd><font style="color:red;">매진</font></dd>
				</c:when>
				<c:otherwise>
					<dd><input type="text" id="qty" name="qty" size="1" value="1"/></dd>
				</c:otherwise>
				</c:choose>
			</dl>
			<c:if test="${stock<6 }">
			<dl>
				<dd><font style="color:red;">${stock }개 남음!</font></dd>
			</dl>
			</c:if>
			<hr color="#4CAF50" size="5">
			<c:choose>
				<c:when test="${stock<=0 }">
					<button type="button" onclick="#">장바구니</button>
					<button type="button" onclick="#">바로구매</button>
				</c:when>
				<c:otherwise>
					<button type="button" onclick="goto_url('./item/addCart.ct?item_code=${item.item_code}');">장바구니</button>
					<button type="button" onclick="goto_url('./order/odForm.od?type=one&item_code=${item.item_code}');">바로구매</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	</form>
<br><br>
</div>
<div class="goods_detail">
	<h3>상품 소개</h3>
	<h4>${item.item_name }</h4>
	<img src="images/${item.img_path }">
	<br><br>
	<p>
		${item.content }
	</p>
</div>
<br><br><br>
	<br><br><br>
	<jsp:include page="review.jsp" flush="false"/>
	<br><br><br>
	<jsp:include page="qna.jsp" flush="false"/>
	<br><br><br>
	</div>
	<br><br><br><br>
	 <jsp:include page="/common/footer.jsp" flush="false"/>
	</body>
	</html>
