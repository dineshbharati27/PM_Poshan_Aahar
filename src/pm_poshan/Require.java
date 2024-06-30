package pm_poshan;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Require
 */
public class Require extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Require() {
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
		String ric = request.getParameter("rice");
		String da = request.getParameter("dal");
		String spi = request.getParameter("spices");
		String sal = request.getParameter("salt");
		String oi = request.getParameter("oil");
		String statu = "pending";
		String si = GetSet.getSchool_id();
		String sp_i = "0";
		
		int rice = Integer.parseInt(ric);
		int dal = Integer.parseInt(da);
		int spices  = Integer.parseInt(spi);
		int salt = Integer.parseInt(sal);
		int oil = Integer.parseInt(oi);
		int id = 0;
		Connection con =ConnectDB.connect();
		
		try {
			PreparedStatement ps = con.prepareStatement("insert into requirement values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setInt(2, rice);
			ps.setInt(3, dal);
			ps.setInt(4, spices);
			ps.setInt(5, salt);
			ps.setInt(6, oil);
			ps.setString(7, statu);
			ps.setString(8, si);
			ps.setString(9, sp_i);
			int i = ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("school_success.html");
			}
			else
			{
				response.sendRedirect("school_faied.html");
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
