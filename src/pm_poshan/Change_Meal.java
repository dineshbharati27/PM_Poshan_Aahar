package pm_poshan;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Change_Meal
 */
public class Change_Meal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Change_Meal() {
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
		
		String ri = request.getParameter("rice");
		String da = request.getParameter("dal");
		String spi = request.getParameter("spices");
		String sal = request.getParameter("salt");
		String oi = request.getParameter("oil");
		int id = 1;
		int Rice = Integer.parseInt(ri);
		int dal = Integer.parseInt(da);
		int spices = Integer.parseInt(sal);
		int salt = Integer.parseInt(sal);
		int oil = Integer.parseInt(oi);
		
		Connection con = ConnectDB.connect();
		try {
			PreparedStatement ps = con.prepareStatement("update meal set rice=?,dal=?,spices=?,salt=?,oil=? where id=?");
			ps.setInt(1, Rice);
			ps.setInt(2, dal);
			ps.setInt(3, spices);
			ps.setInt(4, salt);
			ps.setInt(5, oil);
			ps.setInt(6, id);
			
			int i = ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("success.html");
			}
			else
			{
				response.sendRedirect("failed.html");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
