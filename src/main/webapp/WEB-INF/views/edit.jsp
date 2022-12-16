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
                <h1>${title} 레시피 수정</h1>
            </div>
                <table>
					<thead>
						<tr>
							<th>재료</th>
							<th>양</th>
                            <th></th>
                            <th></th>
						</tr>
					</thead>
					<tbody>
                        <c:forEach var="r" items="${recipelist}" varStatus="status">
                        <tr>
                            <form method="post" action="/MIXtory/search/${title}/edit/${r.rcp_id}">
                                <td class="center_cell"><input type="text" name="rcp_igdCategory" value="${r.rcp_igdCategory}"/></td>
                                <td class="center_cell"><input type="text" name="rcp_amount" value="${r.rcp_amount}"/></td>
                                <td class="center_cell"><input type="submit" value="수정"/></td>
                            </form>
                            <td class="center_cell"><button class="btn_edit"><a href="/MIXtory/search/${title}/edit/${r.rcp_id}/delete">삭제</a></button></td>
                        </tr>
                        </c:forEach>
                        <tr>
                            <form action="/MIXtory/search/${title}/edit/add" method="post">
                                <td class="center_cell"><input type="text" name="rcp_igdCategory"/></td>
                                <td class="center_cell"><input type="text" name="rcp_amount"/></td>
                                <td class="center_cell"><input type="submit" value="추가"/></td>
                            </form>
                            <td class="center_cell"><button class="btn_edit"><a href="/MIXtory/search/${title}">완료</a></button></td>
                        </tr>
					</tbody>
				</table>
            </form>
        </section>
    </main>
    <footer>
        footer
    </footer>
</body>
</html>