<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String num = request.getParameter("num");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String sql = "SELECT j.pname AS 이름, j.jumin AS 주민번호,CASE WHEN SUBSTR(j.jumin, 8, 1) = '1' THEN '남' WHEN SUBSTR(j.jumin, 8, 1) = '2' THEN '여' ELSE NULL END AS 성별, j.tel AS 전화번호, v.resvdate AS 예약일자, v.resvtime AS 예약시간, h.hospname AS 병원명, h.hosptel AS 대표전화번호, h.hospaddr AS 병원주소, v.vcode AS 백신종류 FROM tbl_jumin_201808 j JOIN TBL_VACCRESV_202108 v ON j.jumin = v.jumin JOIN tbl_hosp_202108 h ON v.hospcode = h.hospcode WHERE v.resvno = ?";
    try {
        if (num != null && !num.isEmpty()) {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, num);

            rs = stmt.executeQuery();
        }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>접종예약 조회</title>
</head>
<link rel="stylesheet" type="text/css" href="./style.css">
<body>
<header>
    <h1>(과정평가형 정보처리산업기사) 백신접종예약 프로그램</h1>
</header>
<nav>
    <a href="./insert.jsp">백신접종예약</a>
    <a href="./reserve.jsp">접종예약조회</a>
    <a href="./reserveCount.jsp">접종인원통계</a>
    <a href="./index.jsp">홈으로</a>
</nav>
<section>
    <% if(rs.next()){ %>
    <div class="h1_middle">
    <h1>예약번호: <%= num %>의 접종예약조회</h1>
    </div>
    <table border="1">
        <tr>
            <td><h4>이름</h4></td>
            <td><h4>주민번호</h4></td>
            <td><h4>성별</h4></td>
            <td><h4>전화번호</h4></td>
            <td><h4>예약일자</h4></td>
            <td><h4>예약시간</h4></td>
            <td><h4>병원명</h4></td>
            <td><h4>대표전화</h4></td>
            <td><h4>병원주소</h4></td>
            <td><h4>백신종류</h4></td>
        </tr>
        <tr>
            <td><%= rs.getString("이름") %></td>
            <td><%= rs.getString("주민번호") %></td>
            <td><%= rs.getString("성별") %></td>
            <td><%= rs.getString("전화번호") %></td>
            <td><%= rs.getString("예약일자") %></td>
            <td><%= rs.getString("예약시간") %></td>
            <td><%= rs.getString("병원명") %></td>
            <td><%= rs.getString("대표전화번호") %></td>
            <td><%= rs.getString("병원주소") %></td>
            <td><%= rs.getString("백신종류") %></td>
        </tr>
    </table>
    <div class="dd">
    <input type="button" onclick="location.href = 'reserve.jsp'" value="돌아가기" class="bt">
    </div>
    <%} else { %>
    <h2>접종예약정보가 존재하지 않습니다.</h2>
    <div class="dd">
    
    <input type="button" onclick="location.href = 'reserve.jsp'" value="돌아가기" class="bt">
    </div>
    <%} %>
</section>
<footer>HRDKIREA Copyright @ 2021 All rights reserved. Human Resources Development Service of Korea</footer>
</body>
<script>
</script>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if(stmt != null) stmt.close();
        if(conn != null) conn.close();
    }
%>
