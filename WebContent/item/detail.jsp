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
<title>:::상품페이지 | 팜팜농원:::</title>
<style>
#td_info{
	text-align:right;
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
</style>
<script>
	function goto_url(act) {
		document.itemform.action = act;
		var qty = document.getElementById("qty").value;
		var stock = document.getElementById("stock").value;
		var reg_qty = /^[1-9]{1}$|^[1-4]{1}[0-9]{1}$|^50$/;
		if (!reg_qty.test(qty)) {
			alert("1~50의 숫자만 가능합니다.");
			document.qty.value="";
			document.qty.focus();
			return false;
		}
		if (parseInt(qty)>parseInt(stock)) {
			alert("주문 가능 개수 초과");
			document.qty.value="";
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
<br>
<p style="float:right;font-size:12px;margin-right:110px;">홈>${item.category }>${item.item_name }</p>
<h3>&nbsp;&nbsp;상품 페이지</h3>
	<hr color="#4CAF50" size="5">
	<div class="mypage">
	<form method="post" name="itemform">
	<div id="top_item">
	<a href="./uitemList.im?category=${item.category }"><b>${item.category }</b></a>
	| ${item.item_name }
	<c:if test="${id eq 'admin' }">
	<span id="top_item-right">
	<a href="./admin/itemView.im?item_code=${item.item_code}">상품정보보기</a></span>
	</c:if>
	</div><br>
	<div id="idetail">
	<input type="hidden" name="stock" id="stock" value=${stock }>
		<div id="id_img">
			<img src="images/${item.img_path }" width="450px">
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
					<button id="sbutton" type="button" onclick="#">장바구니</button>
					<button id="bbutton" type="button" onclick="#">바로구매</button>
				</c:when>
				<c:otherwise>
					<button id="sbutton" type="button" onclick="goto_url('./item/addCart.ct?item_code=${item.item_code}');">장바구니</button>
					<button id="bbutton" type="button" onclick="goto_url('./order/odForm.od?type=one&item_code=${item.item_code}');">바로구매</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	</form>
<br><br>
</div>
<div class="goods_detail">
<h3 align="left">&nbsp;&nbsp;상품안내</h3>
	<hr color="#4CAF50" size="5">
	<img src="images/detail.png" style="opacity:0.9;"/>
	<p align="center">
		${item.item_name }
		<br><br>
		
			${item.content }
	</p><br><br>
	<img src="images/detail_footer.png" style="opacity:0.9;"/><br>
	<br><br><br><br><br><br><br>
	<h3 align="left">&nbsp;&nbsp;배송정책</h3>
	<hr color="#4CAF50" size="5">
	<p style="margin-left:50px;font-size:12px;">
		배송 방법 : 택배<br>
		배송 지역 : 전국지역<br>
		배송 비용 : 3,000원<br>
		배송 기간 : 2일 ~ 3일<br>
		배송 안내 : 최종결제금액 30,000원 이상 무료배송.<br>
		산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
		고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br>
	</p>
</div>
	<br><br><br>
	<jsp:include page="review.jsp" flush="false"/>
	<br><br><br>
	<jsp:include page="qna.jsp" flush="false"/>
	<br>
	</div>
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
	<br><br>
	 <jsp:include page="/common/footer.jsp" flush="false"/>
	</body>
	</html>
