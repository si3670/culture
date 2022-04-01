<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW 찾기</title>
<!--프로젝트 주소(명)-->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- css 적용 -->
<link type="text/css" rel="stylesheet" href="${contextPath}/css/egovframework/common.css" />
<style>
 .main-container{
        display: inline-flex;
    }
</style>
</head>
<body>
ㄴ	<form id="findId" name="findId" class="FindIdPw">
       <div class="form-find">
           <h3 class="form-title">아이디 찾기</h3>
           
            <ul class="find_name">
	           	<li>
	           		<label>이름</label>
	          		<div>
	           		 	<input type="text" id="memberName" name="memberName" placeholder="등록한 이름">
	           		</div>
	           	</li>
	           	<li>
	          		<label>휴대폰 번호</label>
		        	<div>
						<input type="text" id="memberPhone" name="memberPhone" placeholder="휴대폰번호를 '-'없이 입력">
					</div>
				</li>
            </ul>
			<div class="button">
				<a onclick="" class="btn">비밀번호 찾기</a> 
			</div>
		</div>
 	</form>
 	<form id="findPw" name="findPw" class="FindIdPw">
       <div class="form-find">
           <h3 class="form-title">비밀번호 찾기</h3>
           
            <ul class="find_name">
	           	<li>
	           		<label>아이디</label>
	          		<div>
	           		 	<input type="text" id="userId" name="userId" placeholder="아이디 입력">
	           		</div>
	           	</li>
	           	<li>
	          		<label>이름</label>
		        	<div>
						<input type="text" id="userName" name="userName" placeholder="이름 입력">
					</div>
				</li>
				<li>
	          	<label>이메일</label>
		        <div>
					<input type="text" id="userEmail" name="userEmail" placeholder="이메일 입력">
				</div>
				</li>
            </ul>
			<div class="button">
				<a onclick="" class="btn">아이디 찾기</a> 
			</div>
		</div>
 	</form>
</body>
</html>