<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String sql = "select h.hospcode, h.hospname, count(v.resvno) as resv_count " +
                 "from tbl_hosp_202108 h " +
                 "inner JOIN tbl_vaccresv_202108 v on h.hospcode = v.hospcode " +
                 "group by h.hospcode, h.hospname " +
                 "order by h.hospcode";

    try {
        Class.forName("oracle.jdbc.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();
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
        <div class="h1_middle">
            <h1>병원별 접종건수 통계</h1>
        </div>
        <table border="1">
            <tr>
                <th>병원코드</th>
                <th>병원명</th>
                <th>접종건수</th>
            </tr>
            <% 
                int sum = 0;
                while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("hospcode") %></td>
                <td><%= rs.getString("hospname") %></td>
                <td><%= rs.getInt("resv_count") %></td>
            </tr>
            <% 
            sum += rs.getInt("resv_count");
                } 
            %>
            <tr>
                <td><h4></h4></td>
                <td><h4>총 누계</h4></td>
                <td><%=sum %></td>
            </tr>
        </table>
    </section>
    <footer>HRDKIREA Copyright @ 2021 All rights reserved. Human
        Resources Development Service of Korea</footer>
</body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) rs.close();
        if(stmt != null) stmt.close();
        if(conn != null) conn.close();
    }
%>
