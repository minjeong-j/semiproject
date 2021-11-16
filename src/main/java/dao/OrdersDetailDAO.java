package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.OrdersDetailDTO;

public class OrdersDetailDAO extends JdbcDAO {
	private static OrdersDetailDAO _dao;

	public OrdersDetailDAO() {
		
	}

	static {
		_dao = new OrdersDetailDAO();
	}

	public static OrdersDetailDAO getDAO() {
		return _dao;
	}

	public int insertOrdersDetail(OrdersDetailDTO ordersDetail) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "insert into Orders_Detail values(? || TO_CHAR(orders_detail_seq.nextval),?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ordersDetail.getOrders_idx().substring(0, 2));
			pstmt.setString(2, ordersDetail.getOrders_idx());
			pstmt.setString(3, ordersDetail.getProduct_idx());
			pstmt.setInt(4, ordersDetail.getQuantity());
			pstmt.setInt(5, ordersDetail.getPrice());
			
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Orders_Detail 테이블 insert 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int updateOrdersDetail(OrdersDetailDTO ordersDetail) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update OrdersDetail set orders_idx = ?, product_idx = ?"
					+ ", quantity = ?, price = ? where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ordersDetail.getOrders_idx());
			pstmt.setString(2, ordersDetail.getProduct_idx());
			pstmt.setInt(3, ordersDetail.getQuantity());
			pstmt.setInt(4, ordersDetail.getPrice());
			pstmt.setString(5, ordersDetail.getIdx());

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Orders_Detail 테이블 update 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int deleteOrdersDetail(String idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "delete from Orders_Detail where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Orders_Detail 테이블 delete 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// select idx
	public OrdersDetailDTO selectOrdersDetail(String idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OrdersDetailDTO ordersDetail = null;
		try {
			con = getConnection();

			String sql = "select * from Orders_Detail where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ordersDetail = new OrdersDetailDTO();
				ordersDetail.setIdx(rs.getString("idx"));
				ordersDetail.setOrders_idx(rs.getString("orders_idx"));
				ordersDetail.setProduct_idx(rs.getString("product_idx"));
				ordersDetail.setQuantity(rs.getInt("quantity"));
				ordersDetail.setPrice(rs.getInt("price"));
			}
		} catch (SQLException e) {
			System.out.println("OrdersDetail 테이블 select 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return ordersDetail;
	}
	
	// select 
	public List<OrdersDetailDTO> selectOrderDetailIDXList(String orders_idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrdersDetailDTO> list = new ArrayList<OrdersDetailDTO>();
		try {
			con = getConnection();

			String sql = "select * from Orders_Detail where orders_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orders_idx);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrdersDetailDTO ordersDetail = new OrdersDetailDTO();
				ordersDetail.setIdx(rs.getString("idx"));
				ordersDetail.setOrders_idx(rs.getString("orders_idx"));
				ordersDetail.setProduct_idx(rs.getString("product_idx"));
				ordersDetail.setQuantity(rs.getInt("quantity"));
				ordersDetail.setPrice(rs.getInt("price"));
				list.add(ordersDetail);
			}
		} catch (SQLException e) {
			System.out.println("Orders_Detail 테이블 selectOrdersIDX 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	// select *
	public List<OrdersDetailDTO> selectAllOrdersDetailList(String orderBy) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrdersDetailDTO> list = new ArrayList<OrdersDetailDTO>();
		try {
			con = getConnection();

			String sql = "select * from Orders_Detail order by ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orderBy);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrdersDetailDTO ordersDetail = new OrdersDetailDTO();
				ordersDetail.setIdx(rs.getString("idx"));
				ordersDetail.setOrders_idx(rs.getString("orders_idx"));
				ordersDetail.setProduct_idx(rs.getString("product_idx"));
				ordersDetail.setQuantity(rs.getInt("quantity"));
				ordersDetail.setPrice(rs.getInt("price"));
				list.add(ordersDetail);
			}
		} catch (SQLException e) {
			System.out.println("Orders_Detail 테이블 selectAll 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
}
