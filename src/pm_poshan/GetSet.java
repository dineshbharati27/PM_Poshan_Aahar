package pm_poshan;

public class GetSet {
	public static String admin;
	public static String School_id;
	public static String student_id;
	public static String supplier_id;
	public static int i;
	
	public static int getI() {
		return i;
	}

	public static void setI(int i) {
		GetSet.i = i;
	}

	public static String getsupplier_id() {
		return supplier_id;
	}

	public static void setsupplier_id(String supplier_id) {
		GetSet.supplier_id = supplier_id;
	}
	
	public static String getstudent_id() {
		return student_id;
	}

	public static void setstudent_id(String student_id) {
		GetSet.student_id = student_id;
	}
	
	public static String getSchool_id() {
		return School_id;
	}

	public static void setSchool_id(String School_id) {
		GetSet.School_id = School_id;
	}

	public static String getadmin() {
		return admin;
	}

	public static void setadmin(String admin) {
		GetSet.admin = admin;
	}
}
