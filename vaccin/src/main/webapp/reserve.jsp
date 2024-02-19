<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="style.css">
<body>
<header><h1>(과정평가형 정보처리산업기사) 백신접종예약 프로그램</h1></header>
	<nav>
	<a href="insert.jsp">백신접종예약</a>
	<a href="reserve.jsp">접종예약조회</a>
	<a href="./reserveCount.jsp">접종인원통계</a>
	<a href="index.jsp">홈으로</a>
	</nav>
<section>
<h2>접종예약조회</h2>
<form action="reserveDB.jsp" name="form"  onsubmit="return check(this)">
			<table border="1">
				<tr>
					<td><h4>예약번호를 입력 하시오</h4></td>
					<td><input name="num">예)20210001</td>
				</tr>
				<tr>
				<td colspan="2" align="center">
					<input type="submit" value="예약조회">
					<input type="button" value="홈으로" onclick="location.href = 'index.jsp'">
				</td>
				</tr>
			</table>
		</form>
	</section>
	
<footer>HRDKIREA Copyright @ 2021 All rights reserved. Human Resources Development Service of Korea</footer>

<script>
	function check(){
		if (form.num.value == "") {
	        alert("예약번호가 입력되지 않았습니다.");
	        form.num.focus();
	        return false;
	    }
		return true;
	}
</script>
</body>
</html>