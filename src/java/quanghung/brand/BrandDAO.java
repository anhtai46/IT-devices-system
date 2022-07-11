package quanghung.brand;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;
import quanghung.utils.DBUtils;

public class BrandDAO {

    private static final String SEARCH_BRAND = "SELECT brandName, cateID, status FROM brand WHERE brandName like ?";
    private static final String GET_LIST_BRAND_BASED_ON_CATEGORY_ID = "SELECT brandID, brandName, cateID, status FROM brand WHERE cateID=?";
    private static final String GET_LIST_BRAND_BASED_ON_BRAND_ID = "SELECT brandID, brandName, cateID, status FROM brand WHERE brandID=?";
    private static final String GET_LIST_BRAND = "SELECT brandID, brandName, cateID, status FROM brand WHERE status=1";
    private static final String DELETE_BRAND = "UPDATE brand SET status=? WHERE brandID=?";
    private static final String UPDATE_BRAND = "UPDATE brand SET brandName=? WHERE brandID=?";
    private static final String CREATE_BRAND = "INSERT INTO brand(brandName,cateID,status) VALUES (?,?,?)";
    private static final String GET_BRAND_ID = "SELECT brandID from brand WHERE brandName=?";

    public int getBrandID(String brandName) throws SQLException {
        int brandID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_BRAND_ID);
                ptm.setString(1, brandName);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    brandID = rs.getInt("brandID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return brandID;
    }

    public boolean createBrand(BrandDTO brand) throws SQLException, NamingException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_BRAND);
                ptm.setString(1, brand.getBrandName());
                ptm.setString(2, brand.getCateID());
                ptm.setBoolean(3, true);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean deleteBrand(String brandID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_BRAND);
                ptm.setBoolean(1, false);
                ptm.setString(2, brandID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.toString();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateBrand(BrandDTO brand) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_BRAND);
                ptm.setString(1, brand.getBrandName());
                ptm.setInt(2, brand.getBrandID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.toString();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public Map<Integer, String> getListBrandBasedOnCateID(String cateID) throws SQLException {
        Map<Integer, String> listBrand = new HashMap<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_BRAND_BASED_ON_CATEGORY_ID);
                ptm.setString(1, cateID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int brandID = rs.getInt("brandID");
                    String brandName = rs.getString("brandName");
                    listBrand.put(brandID, brandName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listBrand;
    }

    public Map<Integer, String> getListBrand() throws SQLException {
        Map<Integer, String> listBrand = new HashMap<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_BRAND);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int brandID = rs.getInt("brandID");
                    String brandName = rs.getString("brandName");
                    listBrand.put(brandID, brandName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listBrand;
    }
    public Map<Integer, String> getListBrandBasedOnBrandID(int brandID) throws SQLException {
        Map<Integer, String> listBrand = new HashMap<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_BRAND_BASED_ON_CATEGORY_ID);
                ptm.setInt(1, brandID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String brandName = rs.getString("brandName");
                    listBrand.put(brandID, brandName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listBrand;
    }
}
