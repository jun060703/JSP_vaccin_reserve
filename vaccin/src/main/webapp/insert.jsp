<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="./style.css">
<body>
<header><h1>(과정평가형 정보처리산업기사) 백신접종예약 프로그램</h1></header>
	<nav>
	<a href="./insert.jsp">백신접종예약</a>
	<a href="./reserve.jsp">접종예약조회</a>
	<a href="./reserveCount.jsp">접종인원통계</a>
	<a href="./index.jsp">홈으로</a>
	</nav>
<section>
<h2>백신접종예약</h2>
<form action="./insertDB.jsp" name="mform" onsubmit="return check(this)">
			<table border="1">
				<tr>
					<td><h4>접종예약번호</h4></td>
					<td><input name="resvno">예)20210001</td>
				</tr>
				<tr>
					<td><h4>주민번호</h4></td>
					<td><input name="jumin">예)710101 - 1000001</td>
				</tr>
				<tr>
					<td><h4>백신코드</h4></td>
					<td><input name="vcode">예)V001~V003</td>
				</tr>
				<tr>
					<td><h4>병원코드</h4></td>
					<td><input name="hospcode">예)H001</td>
				</tr>
				<tr>
					<td><h4>예약일자</h4></td>
					<td><input name="resvdate">예)20211231</td>
				</tr>
				<tr>
					<td><h4>예약시간</h4></td>
					<td><input name="resvtime">예)1230</td>
				</tr>
				<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
					<input type="reset" onclick="re()" value="다시쓰기">
				</td>
				</tr>
			</table>
		</form>
	</section>
	
<footer>HRDKIREA Copyright @ 2021 All rights reserved. Human Resources Development Service of Korea</footer>
</body>
<script>

function check() {
    if (mform.resvno.value == "") {
        alert("접종예약번호가 입력되지 않았습니다.");
        mform.resvno.focus();
        return false;
    }
    if (mform.jumin.value == "") {
        alert("주민번호가 입력되지 않았습니다.");
        mform.jumin.focus();
        return false;
    }
    if (mform.vcode.value == "") {
        alert("백신코드가 입력되지 않았습니다.");
        mform.vcode.focus();
        return false;
    }
    if (mform.hospcode.value == "") {
        alert("병원코드가 입력되지 않았습니다.");
        mform.hospcode.focus();
        return false;
    }
    if (mform.resvdate.value == "") {
        alert("예약일자가 입력되지 않았습니다.");
        mform.resvdate.focus();
        return false;
    }
    if (mform.resvtime.value == "") {
        alert("예약시간이 입력되지 않았습니다.");
        mform.resvtime.focus();
        return false;
    }
    return true;
}
function re(){
	alert("다 지워집니다.")
}
</script>

</html>
