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
			String sid = request.getParameter("Sid");
			int id = Integer.parseInt(sid);
			Connection con = ConnectDB.connect();
			try
			{
				PreparedStatement ps = con.prepareStatement("delete from requirement where id = ?");
				ps.setInt(1, id);
				int i = ps.executeUpdate();
				if(i>0)
				{
					response.sendRedirect("school_success.html");
				}
				else
				{
					response.sendRedirect("school_failed.html");
				}
						
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		%>
		
</body>
</html>