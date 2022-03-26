<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--프로젝트 주소(명)-->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript">
	//회원가입
	function signUpForm() {
		//(1) 유효성 검사 
		//빈칸 입력 시 "00을 입력해주세요" alert
		//빈칸 입력시 alert창 나오고 input에 focus 주기
		
		//(2) 해당 controller로 전송
		//$.ajax
		
		//파라미터 받을게 2개 이상이면 serialize로 받아오기
		//var params = $('#signUpForm').serialize();  -------> 파라미터가  "loginId=e&loginPw=e& ..." 이렇게 넘어감
	}
	
	$(document).ready(function () {
		//회원가입 버튼 클릭 시 signUpForm() 이벤트
		$("#signUpFormBtn").on('click', function () {
			signUpForm();
		});
})
</script>


<div class="context">
	<form id="signUpForm" name="signUpForm" class="signUpForm center">
      <div class="form-1">
          <h1 class="form-title">회원가입</h1>
          
          <ul class="form-ul">
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
          
		  <div class="button">
			<a id="signUpFormBtn" class="btn">가입하기</a>
			<a onclick="" class="btn">취소</a>
		  </div>
		</div>
	</form>
</div>
