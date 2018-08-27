<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.admbar {
    overflow: hidden;
    background-color: #4CAF50;
    display: flex;
    justify-content: center;
   	margin:10px 0;
}
.admbar a {
    display: block;
    color: #191919;
    text-align: center;
    padding: 5px 10px;
    text-decoration: none;
}
.admbar a.right {
    float: right;
}
.admbar>ul>li>a:hover {
	background-color:#ddd;
    text-decoration: none;
}
.admbar ul {
    list-style-type: none;
    margin: 0 auto;
    padding: 0;
    overflow: hidden;
    background-color: #4CAF50;
}
#adminbt{
	background-color: white;
	border-top:solid 1px #5D5D5D;
	border-left:solid 1px #5D5D5D;
	border-right:solid 1px #5D5D5D;
}
</style>
</head>
<body>
<c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<div class="admbar">
 <ul>
 
  <li>
  <c:choose>
  <c:when test="${uri eq '/FarmParm/memberList.us'}"><a href="/FarmParm/memberList.us" id="adminbt">&nbsp;&nbsp;회원관리&nbsp;&nbsp;</a></c:when>
  <c:otherwise><a href="/FarmParm/memberList.us">&nbsp;&nbsp;회원관리&nbsp;&nbsp;</a></c:otherwise>
  </c:choose>
  </li>
  <li>
  <c:choose>
  <c:when test="${uri eq '/FarmParm/admin/itemSearch.im'}"><a href="/FarmParm/admin/itemSearch.im" id="adminbt">&nbsp;&nbsp;입출고관리&nbsp;&nbsp;</a></c:when>
  <c:otherwise><a href="/FarmParm/admin/itemSearch.im">&nbsp;&nbsp;입출고관리&nbsp;&nbsp;</a></c:otherwise>
  </c:choose>
  </li>
  <li>
  <c:choose>
  <c:when test="${uri eq '/FarmParm/admin/itemRegistForm.im'}"><a href="/FarmParm/admin/itemRegistForm.im" id="adminbt">&nbsp;&nbsp;상품등록&nbsp;&nbsp;</a></c:when>
  <c:otherwise><a href="/FarmParm/admin/itemRegistForm.im">&nbsp;&nbsp;상품등록&nbsp;&nbsp;</a></c:otherwise>
  </c:choose>
  </li>
  <li>
  <c:choose>
  <c:when test="${uri eq '/FarmParm/admin/itemList.im'}"><a href="/FarmParm/admin/itemList.im" id="adminbt">&nbsp;&nbsp;상품목록&nbsp;&nbsp;</a></c:when>
  <c:otherwise><a href="/FarmParm/admin/itemList.im">&nbsp;&nbsp;상품목록&nbsp;&nbsp;</a></c:otherwise>
  </c:choose>
  </li>
  <li>
  <c:choose>
  <c:when test="${uri eq '/FarmParm/admin/odList.od'}"><a href="/FarmParm/admin/odList.od" id="adminbt">&nbsp;&nbsp;주문목록&nbsp;&nbsp;</a></c:when>
  <c:otherwise><a href="/FarmParm/admin/odList.od">&nbsp;&nbsp;주문목록&nbsp;&nbsp;</a></c:otherwise>
  </c:choose>
  </li>
  <li>
  <c:choose>
  <c:when test="${uri eq '/FarmParm/admin/salesList.od'}"><a href="/FarmParm/admin/salesList.od" id="adminbt">&nbsp;&nbsp;매출관리&nbsp;&nbsp;</a></c:when>
  <c:otherwise><a href="/FarmParm/admin/salesList.od">&nbsp;&nbsp;매출관리&nbsp;&nbsp;</a></c:otherwise>
  </c:choose>
  </li>
  <li>
  <c:choose>
  <c:when test="${uri eq '/FarmParm/admin/qnaList.bo'}"><a href="/FarmParm/admin/qnaList.bo" id="adminbt">&nbsp;&nbsp;상품문의&nbsp;&nbsp;</a></c:when>
  <c:otherwise><a href="/FarmParm/admin/qnaList.bo">&nbsp;&nbsp;상품문의&nbsp;&nbsp;</a></c:otherwise>
  </c:choose>
  </li>
</ul>
</div>
</body>
</html>