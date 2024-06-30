package pm_poshan;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {
	
	static Connection co = null;

	public static Connection connect() {
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			co = DriverManager.getConnection("jdbc:mysql://localhost:3306/pm_poshan_aahar", "root", "");
			
		}
		catch(Exception e)
		{
			System.out.println("Something Went Wrong..!!");
			e.printStackTrace();
		}
		return co;
	}
}
