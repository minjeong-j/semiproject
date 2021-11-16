package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.GradeDTO;

public class GradeDAO extends JdbcDAO{
	private static GradeDAO _dao;
	public GradeDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao = new GradeDAO();
	}
	
	public static GradeDAO getDAO() {
		return _dao;
	}
	
	public int insertGrade(GradeDTO grade) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "insert into grade values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, grade.getGrade());
			pstmt.setString(2, grade.getGrade_name());
			pstmt.setInt(3, grade.getGrade_discount());
			
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Grade 테이블 insert 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int updateGrade(GradeDTO grade) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update grade set grade_name = ?, grade_discount = ? where grade = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, grade.getGrade_name());
			pstmt.setInt(2, grade.getGrade_discount());
			pstmt.setString(3, grade.getGrade());

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Grade 테이블 update 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int deleteGrade(String grade) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "delete from grade where grade = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, grade);

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Grade 테이블 delete 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public List<GradeDTO> selectAllGradeList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<GradeDTO> list = new ArrayList<GradeDTO>();
		try {
			con = getConnection();

			String sql = "select * from grade order by grade";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				GradeDTO grade = new GradeDTO();
				grade.setGrade(rs.getString("grade"));
				grade.setGrade_name(rs.getString("grade_name"));
				grade.setGrade_discount(rs.getInt("grade_discount"));
				list.add(grade);
			}
		} catch (SQLException e) {
			System.out.println("Grade 테이블 selectAll 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
}
