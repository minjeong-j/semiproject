package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.MemberDTO;
import dto.ProductDTO;

public class ProductDAO extends JdbcDAO {
	private static ProductDAO _dao;

	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}

	static {
		_dao = new ProductDAO();
	}

	public static ProductDAO getDAO() {
		return _dao;
	}

	public int insertProduct(ProductDTO product) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "insert into Product (idx, name, img_source, price" + ", kinds, stock, release_date)"
					+ " values(? || TO_CHAR(product_seq.nextval),?,?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product.getKinds().substring(0, 2));
			pstmt.setString(2, product.getName());
			pstmt.setString(3, product.getImg_source());
			pstmt.setInt(4, product.getPrice());
			pstmt.setString(5, product.getKinds());
			pstmt.setInt(6, product.getStock());
			
			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Product 테이블 insert 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int updateProduct(ProductDTO product) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "update Product set name = ?, img_source = ?" + ", price = ?, kinds = ?, stock = ?"
					+ ", release_date = ?, new_best = ? where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product.getName());
			pstmt.setString(2, product.getImg_source());
			pstmt.setInt(3, product.getPrice());
			pstmt.setString(4, product.getKinds());
			pstmt.setInt(5, product.getStock());
			pstmt.setString(6, product.getRelease_date());
			pstmt.setString(7, product.getNew_best());
			pstmt.setString(8, product.getIdx());

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Product 테이블 update 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	public int deleteProduct(String idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		try {
			con = getConnection();

			String sql = "delete from Product where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);

			rows = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Product 테이블 delete 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}

	// select idx
	public ProductDTO selectProduct(String idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO product = null;
		try {
			con = getConnection();

			String sql = "select * from Product where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				product = new ProductDTO();
				product.setIdx(rs.getString("idx"));
				product.setName(rs.getString("name"));
				product.setImg_source(rs.getString("img_source"));
				product.setPrice(rs.getInt("price"));
				product.setKinds(rs.getString("kinds"));
				product.setStock(rs.getInt("stock"));
				product.setRelease_date(rs.getString("release_date"));
				product.setNew_best(rs.getString("new_best"));
			}
		} catch (SQLException e) {
			System.out.println("Product 테이블 select 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return product;
	}

	// select kinds
	public List<ProductDTO> selectProductkindsList(String kinds, String orderBy) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			con = getConnection();

			String sql = "select * from Product where kinds = ? order by " + orderBy;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kinds);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO product = new ProductDTO();
				product = new ProductDTO();
				product.setIdx(rs.getString("idx"));
				product.setName(rs.getString("name"));
				product.setImg_source(rs.getString("img_source"));
				product.setPrice(rs.getInt("price"));
				product.setKinds(rs.getString("kinds"));
				product.setStock(rs.getInt("stock"));
				product.setRelease_date(rs.getString("release_date"));
				product.setNew_best(rs.getString("new_best"));
				list.add(product);
			}
		} catch (SQLException e) {
			System.out.println("Product 테이블 selectKinds 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public List<ProductDTO> selectProductNewBestList(String new_best, String orderBy) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			con = getConnection();

			String sql = "select * from Product where new_best = ? order by " + orderBy;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, new_best);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO product = new ProductDTO();
				product = new ProductDTO();
				product.setIdx(rs.getString("idx"));
				product.setName(rs.getString("name"));
				product.setImg_source(rs.getString("img_source"));
				product.setPrice(rs.getInt("price"));
				product.setKinds(rs.getString("kinds"));
				product.setStock(rs.getInt("stock"));
				product.setRelease_date(rs.getString("release_date"));
				product.setNew_best(rs.getString("new_best"));
				list.add(product);
			}
		} catch (SQLException e) {
			System.out.println("Product 테이블 selectKinds 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}

	// search name (where 절 like)
	
	public List<ProductDTO> searchProductNameList(String name) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			con = getConnection();
			
			String sql = "select * from Product where name like '%'||?||'%'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO product = new ProductDTO();
				product = new ProductDTO();
				product.setIdx(rs.getString("idx"));
				product.setName(rs.getString("name"));
				product.setImg_source(rs.getString("img_source"));
				product.setPrice(rs.getInt("price"));
				product.setKinds(rs.getString("kinds"));
				product.setStock(rs.getInt("stock"));
				product.setRelease_date(rs.getString("release_date"));
				product.setNew_best(rs.getString("new_best"));
				list.add(product);
			}
		} catch (SQLException e) {
			System.out.println("Product 테이블 selectName 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	//관리자 페이지 조회
	public List<ProductDTO> searchProductList(String search, String productKw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			con = getConnection();
			
			String sql = "select * from Product where "+search+" like '%'||?||'%'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productKw);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ProductDTO product = new ProductDTO();
				product = new ProductDTO();
				product.setIdx(rs.getString("idx"));
				product.setName(rs.getString("name"));
				product.setImg_source(rs.getString("img_source"));
				product.setPrice(rs.getInt("price"));
				product.setKinds(rs.getString("kinds"));
				product.setStock(rs.getInt("stock"));
				product.setRelease_date(rs.getString("release_date"));
				product.setNew_best(rs.getString("new_best"));
				list.add(product);
			}
		} catch (SQLException e) {
			System.out.println("Member 테이블 searchProductList 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}

	// select *
	public List<ProductDTO> selectAllProductList(String orderBy) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			con = getConnection();

			String sql = "select * from Product order by ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orderBy);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductDTO product = new ProductDTO();
				product = new ProductDTO();
				product.setIdx(rs.getString("idx"));
				product.setName(rs.getString("name"));
				product.setImg_source(rs.getString("img_source"));
				product.setPrice(rs.getInt("price"));
				product.setKinds(rs.getString("kinds"));
				product.setStock(rs.getInt("stock"));
				product.setRelease_date(rs.getString("release_date"));
				product.setNew_best(rs.getString("new_best"));
				list.add(product);
			}
		} catch (SQLException e) {
			System.out.println("Product 테이블 selectAll 오류 => " + e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	// select name
		public ProductDTO selectProductName(String name) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ProductDTO product = null;
			try {
				con = getConnection();

				String sql = "select * from Product where name = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					product = new ProductDTO();
					product.setIdx(rs.getString("idx"));
					product.setName(rs.getString("name"));
					product.setImg_source(rs.getString("img_source"));
					product.setPrice(rs.getInt("price"));
					product.setKinds(rs.getString("kinds"));
					product.setStock(rs.getInt("stock"));
					product.setRelease_date(rs.getString("release_date"));
					product.setNew_best(rs.getString("new_best"));
				}
			} catch (SQLException e) {
				System.out.println("Product 테이블 selectProductName 오류 => " + e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return product;
		}
		
		//관리자 페이징 - 박찬혁
		public List<ProductDTO> selectAllProductListGeneral(String product, int startRow, int endRow) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<ProductDTO> list = new ArrayList<ProductDTO>();
			try {
				con = getConnection();
				
				String sql = "select * from (select rownum rnd, tempd.* from (select rownum rn,temp.* from (select * from product order by ?)"
			               + " temp order by rn desc) tempd) where rnd between ? and ?";
				
				pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, product);
		        pstmt.setInt(2, startRow);
		        pstmt.setInt(3, endRow);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ProductDTO productList = new ProductDTO();
					productList = new ProductDTO();
					productList.setIdx(rs.getString("idx"));
					productList.setName(rs.getString("name"));
					productList.setImg_source(rs.getString("img_source"));
					productList.setPrice(rs.getInt("price"));
					productList.setKinds(rs.getString("kinds"));
					productList.setStock(rs.getInt("stock"));
					productList.setRelease_date(rs.getString("release_date"));
					productList.setNew_best(rs.getString("new_best"));
					list.add(productList);
				}
			} catch (SQLException e) {
				System.out.println("Product 테이블 selectAllProductListGeneral 오류 => " + e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return list;
		}
		
		public int selectProductCount(String product) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int count = 0;
			try {
				con = getConnection();
				
				String sql = "select count(*) from product";
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					count = rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("Product 테이블 selectProductCount 오류 => " + e.getMessage());
			} finally {
				
			}
			return count;
		}
}
