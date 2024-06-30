package pm_poshan;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Add_School
 */
public class Add_School extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_School() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		int id = 0;
		String Sid = request.getParameter("Sid");
		String Sname = request.getParameter("Sname");
		String password = request.getParameter("password");
		String location = request.getParameter("location");
		String admin = "admin@gmail.com";
		
		
		Connection con = ConnectDB.connect();
		
		try
		{
			PreparedStatement ps1= con.prepareStatement("select * from school where Sid =?");
			ps1.setString(1, Sid);
			ResultSet rs1 = ps1.executeQuery();
			if(rs1.next())
			{
				response.sendRedirect("failed.html");
			}
			else
			{
				PreparedStatement ps = con.prepareStatement("insert into school values(?,?,?,?,?,?)");
				ps.setInt(1, id);
				ps.setString(2, Sid);
				ps.setString(3, Sname);
				ps.setString(4, password);
				ps.setString(5, location);
				ps.setString(6, admin);
				int i = ps.executeUpdate();
				if(i>0)
				{
					response.sendRedirect("success.html");
				}
				else
				{
					response.sendRedirect("failed.html");
				}
			}	
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
