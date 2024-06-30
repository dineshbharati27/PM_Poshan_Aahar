package pm_poshan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class add_Supplier
 */
public class add_Supplier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add_Supplier() {
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
			PreparedStatement ps = con.prepareStatement("insert into supplier values(?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, Sid);
			ps.setString(3, Sname);
			ps.setString(4, password);
			ps.setString(5, location);
			ps.setString(6, admin);
			int i = ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("Admin_Dashboard.html");
			}
			else
			{
				response.sendRedirect("add_supplier.htm;");
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

}
