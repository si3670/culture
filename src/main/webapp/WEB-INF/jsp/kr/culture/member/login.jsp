<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--프로젝트 주소(명)-->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript">
	//로그인
	function loginForm() {
		//(1) 유효성 검사 
		//빈칸 입력 시 "00을 입력해주세요" alert
		//빈칸 입력시 alert창 나오고 input에 focus 주기
		
		//(2) 해당 controller로 전송
		//$.ajax
	if($('#userId').val()==""){
			alert("아이디를 입력해주세요!");
			$('#userId').focus();
			return;
		}
	if($('#userPw').val()==""){
		alert("비밀번호를 입력해주세요!");
		$('#userPw').focus();
		return;
	}	
} 
	$(document).ready(function () {
		//로그인 버튼 클릭 시 loginForm() 이벤트
		$("#loginFormBtn").on('click', function () {
			loginForm();
			$.ajax({
				type:"POST",
				url: "/login.do",
				data: { "userId": $("#userId").val(), 
					  "userPw": $("#userPw").val()
					  },
						 success: function(data){
					        alert(data.Msg);
					   },
					      error: function(){
					            alert("err");
					    }
				});	
		});
	})

			

</script>
 
<div class="context">
	<form id="loginForm" name="loginForm" class="loginForm center">
       <div class="form-1">
           <h1 class="form-title">로그인</h1>
           
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
            </ul>
			<div class="button">
				<a id="loginFormBtn" class="btn">로그인</a> 
				<a onclick="" class="btn">취소</a>
			</div>
		</div>
 	</form>
</div>


 	