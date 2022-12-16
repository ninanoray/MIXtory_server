<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                        } else {
                            PrintWriter script = response.getWriter();
                            script.println("<script>");
                            script.println("alert('아이디를 확인해주세요.')");
                            script.println("location.href = './login'");
                            script.println("</script>");
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
                <h1>나만의 미니바</h1>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제품명</th>
                        <th>타입</th>
                        <th>카테고리</th>
                        <th>구매링크</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="i" items="${igdlist}">
                    <tr>
                        <td class="center_cell">${i.igd_id}</td>
                        <td>${i.igd_name}</td>
                        <td class="center_cell">${i.igd_type}</td>
                        <td>${i.igd_category}</td>
                        <td><a href="${i.igd_url}">${i.igd_name} 구매링크</a> </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </section>
    </main>
    <footer>
        footer
    </footer>
</body>
</html>