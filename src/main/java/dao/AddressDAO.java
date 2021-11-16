package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.AddressDTO;

public class AddressDAO extends JdbcDAO {
	private static AddressDAO _dao;

	public AddressDAO() {
		// TODO Auto-generated constructor stub
	}

	static {
		_dao = new AddressDAO();
	}

	public static AddressDAO getDAO() {
		return _dao;
	}

	public int insertAddress(AddressDTO address) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();
			
			String sql = "insert into address values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, address.getId());
			pstmt.setString(2, address.getPost_code());
			pstmt.setString(3, address.getRoad_address());
			pstmt.setString(4, address.getDetail_address());
			pstmt.setString(5, address.getEmail());
			
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Address 테이블 insert 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int updateAddress(AddressDTO address) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update address set post_code = ?, road_address = ?, detail_address = ?, email = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, address.getPost_code());
			pstmt.setString(2, address.getRoad_address());
			pstmt.setString(3, address.getDetail_address());
			pstmt.setString(4, address.getEmail());
			pstmt.setString(5, address.getId());

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Address 테이블 update 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int deleteAddress(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "delete from address where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Address 테이블 delete 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// select id
	public AddressDTO selectAddress(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AddressDTO address = null;
		try {
			con = getConnection();

			String sql = "select * from address where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				address = new AddressDTO();
				address.setId(rs.getString("id"));
				address.setPost_code(rs.getString("post_code"));
				address.setRoad_address(rs.getString("road_address"));
				address.setDetail_address(rs.getString("detail_address"));
				address.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			System.out.println("Address 테이블 select 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return address;
	}

	// select *
	public List<AddressDTO> selectAllAddressList(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<AddressDTO> list = new ArrayList<AddressDTO>();
		try {
			con = getConnection();

			String sql = "select * from address where email = ? order by id";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				AddressDTO address = new AddressDTO();
				address.setId(rs.getString("id"));
				address.setPost_code(rs.getString("post_code"));
				address.setRoad_address(rs.getString("road_address"));
				address.setDetail_address(rs.getString("detail_address"));
				address.setEmail(rs.getString("email"));
				list.add(address);
			}
		} catch (SQLException e) {
			System.out.println("Address 테이블 selectAll 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
}
