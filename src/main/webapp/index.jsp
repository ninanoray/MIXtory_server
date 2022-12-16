<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<head>
	<title>MIXtory</title>
	<link rel='stylesheet' type='text/css' media='screen' href='resources/static/index.css'>
	<script src='resources/static/index.js'></script>
</head>
<body>
<header>
	<div>
		<nav>
			<div class="img_logo">
				<a href="/MIXtory">MIXtory</a>
			</div>
			<div class="nav_items">
				<ul>
					<li><a href="search">칵테일 검색</a></li>
					<li><a href="minibar">나만의 미니바</a></li>
					<li><a href="community">커뮤니티</a></li>
					<li><a href="notice">공지사항</a></li>
				</ul>
			</div>
			<div class="login">
				<%
					String userId = null;

					if (session.getAttribute("user_id") != null) {
						userId = (String) session.getAttribute("user_id");
					}

					if(userId == null){
				%>
					<a href="login">로그인</a>
				<% } else { %>
					<a href="logout">로그아웃</a>
				<% } %>
			</div>
		</nav>
		<div>
			<div class="headline">
				<h1>당신을 위한<br>특별한 칵테일을 찾으세요</h1>
			</div>

			<button class="btn_header"><a href="/MIXtory/search">찾아보기</a></button>
		</div>
	</div>
</header>
<main>
	<div>
		<div class="main_title">
			<h1>카테고리</h1>
		</div>
		<div class="main_categories">
			<div class="category_container">
				<figure>
					<a><img src="resources/static/images/gimlet.jpg" alt="jin" id="cat_img_jin" class="category_img"></a>
					<figcaption>Gin</figcaption>
					<button><a href="/search/gin">진 바로가기</a></button>
				</figure>

			</div>
			<div class="category_container">
				<figure>
					<a><img src="resources/static/images/mojito2.jpg" alt="rum" id="cat_img_rum" class="category_img"></a>
					<figcaption>Rum</figcaption>
				</figure>
			</div>
			<div class="category_container">
				<figure>
					<a><img src="resources/static/images/sunrise.jpg" alt="tequila" id="cat_img_tequila" class="category_img"></a>
					<figcaption>Tequila</figcaption>
				</figure>
			</div>
			<div class="category_container">
				<figure>
					<a><img src="resources/static/images/martini.jpg" alt="vodka" id="cat_img_vodka" class="category_img"></a>
					<figcaption>Vodka</figcaption>
				</figure>
			</div>
			<div class="category_container">
				<figure>
					<a><img src="resources/static/images/manhattan.jpg" alt="whiskey" id="cat_img_whiskey" class="category_img"></a>
					<figcaption>Whiskey</figcaption>
				</figure>
			</div>
		</div>
	</div>
</main>
<footer>
	footer
</footer>
</body>
</html>