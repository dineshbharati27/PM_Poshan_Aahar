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
		String Sid = request.getParameter("Sid");
		Connection con = ConnectDB.connect();
		try
		{
			PreparedStatement ps = con.prepareStatement("select * from supplier where Sid = ?");
			ps.setString(1, Sid);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				PreparedStatement ps1 = con.prepareStatement("delete from supplier where Sid = ?");
				ps1.setString(1, Sid);
				int i = ps1.executeUpdate();
				if(i>0)
				{
					response.sendRedirect("view_supplier.jsp");
				}
				else
				{
					response.sendRedirect("Admin_Dashboard.html");
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>

</body>
</html>