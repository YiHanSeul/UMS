<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script>
	
</script>
</head>
<body>
<h1>게시판 목록</h1>
	<table border="1">
		<thead>
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>내용</td>
				<td>작성일자</td>
			</tr>
		<tbody>
			<c:forEach items="${view}" var="view" varStatus="i">
				<tr>
					<td>
						<c:out value="${view.bno}"></c:out>
					</td>
					<td>
						<c:out value="${view.title}"></c:out>
					</td>
					<td>
						<c:out value="${view.writer}"></c:out>
					</td>
					<td>
						<c:out value="${view.content}"></c:out>
					</td>
					<td>
						<c:out value="${view.regdate}"></c:out>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>