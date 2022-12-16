<%@ page import="java.io.PrintWriter" %>
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
                <h1>${title}</h1>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>재료</th>
                        <th>양(ml)</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="r" items="${recipelist}" varStatus="status">
                    <tr>
                        <td class="center_cell">${status.count}</td>
                        <td class="center_cell">${r.rcp_igdCategory}</td>
                        <td class="center_cell">${r.rcp_amount}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <% if(userId != null) { %>
                <div>
                    <button class="btn_edit"><a href="${title}/edit">정보 수정</a></button>
                    <button class="btn_edit"><a href="${title}/delete">칵테일 삭제</a></button>
                    <button class="btn_edit"><a href="/MIXtory/like/${title}">❤️</a></button>
                </div>
            <% } %>
        </section>
    </main>
    <footer>
        footer
    </footer>
</body>
</html>