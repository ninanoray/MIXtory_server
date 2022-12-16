<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>MIXtory</title>
    <link rel='stylesheet' type='text/css' media='screen' href='resources/static/search.css'>
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
        </section>
    </header>
    <main>
        <section>
            <div class="title">
                <h1>칵테일 리스트</h1>
            </div>
            <table>
                <thead>
                <tr>
                    <th>칵테일 이름</th>
                    <th>영문 이름</th>
                    <th>조주기법</th>
                    <th>레시피 보기</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="c" items="${cocktailist}">
                    <tr>
                        <td>${c.cocktail_name}</td>
                        <td>${c.cocktail_enname}</td>
                        <td class="center_cell">${c.cocktail_method}</td>
                        <td class="center_cell"><a href="search/${c.cocktail_name}">보기</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <% if(userId != null) { %>
                <div>
                    <button class="btn_edit"><a href="/MIXtory/search/insert">칵테일 추가</a></button>
                </div>
            <% } %>
        </section>
    </main>
    <footer>
        footer
    </footer>
</body>
</html>