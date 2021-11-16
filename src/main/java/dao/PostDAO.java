package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.PostDTO;

public class PostDAO extends JdbcDAO {
	private static PostDAO _dao;

	public PostDAO() {
		// TODO Auto-generated constructor stub
	}

	static {
		_dao = new PostDAO();
	}

	public static PostDAO getDAO() {
		return _dao;
	}

	public int insertPost(PostDTO post) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			String sql = "";
			if (post.getKinds_post().equals("NOTICE")) {
				sql = "insert into Post (idx, kinds_post, email, product_idx, title, content, img_source, posted_date)"
						+ " values(? ||'_'|| TO_CHAR(notice_seq.nextval),?,?,?,?,?,?,sysdate)";
			} else if(post.getKinds_post().equals("QUESTION")) {
				sql = "insert into Post (idx, kinds_post, email, product_idx, title, content, img_source, posted_date)"
						+ " values(? ||'_'|| TO_CHAR(question_seq.nextval),?,?,?,?,?,?,sysdate)";
			} else if(post.getKinds_post().equals("REVIEW")) {
				sql = "insert into Post (idx, kinds_post, email, product_idx, title, content, img_source, posted_date)"
						+ " values(? ||'_'|| TO_CHAR(review_seq.nextval),?,?,?,?,?,?,sysdate)";
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, post.getKinds_post().substring(0,2));
			pstmt.setString(2, post.getKinds_post());
			pstmt.setString(3, post.getEmail());
			pstmt.setString(4, post.getProduct_idx());
			pstmt.setString(5, post.getTitle());
			pstmt.setString(6, post.getContent());
			pstmt.setString(7, post.getImg_source());

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Post 테이블 insertPost 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int updatePost(PostDTO post) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update Post set title = ?, content = ? where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, post.getTitle());
			pstmt.setString(2, post.getContent());
			pstmt.setString(3, post.getIdx());

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Post 테이블 updatePost 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int deletePost(String idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "delete from Post where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Post 테이블 delete 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// select idx
	public PostDTO selectPost(String idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PostDTO post = null;
		try {
			con = getConnection();

			String sql = "select * from Post where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				post = new PostDTO();
				post.setIdx(rs.getString("idx"));
				post.setKinds_post(rs.getString("kinds_post"));
				post.setEmail(rs.getString("email"));
				post.setProduct_idx(rs.getString("product_idx"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setImg_source(rs.getString("img_source"));
				post.setPosted_date(rs.getString("posted_date"));
				post.setHit(rs.getInt("hit"));
			}
		} catch (SQLException e) {
			System.out.println("Post 테이블 select 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return post;
	}

	// search
	public List<PostDTO> searchPostList(String kinds_post, String data, String type) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PostDTO> list = new ArrayList<PostDTO>();
		try {
			con = getConnection();

			String sql = "select * from Post where kinds_post = ? and "+type+" like '%'||?||'%' order by sysdate desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kinds_post);
			pstmt.setString(2, data);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				PostDTO post = new PostDTO();
				post.setIdx(rs.getString("idx"));
				post.setKinds_post(rs.getString("kinds_post"));
				post.setEmail(rs.getString("email"));
				post.setProduct_idx(rs.getString("product_idx"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setImg_source(rs.getString("img_source"));
				post.setPosted_date(rs.getString("posted_date"));
				post.setHit(rs.getInt("hit"));
				list.add(post);
			}
		} catch (SQLException e) {
			System.out.println("Post 테이블 search 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}

	// select *
	public List<PostDTO> selectAllPostList(String kinds_post, String orderBy) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PostDTO> list = new ArrayList<PostDTO>();
		try {
			con = getConnection();

			String sql = "select * from Post where kinds_post = ? order by ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kinds_post);
			pstmt.setString(2, orderBy);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				PostDTO post = new PostDTO();
				post.setIdx(rs.getString("idx"));
				post.setKinds_post(rs.getString("kinds_post"));
				post.setEmail(rs.getString("email"));
				post.setProduct_idx(rs.getString("product_idx"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setImg_source(rs.getString("img_source"));
				post.setPosted_date(rs.getString("posted_date"));
				post.setHit(rs.getInt("hit"));
				list.add(post);
			}
		} catch (SQLException e) {
			System.out.println("Post 테이블 selectAll 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public List<PostDTO> selectAllPostListGeneral(String kinds_post, int startRow, int endRow) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<PostDTO> list = new ArrayList<PostDTO>();
	      try {
	         con = getConnection();

	         String sql = "select * from (select rownum rnd, tempd.* from (select rownum rn,temp.* from (select * from post where kinds_post = ? order by posted_date)"
	               + " temp order by rn desc) tempd) where rnd between ? and ?";

	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, kinds_post);
	         pstmt.setInt(2, startRow);
	         pstmt.setInt(3, endRow);

	         rs = pstmt.executeQuery();

	         while (rs.next()) {
	            PostDTO post = new PostDTO();
	            post.setIdx(rs.getString("idx"));
	            post.setKinds_post(rs.getString("kinds_post"));
	            post.setEmail(rs.getString("email"));
	            post.setProduct_idx(rs.getString("product_idx"));
	            post.setTitle(rs.getString("title"));
	            post.setContent(rs.getString("content"));
	            post.setImg_source(rs.getString("img_source"));
	            post.setPosted_date(rs.getString("posted_date"));
	            post.setHit(rs.getInt("hit"));
	            list.add(post);
	         }
	      } catch (SQLException e) {
	         System.out.println("Post 테이블 selectAllPostListGeneral 오류 => " + e.getMessage());
	      } finally {
	         close(con, pstmt, rs);
	      }
	      return list;
	   }
	// 관리자 사용 불가 select * from 테이블 - 제작 : 정원택
	public List<PostDTO> selectAllPostListGeneral(String kinds_post, int startRow, int endRow, String search, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PostDTO> list = new ArrayList<PostDTO>();
		try {
			con = getConnection();
			
			
			if(keyword.equals("")) {
				String sql = "select * from (select rownum rnd, tempd.* from (select rownum rn,temp.* from (select * from post where kinds_post = ? order by posted_date)"
						+ " temp order by rn desc) tempd) where rnd between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, kinds_post);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			} else {
				String sql = "select * from (select rownum rnd, tempd.* from (select rownum rn,temp.* from (select * from post where kinds_post = ? and "+ search +" like '%'||?||'%'  order by posted_date)"
						+ " temp order by rn desc) tempd) where rnd between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, kinds_post);
				pstmt.setString(2, keyword);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				
			}
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PostDTO post = new PostDTO();
				post.setIdx(rs.getString("idx"));
				post.setKinds_post(rs.getString("kinds_post"));
				post.setEmail(rs.getString("email"));
				post.setProduct_idx(rs.getString("product_idx"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setImg_source(rs.getString("img_source"));
				post.setPosted_date(rs.getString("posted_date"));
				post.setHit(rs.getInt("hit"));
				list.add(post);
			}
		} catch (SQLException e) {
			System.out.println("Post 테이블 selectAllPostListGeneral 오류 => " + e.getMessage());
			System.out.println("search = "+search);
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}

	// 관리자 사용 불가 select * from 테이블 - 제작 : 정원택
	public int selectPostCount(String kinds_post, String search, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();
			
			
			if(keyword.equals("")) {
				String sql = "select count(*) from post where kinds_post = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, kinds_post);
			} else {
				String sql = "select count(*) from post where kinds_post = ? and "+ search +" like '%'||?||'%' ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, kinds_post);
				pstmt.setString(2, keyword);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectPostCount() 메소드의 SQL 오류 = " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	public int selectPostCount(String kinds_post) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      int count = 0;
	      try {
	         con = getConnection();

	         String sql = "select count(*) from post where kinds_post = ?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, kinds_post);

	         rs = pstmt.executeQuery();

	         if (rs.next()) {
	            count = rs.getInt(1);
	         }
	      } catch (SQLException e) {
	         System.out.println("[에러]selectPostCount() 메소드의 SQL 오류 = " + e.getMessage());
	      } finally {
	         close(con, pstmt, rs);
	      }
	      return count;
	   }

	
	//테스트용 - 정원택
	public int insertNotice(String noticeTitle, String noticeContent) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			String sql = "insert into Post (idx, kinds_post, email, product_idx , title, content, img_source, posted_date)"
					+ " values('TEST_110','NOTICE','moo_sung@naver.com','TEST_1', ? , ? ,'준비중',sysdate)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, noticeTitle);
			pstmt.setString(2, noticeContent);

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Post 테이블 insertNotice 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int updatePostHit(String postIdx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update Post set hit = hit+1 where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, postIdx);

			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Post 테이블 updatePostHit 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

}
