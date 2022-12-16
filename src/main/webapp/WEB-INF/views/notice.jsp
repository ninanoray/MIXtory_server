<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
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
            <div>
                공지사항
            </div>
        </section>
    </main>
    <footer>
        footer
    </footer>
</body>
</html>