package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CartDTO;

public class CartDAO extends JdbcDAO {
	private static CartDAO _dao;

	public CartDAO() {
		// TODO Auto-generated constructor stub
	}

	static {
		_dao = new CartDAO();
	}

	public static CartDAO getDAO() {
		return _dao;
	}

	public int insertCart(CartDTO cart) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "insert into cart values(? || TO_CHAR(cart_seq.nextval),?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart.getEmail().substring(0, 2));
			pstmt.setString(2, cart.getEmail());
			pstmt.setString(3, cart.getProduct_idx());
			pstmt.setInt(4, cart.getQuantity());
			
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Cart 테이블 insert 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int updateCart(CartDTO cart) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update cart set email = ?, product_idx = ?, quantity = ? where cart_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart.getEmail());
			pstmt.setString(2, cart.getProduct_idx());
			pstmt.setInt(3, cart.getQuantity());
			pstmt.setString(4, cart.getCart_idx());
			
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Cart 테이블 update 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int deleteCart(String cart_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "delete from cart where cart_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart_idx);

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("cart 테이블 delete 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public int clearCart(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "delete from cart where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("cart 테이블 clear 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public CartDTO selectCart(String cart_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CartDTO cart = null;
		try {
			con = getConnection();

			String sql = "select * from cart where cart_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart_idx);

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cart = new CartDTO();
				cart.setCart_idx(rs.getString("cart_idx"));
				cart.setEmail(rs.getString("email"));
				cart.setProduct_idx(rs.getString("product_idx"));
				cart.setQuantity(rs.getInt("quantity"));
			}			
		} catch (SQLException e) {
			System.out.println("cart 테이블 select 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return cart;
	}

	public List<CartDTO> selectAllCartList(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CartDTO> list = new ArrayList<CartDTO>();
		try {
			con = getConnection();

			String sql = "select * from Cart where email = ? order by cart_idx";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CartDTO cart = new CartDTO();
				cart.setCart_idx(rs.getString("cart_idx"));
				cart.setEmail(rs.getString("email"));
				cart.setProduct_idx(rs.getString("product_idx"));
				cart.setQuantity(rs.getInt("quantity"));
				list.add(cart);
			}
		} catch (SQLException e) {
			System.out.println("cart 테이블 selectAll 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
}
