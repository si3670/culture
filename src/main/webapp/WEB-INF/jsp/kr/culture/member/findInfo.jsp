<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--프로젝트 주소(명)-->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script>


//(2) 해당 controller로 전송
//$.ajax
	function findIdForm() {
		if($('#userNm').val()==""){
			alert("이름을 입력해주세요.");
			$('#userNm').focus();
			return;
		}
		if($('#userPhoneNum').val()==""){
			alert("전화번호를 입력해주세요.");
			$('#userPhoneNum').focus();
			return;
		}
		
		var params = {
				'userNm' : $('#userNm').val(),
				'userPhoneNum' : $('#userPhoneNum').val()
		}
		
		$.ajax({
			url: '${contextPath}/member/doFindId.do',
			type: 'POST',
			data: params,
			success: function(data){
				alert("success");
			},
		    error: function(status, error){
		    	alert("1. error : " + error);
		    }
		});
	}
	
	//(2) 비번찾기 버튼 누를때 발생하는 이벤트임
	function findPwForm() {
		//(3) 유효성 검사 
		
		//(4) ajax를 통해 controller로 데이터 전송
		//컨트롤러 만들어서 데이터 들어오는지 확인해주세여 (디버깅 확인이요)
		//파라미터 3개 이상이니까 vo로 받아주세여 
		//회원가입 로직이랑 똑같아
	}

	$(document).ready(function () {
		$("#findIdFormBtn").on('click', function () {
			findIdForm();
		});
		
		//(1) 비번찾기 버튼을 눌렀을 때 이 이벤트가 발생해라!
	})
</script>


	<form id="findIdForm" name="findIdForm" class="context findIdForm left">
      <div class="form-find">
          <h1 class="form-title">아이디 찾기</h1>
          
           <ul class="find_name">
           	<li>
           		<label>이름</label>
          		<div>
           		 	<input type="text" id="userNm" name="userNm" placeholder="등록한 이름">
           		</div>
           	</li>
           	<li>
          		<label>전화번호</label>
	        	<div>
	        		<input type="text" id="userPhoneNum" name="userPhoneNum" placeholder="휴대폰번호를 '-'없이 입력">
				</div>
			</li>
           </ul>
		<div class="button">
			<a id="findIdFormBtn" class="btn">아이디 찾기</a> 
		</div>
	</div>
	</form>
	
	
	
	<form id="findPwForm" name="findPwForm" class="findPwForm left">
      <div class="form-find">
          <h1 class="form-title">비밀번호 찾기</h1>
          
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
				<a id="" class="btn">비밀번호 찾기</a> 
			</div>
		</div>
	</form>
