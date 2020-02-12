package user.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DbConnectionService;
import user.dto.UserDto;

public class UserDao {
	public UserDto findByUserNameAndPassword(String userName, String password) {
		Connection con=DbConnectionService.getConnection();
		String sql = "select * from user where user_name=? and password=?";
		UserDto user = null;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userName);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
			  	user = new UserDto();
			  	user.setEmail(rs.getString("email"));
			  	user.setUserName(rs.getString("user_name"));
			  	user.setUserId(rs.getLong("id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	public boolean create(String email,String password) {
		boolean isCreated = false;
		try {
			String sql="insert into user(user_name,email,password) values(?,?,?)";
			Connection con=DbConnectionService.getConnection();
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,email);
			ps.setString(3, password);
			isCreated=ps.executeUpdate()>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isCreated;
	}
	public boolean isEmailAlreadyExists(String email) {
		boolean isExists = false;
		try {
			String sql="select count(id) as count from user where email=?";
			Connection con=DbConnectionService.getConnection();
			PreparedStatement ps= con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				isExists = rs.getInt("count")>0?true:false;			
			}
		}catch(Exception e) {
		  e.printStackTrace();	
		}
		return isExists;
	}

}
