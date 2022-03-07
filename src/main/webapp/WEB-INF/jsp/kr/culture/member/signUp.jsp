<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        div {
            width: 300px;
            height: 240px;
            margin:0 auto;
            background: lightgray;
            text-align:center;
        }
        h2{
            text-align: center; 
            text-decoration: solid;
            margin-right: 100px;
        }
        h3{
            text-align: center;
        }
        .memberInputBox{
            margin-top: 15px;
            background-color: skyblue; 
            color:aliceblue;

        }
 
        a.btn{
            display:inline-block;
            width:80px;
            text-align:center;
            background-color:green;
            color:#fff;
        }
    </style>
</head>
<body>
    <h2>계룡시 문화관광</h2>
    <form action="">
        <div>
            <h3>회원가입</h3>
            <input class="memberInputBox" type="text" name="ID" value="" title="아이디" placeholder="아이디">
            <br>
            <input class="memberInputBox" type="text" name="name" value="" title="이 름" placeholder="이름">
            <br>
            <input class="memberInputBox" type="text" name="email" value="" title="이메일" placeholder="이메일">
            <br>       
            <input class="memberInputBox" type="text" name="PW" value="" title="비밀번호" placeholder="비밀번호">
            <br>
                <div>
                    <br>
                    <a href="#" class="btn">가입하기</a>
                    <a href="#" class="btn">취소</a>
                </div>
        </div>
    </form>
</body>
</html>