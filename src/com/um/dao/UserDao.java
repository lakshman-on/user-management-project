package com.um.dao;

import java.sql.*;
import java.util.ArrayList;

import com.um.model.User;

public class UserDao {
	private static String url = "jdbc:mysql://localhost:3306/lakshman";
	private static String user = "root";
	private static String pw = "admin";
	private static String insert = "insert into user(name,email,city) values(?,?,?);";
	private static String display = "SELECT * FROM user;";
	private static String delete = "DELETE FROM user WHERE id = ?";
	private static String selectUserById = "SELECT * FROM user WHERE id = ?";
	private static String update = "UPDATE user SET name = ?,email = ?,city = ? WHERE id = ?;";
	private static Connection con = null;
	private static PreparedStatement ps = null;
	private static Statement s = null;
	private static ResultSet rs = null;
	
	//inserting data from userform to user table
	public static void insert(User u) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(insert);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getCity());
			ps.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	
	public static ArrayList<User> displayUserDetails() {
		ArrayList<User> al = new ArrayList<User>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pw);
			s = con.createStatement();
			rs = s.executeQuery(display);
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String city = rs.getString("city");
				User u = new User(id, name, email, city);
				al.add(u);
				
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
				s.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return al;
		
	}


	public static void delete(int id) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(delete);
			ps.setInt(1,id);
			ps.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


	public static User selectUserById(int id1) {
		User u = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(selectUserById);
			ps.setInt(1,id1);
			rs  = ps.executeQuery();
			rs.next();
			int id = rs.getInt("id");
			String name = rs.getString("name");
			String email = rs.getString("email");
			String city = rs.getString("city");
			u = new User(id, name, email, city);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				ps.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return u;
	}


	public static void updateUser(User u) {
		
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection(url, user, pw);
				ps = con.prepareStatement(update);
				ps.setString(1, u.getName());
				ps.setString(2, u.getEmail());
				ps.setString(3, u.getCity());
				ps.setInt(4, u.getId());
				ps.executeUpdate();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					con.close();
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	}
}
