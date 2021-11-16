package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ReplyDTO;

public class ReplyDAO extends JdbcDAO {
	private static ReplyDAO _dao;

	public ReplyDAO() {
		// TODO Auto-generated constructor stub
	}

	static {
		_dao = new ReplyDAO();
	}

	public static ReplyDAO getDAO() {
		return _dao;
	}

	public int insertReply(ReplyDTO reply) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "insert into Reply values('REPLY' || TO_CHAR(reply_seq.nextval),?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reply.getPost_idx());
			pstmt.setString(2, reply.getEmail());
			pstmt.setString(3, reply.getContent());	
			
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Reply 테이블 insert 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int updateReply(ReplyDTO reply) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update Reply set post_idx = ?, email = ?"
					+ ", content = ?, replied_date = ? where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reply.getPost_idx());
			pstmt.setString(2, reply.getEmail());
			pstmt.setString(3, reply.getContent());
			pstmt.setString(4, reply.getReplied_date());
			pstmt.setString(5, reply.getIdx());

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Reply 테이블 update 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int deleteReply(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "delete from Reply where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Reply 테이블 delete 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// select post_idx
	public ReplyDTO selectReply(String post_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReplyDTO reply = null;
		try {
			con = getConnection();

			String sql = "select * from Reply where post_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, post_idx);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				reply = new ReplyDTO();
				reply.setIdx(rs.getString("idx"));
				reply.setPost_idx(rs.getString("post_idx"));
				reply.setEmail(rs.getString("email"));
				reply.setContent(rs.getString("content"));
				reply.setReplied_date(rs.getString("replied_date"));
			}
		} catch (SQLException e) {
			System.out.println("Reply 테이블 select 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return reply;
	}

	// select 특수 문자열
	public List<ReplyDTO> selectAllReplyContentList(String content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		try {
			con = getConnection();

			String sql = "select * from Reply where content like '%'||?||'%' order by replied_date desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReplyDTO reply = new ReplyDTO();
				reply.setIdx(rs.getString("idx"));
				reply.setPost_idx(rs.getString("post_idx"));
				reply.setEmail(rs.getString("email"));
				reply.setContent(rs.getString("content"));
				reply.setReplied_date(rs.getString("replied_date"));
				list.add(reply);
			}
		} catch (SQLException e) {
			System.out.println("Reply 테이블 selectContent 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
}

