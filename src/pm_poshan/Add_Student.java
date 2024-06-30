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
 * Servlet implementation class Add_Student
 */
public class Add_Student extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Student() {
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
		String name = request.getParameter("Sname");
		String contact = request.getParameter("contact");
		String Sclass = request.getParameter("class");
		String hei = request.getParameter("height");
		int height = Integer.parseInt(hei);
		String wei = request.getParameter("weight");
		int weight = Integer.parseInt(wei);
		String date = request.getParameter("date");
		String school_id = GetSet.getSchool_id();
		Connection con = ConnectDB.connect();
		try 
		{
			PreparedStatement ps = con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, Sid);
			ps.setString(3, name);
			ps.setString(4, contact);
			ps.setString(5, Sclass);
			ps.setInt(6, height);
			ps.setInt(7, weight);
			ps.setString(8, date);
			ps.setString(9, school_id);
			int i = ps.executeUpdate();
			
			PreparedStatement p = con.prepareStatement("insert into height values(?,?,?,?,?)");
			p.setInt(1, id);
			p.setString(2, Sid);
			p.setInt(3, height);
			p.setInt(4, weight);
			p.setString(5, school_id);
			p.executeUpdate();
			
			if(i>0)
			{
				response.sendRedirect("school_success.html");
			}
			else
			{
				response.sendRedirect("school_failed.html");
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}

}
