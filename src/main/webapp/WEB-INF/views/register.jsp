<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Register Form</title>
		<style>
		.register-form {
			width: 300px;
			margin: 0 auto;
			font-family: Tahoma, Geneva, sans-serif;
		}
		.register-form h1 {
			text-align: center;
			color: #4d4d4d;
			font-size: 24px;
			padding: 20px 0 20px 0;
		}
		.register-form input[type="password"],
		.register-form input[type="password2"],
		.register-form input[type="email"],
		.register-form input[type="text"] {
			width: 100%;
			padding: 15px;
			border: 1px solid #dddddd;
			margin-bottom: 15px;
			box-sizing:border-box;
		}
		.register-form input[type="submit"] {
			width: 100%;
			padding: 15px;
			background-color: #535b63;
			border: 0;
			box-sizing: border-box;
			cursor: pointer;
			font-weight: bold;
			color: #ffffff;
		}
		button {
			width: 100%;
			padding: 15px;
			background-color: #535b63;
			border: 0;
			box-sizing: border-box;
			cursor: pointer;
			font-weight: bold;
			color: #ffffff;
		}
		</style>
	</head>
	<body>
		<div class="register-form">
			<h1>register Form</h1>
			<form action="/register" method="POST">
				<input type="text" name="username" placeholder="Username" required>
				<input type="password" name="password" placeholder="Password" required>
				<input type="password" name="password2" placeholder="Password" required>
				<input type="email" name="email" placeholder="email" required>
				<input type="submit" value="Register">
			</form>
			<p>
			<a href="/"><button>Goto Login</button></a>
			<p>
			<a href="guest.html"><button>For Guest Only</button></a>
		</div>
	</body>
</html>