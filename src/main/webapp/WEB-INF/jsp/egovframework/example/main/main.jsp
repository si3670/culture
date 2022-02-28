<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화관광 게시판</title>
</head>

<style>
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
    font-family: 'GmarketSansMedium';
}

* {
	margin: 0;
	padding: 0;
}

ol, ul, li {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.img-box{
	border-color: red;
	width: 100%;
	height: 300px;
}
.img-box>img {
	display: block;
	width: 100%;
}

.con {
	margin: 0 auto;
	max-width: 1400px;
	background-color: red;
}

.nav-ul {
	text-align: center;
}

.nav-ul>li>a {
	background-color: blue;
	display: inline-block;
	padding: 0 25px;
	font-size: 20px;
	color: white;
}

.visual{
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
	width: 100%;
}
.header{
	position: relative;
}
ul>li {
	display: inline-block;
}
</style>

<body>
<div class="header">
 <div class="con">
 	<ul style="font-size: 14px; color: white;">
 		<li><a>계룡시청</a></li>
 		<li><a>문화관광</a></li>
 		<li><a>미디어자료관</a></li>
 		<li><a>계룡시의회</a></li>
 	</ul>
 </div>
 <div class="nav">
 	 <ul class="nav-ul">
 		<li><a>추천여행</a></li>
 		<li><a>관광명소</a></li>
 		<li><a>축제/체험</a></li>
 		<li><a>역사/문화</a></li>
 		<li><a>음식/숙박/쇼핑</a></li>
 		<li><a>여행도우미</a></li>
 	</ul>
 </div>
</div>
 
 <div class="visual">
 	<div class="img-box"></div>
 </div>
 
 
</body>
</html>