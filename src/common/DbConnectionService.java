package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnectionService {
	public static Connection getConnection()  {
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+DbConstant.DB_NAME,DbConstant.USER_NAME,DbConstant.PASSWORD);
		} catch (SQLException | ClassNotFoundException e) {
			//throw new RuntimeException("Db connection failed");
			System.out.println(e);
		}
		return con;
	}
}
