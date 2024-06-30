<%@page import="pm_poshan.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%
		Connection con = ConnectDB.connect();
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		String status = "approved";
		try
		{
			PreparedStatement ps = con.prepareStatement("update requirement set status = ? where id = ?");
			ps.setString(1, status);
			ps.setInt(2,id);
			int i = ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("supplier_requirement.jsp");
			}
			else
			{
				response.sendRedirect("supplier_dashboard.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	%>
</body>
</html>