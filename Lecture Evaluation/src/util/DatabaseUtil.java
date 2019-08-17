package util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	
	
	/**
	 * 디비접속정보를 취득히는 메소드
	 * @param dbInfo 디비접속정보
	 * @return
	 * @throws Exception
	 */
	public static Connection getConnection() {
		try {
	// DB접속정보 설정(로그인정보)
	Class.forName("com.mysql.jdbc.Driver");
	String dbURL = "jdbc:mysql://35.194.124.28/mysql";
	String dbID = "admin";
	String dbpassword = "1234";
	return DriverManager.getConnection(dbURL, dbID, dbpassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	return null;
	
	}

}
