<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.admbar {
    overflow: hidden;
    background-color: #ccc;
     display: flex;
    justify-content: center;
}
.admbar a {
    display: block;
    color: #333;
    text-align: center;
    padding: 14px 20px;
    text-decoration: none;
}
.admbar a.right {
    float: right;
}
.admbar>ul>li>a:hover {
    color:black;
    text-decoration: none;
}
.admbar ul {
    list-style-type: none;
    margin: 0 auto;
    padding: 0;
    overflow: hidden;
    background-color: #ccc;
}
</style>
</head>
<body>
<div class="admbar">
 <ul>
  <li><a href="/FarmParm/memberList.us" class="dropbtn">&nbsp;&nbsp;회원관리&nbsp;&nbsp;</a></li>
  <li><a href="/FarmParm/admin/itemSearch.im" class="dropbtn">&nbsp;&nbsp;입출고관리&nbsp;&nbsp;</a></li>
  <li><a href="/FarmParm/admin/itemRegistForm.im" class="dropbtn">&nbsp;&nbsp;상품등록&nbsp;&nbsp;</a></li>
  <li><a href="/FarmParm/admin/itemList.im" class="dropbtn">&nbsp;&nbsp;상품목록&nbsp;&nbsp;</a></li>
  <li><a href="/FarmParm/admin/odList.od" class="dropbtn">&nbsp;&nbsp;주문목록&nbsp;&nbsp;</a></li>
  <li><a href="/FarmParm/admin/salesList.od" class="dropbtn">&nbsp;&nbsp;매출관리&nbsp;&nbsp;</a></li>
  <li><a href="/FarmParm/admin/qnaList.bo" class="dropbtn">&nbsp;&nbsp;상품문의&nbsp;&nbsp;</a></li>
</ul>
</div>
</body>
</html>