<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>MIXtory</title>
	<style>
		:root {
			--main: #060606;
			--light: #888;
			--bgcolor: #f2f4f7;
		}
		a {
			text-decoration: none; /* 기본 밑줄을 제거합니다 */
			color: var(--main);
		}
		@font-face {
			font-family: 'Belleza';
			src: url('https://fonts.googleapis.com/css2?family=Belleza&display=swap');
			font-weight: normal;
			font-style: normal;
		}
		* {
			box-sizing: border-box;
		}
		body {
			margin: 0;
			background-color: var(--bgcolor);
			font-family: 'Belleza';
			letter-spacing: -1px;
		}
		.login-form {
			width: 300px;
			margin: 0 auto;
		}
		.login-form .title {
			width: 300px;
			margin: 20px 0 20px 0;
			font-size: 32px;
			font-weight: bold;
		}
		.login-form .title h1 {
			text-align: center;
			color: var(--main);
		}
		.login-form input[type="password"],
		.login-form input[type="text"] {
			width: 100%;
			padding: 15px;
			border: 1px solid #dddddd;
			margin-bottom: 15px;
			box-sizing:border-box;
		}
		.login-form input[type="submit"] {
			width: 100%;
			padding: 15px;
			background-color: var(--main);
			border: 0;
			box-sizing: border-box;
			cursor: pointer;
			font-weight: bold;
			color: var(--bgcolor);
		}
		button {
			width: 100%;
			padding: 15px;
			background-color: var(--main);
			border: 0;
			box-sizing: border-box;
			cursor: pointer;
			font-weight: bold;
			color: var(--bgcolor);
		}
	</style>
</head>
<body>
<div class="login-form">
	<div class="title">
		<h1><a href="/MIXtory">MIXtory</a></h1>
	</div>
	<form method="POST">
		<input type="text" name="user_name" placeholder="Username" required>
		<input type="password" name="user_passwd" placeholder="Password" required>
		<input type="submit" value="로그인">
	</form>
	<p>
		<a href="register.jsp"><button>회원가입</button></a>
</div>
</body>
</html>