<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화관광 게시판</title>
<!--프로젝트 주소(명)-->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!--css-->
<link type="text/css" rel="stylesheet" href="/culture/css/egovframework/common.css" />
</head>

<body>
<div class="header">
 <div class="con">
 	<ul style="font-size: 14px; color: white;">
 		<li><a href="#">계룡시청</a></li>
 		<li><a href="#">문화관광</a></li>
 		<li><a href="#">미디어자료관</a></li>
 		<li><a href="#">계룡시의회</a></li>
 	</ul>
 </div>
 
 <div class="nav flex con">
 	<div class="flex">
		<a href="#" class="logo">
			<img alt="" src="${contextPath}/images/logo/logo3.png">
		</a>
	 	<a href="#" style="background-color: pink; font-size: 30px;">문화관광</a>
 	</div>
 	 <ul class="nav-ul">
 		<li><a href="#">추천여행</a></li>
 		<li><a href="#">관광명소</a></li>
 		<li><a href="#">축제/체험</a></li>
 		<li><a href="#">역사/문화</a></li>
 		<li><a href="#">음식/숙박/쇼핑</a></li>
 		<li><a href="#">여행도우미</a></li>
 	</ul>
 	<div>아이콘</div>
 </div>
</div>
 
 <div class="visual">
 	<div class="img-box"></div>
 </div>
 
 
</body>
</html>