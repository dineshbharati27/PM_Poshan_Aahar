package pm_poshan;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Update_Student
 */
public class Update_Student extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_Student() {
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
		String id = GetSet.getstudent_id();
		String cont = request.getParameter("contact");
		String Sclass = request.getParameter("class");
		String hei = request.getParameter("height");
		int height = Integer.parseInt(hei);
		
		String wei = request.getParameter("weight");
		int weight = Integer.parseInt(wei);
		
		Connection con = ConnectDB.connect();
		try {
			PreparedStatement ps = con.prepareStatement("update student set contact = ?,class =?,height = ?,weight = ? where Sid = ?");
			ps.setString(1, cont);
			ps.setString(2, Sclass);
			ps.setInt(3, height);
			ps.setInt(4, weight);
			ps.setString(5, id);
			int i = ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("school_success.html");
			}
			{
				response.sendRedirect("school_failed.html");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
