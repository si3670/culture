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
<!-- jquery -->
<script type="text/javascript" src="${contextPath}/js/jquery/jquery-1.11.2.min.js"></script>
<!--css-->
<link type="text/css" rel="stylesheet" href="${contextPath}/css/egovframework/common.css" />
<!--폰트어썸_아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<script type="text/javascript">

</script>

<body>
<div class="header">
 <div class="con" id="top-ul">
 	<ul style="font-size: 14px; color: white; padding: 15px 0;">
 		<li><a href="#">계룡시청</a></li>
 		<li><a href="#">문화관광</a></li>
 		<li><a href="#">미디어자료관</a></li>
 		<li><a href="#">계룡시의회</a></li>
 	</ul>
 </div>
 <hr>
 <div class="nav flex con">
 	<div class="flex">
		<a href="#" class="img-box logo">
			<img alt="" src="${contextPath}/images/logo/logo3.png">
		</a>
	 	<a href="#" class="nav-a">문화관광</a>
 	</div>
 	 <ul class="nav-ul" id="nav-ul">
 		<li><a href="#">추천여행</a></li>
 		<li><a href="#">관광명소</a></li>
 		<li><a href="#">축제/체험</a></li>
 		<li><a href="#">역사/문화</a></li>
 		<li><a href="#">음식/숙박/쇼핑</a></li>
 		<li><a href="#">여행도우미</a></li>
 	</ul>
 	<div class="right-box">
 		<i class="fa-solid fa-user"></i>
 		<a onclick="location.href='${contextPath}/member/login.do'">로그인</a>
 	</div>
 </div>
  <hr>
</div>
 
 <div class="visual">
 	<div class="img-box visual-box">
 		<img alt="" src="${contextPath}/images/visual/visual-1.jpg">
 	</div>
 	
 	<div class="con">
 		<div style="padding: 50px 0;">
 			<h2>여행도우미</h2>
 		</div>

 	</div>
 </div>

</body>
</html>