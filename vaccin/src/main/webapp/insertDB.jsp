	<%@page import="java.sql.*"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%
	    String resvno = request.getParameter("resvno");
	    String jumin = request.getParameter("jumin");
	    String vcode = request.getParameter("vcode");
	    String hospcode = request.getParameter("hospcode");
	    String resvdate = request.getParameter("resvdate");
	    String resvtime = request.getParameter("resvtime");
	    boolean al = false;
	
	    String checkIfExistsSQL = "SELECT COUNT(*) FROM TBL_VACCRESV_202108 WHERE resvno = ?";
	    String insertSQL = "INSERT INTO TBL_VACCRESV_202108 VALUES(?,?,?,?,?,?)";
	
	    try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	         PreparedStatement checkIfExistsStmt = conn.prepareStatement(checkIfExistsSQL);
	         PreparedStatement insertStmt = conn.prepareStatement(insertSQL)) {
	
	        checkIfExistsStmt.setString(1, resvno);
	        ResultSet rs = checkIfExistsStmt.executeQuery();
	        if (rs.next() && rs.getInt(1) > 0) {
	            al = true;
	        } else {
	            insertStmt.setString(1, resvno);
	            insertStmt.setString(2, jumin);
	            insertStmt.setString(3, vcode);
	            insertStmt.setString(4, hospcode);
	            insertStmt.setString(5, resvdate);
	            insertStmt.setString(6, resvtime);
	            int flag = insertStmt.executeUpdate();
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	
	    if (al) {
	%>
	<script type="text/javascript">
	    alert('이미 해당 예약 번호가 존재합니다.');
	    location.href = 'insert.jsp';
	</script>
	<%
	    } else {
	%>
	<script type="text/javascript">
	    alert('접종예약정보가 등록 되었습니다.');
	    location.href = 'insert.jsp';
	</script>
	<%
	    }
	%>
