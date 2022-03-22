<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--프로젝트 주소(명)-->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="visual">
	<div class="visual-1">
		<div class="img-box">
			<img alt="" src="${contextPath}/images/visual/sub_visual02.jpg">
		</div>
		<div class="img-box visual-title">
			<img alt="" src="${contextPath}/images/visual/title.png">
		</div>
	</div>
	
	<div class="visual-2">
		<form id="signUpForm" name="signUpForm" class="signUpForm center">
	        <div class="signUpForm-1">
	            <h1 class="form-title">회원가입</h1>
	            
	            <ul class="signUp-ul">
	            	<li>
	            		<label>아이디</label>
            			<div>
	            		 	<input type="text" id="userId" name="userId">
	            		</div>
	            	</li>
	            	<li>
            			<label>비밀번호</label>
            			<div>
	            		 	<input type="password" id="userPw" name="userPw">
	            		</div>
	            	</li>
	            	<li>
            			<label>비밀번호 확인</label>
            			<div>
	            			 <input type="text" id="userPwComfirm" name="userPwComfirm">
	            		</div>
	            	</li>
	            	<li>
            			<label>이름</label>
            			<div>
	            			<input type="text" id="name" name="name">
	            		</div>
	            	</li>
	            	<li>
            			<label>Email</label>
            			<div>
	            			<input type="text" id="email" name="email">
	            		</div>
	            	</li>
	            </ul>
                <div>
	                 <a href="#" class="btn">가입하기</a>
	                 <a href="#" class="btn">취소</a>
               	</div>
              	</div>
   		</form>
	</div>
</div>


