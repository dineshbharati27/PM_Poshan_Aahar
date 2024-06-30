package pm_poshan;
import java.sql.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Add_Complaint
 */
public class Add_Complaint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Complaint() {
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
		int id = 0 ;
		String S_id = GetSet.getSchool_id();
		String status = "pending";
		String supplier_id = request.getParameter("Sid");
		String complaint = request.getParameter("complaint");
		
		
		Connection con = ConnectDB.connect();
		
		try 
		{
			PreparedStatement ps = con.prepareStatement("insert into complaint values(?,?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, complaint);
			ps.setString(3, S_id);
			ps.setString(4, supplier_id);
			ps.setString(5, status);
			int i = ps.executeUpdate();
			System.out.println(supplier_id);
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
