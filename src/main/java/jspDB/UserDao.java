package jspDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
	private Connection conn;
	private static UserDao instance;
	
	
	public UserDao() {
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String user = "root";
			String pass = "1111";
			String dbURL = "jdbc:mysql://localhost:3306/friend?serverTimezone=Asia/Seoul";

			Class.forName(driver);
			conn = DriverManager.getConnection(dbURL, user, pass);
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public static UserDao getInstance() {
		if (instance == null)
			instance = new UserDao();
		return instance;
	}

	public boolean insertMember(Member member) {
		PreparedStatement pstmt = null;
		System.out.println(member.getId());
		try {
			String sql = "insert into members values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return true;
	}

	public void updateMember(Member member) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update members set name=?where id=?");
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	public Member selectOne(String id) {
		Member mem = new Member();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from members where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mem.setId(rs.getString("id"));
				mem.setPw(rs.getString("pw"));
				mem.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return mem;

	}
	
	
	public List<Member> selectAll(){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement("select * from members");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member member = new Member();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				list.add(member);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(rs != null)
					rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

}
