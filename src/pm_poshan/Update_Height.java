package pm_poshan;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Update_Height
 */
public class Update_Height extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_Height() {
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
		String S_id = GetSet.getSchool_id();
		String sid = request.getParameter("Sid");
		String hei = request.getParameter("height");
		String wei = request.getParameter("weight");
		
		int height = Integer.parseInt(hei);
		int weight = Integer.parseInt(wei);
		
		Connection con = ConnectDB.connect();
		
		try {
			PreparedStatement ps = con.prepareStatement("update student set height = ?,weight=? where Sid = ?");
			ps.setInt(1, height);
			ps.setInt(2, weight);
			ps.setString(3, sid);
			int i = ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("school_success.html");
			}
			else
			{
				response.sendRedirect("school_failed.html");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
