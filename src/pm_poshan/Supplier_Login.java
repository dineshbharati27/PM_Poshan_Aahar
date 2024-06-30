package pm_poshan;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Supplier_Login
 */
public class Supplier_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Supplier_Login() {
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
		
		String Sid = request.getParameter("Sid");
		String password = request.getParameter("password");
		Connection con = ConnectDB.connect();
		try 
		{
			PreparedStatement ps = con.prepareStatement("select * from supplier where Sid = ? and password = ?");
			ps.setString(1, Sid);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				GetSet.setsupplier_id(Sid);
				response.sendRedirect("supplier_dashboard.html");
			}
			else
			{
				response.sendRedirect("failed_login.html");
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}

}
