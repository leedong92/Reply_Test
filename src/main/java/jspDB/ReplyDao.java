package jspDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReplyDao {
	private Connection conn;
	private static ReplyDao instance;

	public ReplyDao() {
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

	public static ReplyDao getInstance() {
		if (instance == null)
			instance = new ReplyDao();
		return instance;
	}

	public void insertReply(Reply reply) {
		PreparedStatement pstmt = null;
		try {
			String query = "insert into reply(id, boardid, contents) value (?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reply.getId());
			pstmt.setString(2, reply.getBoardid());
			pstmt.setString(3, reply.getContents());
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

	public void updateReply(Reply reply) {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("update reply set name =?, id = ?");
			pstmt.setString(1, reply.getName());
			pstmt.setString(2, reply.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public Reply selectOne(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Reply reply = new Reply();

		try {
			pstmt = conn.prepareStatement("select * from reply where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				reply.setId(rs.getString("id"));
				reply.setBoardid(rs.getString("boardid"));
				reply.setContents(rs.getString("contents"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return reply;
	}

	public List<Reply> selectAll(String id) {
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<Reply> list = new ArrayList<Reply> ();
	      
	      try {
	         pstmt = conn.prepareStatement("select * from reply where id=?");
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            Reply reply = new Reply();
	            reply.setId(rs.getString("id"));
	            reply.setBoardid(rs.getString("boardid"));
	            reply.setContents(rs.getString("contents"));
	            list.add(reply);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      finally {
	         try {
	            if (pstmt != null)
	               pstmt.close();
	            if (rs != null)
	               rs.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return list;
	   }


	public int wirte(String id, String boardid, String contents) {
		String sql = "insert into reply values(?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, boardid);
			pstmt.setString(3, contents);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
