<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>MIXtory</title>
    <link rel='stylesheet' type='text/css' media='screen' href='/MIXtory/resources/static/search.css'>
</head>
<body>
    <header>
        <section>
            <nav>
                <div class="img_logo">
                    <a href="/MIXtory">MIXtory</a>
                </div>
                <div class="nav_items">
                    <ul>
                        <li><a href="/MIXtory/search">칵테일 검색</a></li>
                        <li><a href="/MIXtory/minibar">나만의 미니바</a></li>
                        <li><a href="/MIXtory/community">커뮤니티</a></li>
                        <li><a href="/MIXtory/notice">공지사항</a></li>
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
                    <a href="/MIXtory/login">로그인</a>
                    <% } else { %>
                    <a href="/MIXtory/logout">로그아웃</a>
                    <% } %>
                </div>
            </nav>
        </section>
    </header>
	<main>
        <section>
            <div class="title">
                <h1>칵테일 정보 입력</h1>
            </div>
            <form method="post">
				<table>
					<thead>
						<tr>
							<th>이름</th>
							<th>영문이름</th>
							<th>기법</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="center_cell"><input type="text" name="cocktail_name"/></td>
							<td class="center_cell"><input type="text" name="cocktail_enname"/></td>
							<td class="center_cell"><input type="text" name="cocktail_method"/></td>
						</tr>
					</tbody>
				</table>
                <div class="center_div">
                    <input type="submit" value="등록"/>
                </div>
			</form>
		</section>
	</main>
	
</body>
</html>