package quanghung.device;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import quanghung.utils.DBUtils;

/**
 *
 * @author duong
 */
public class DeviceDAO {

    private static final String SEARCH_DEVICE_BY_CATEGORY_ID = "SELECT deviceID, deviceName, url, d.warehouseID, d.brandID, quantity, d.cateID, w.warehouseName, c.cateName, b.brandName, d.status FROM device d, warehouse w, category c, Brand b  WHERE d.brandID = b.brandID AND d.warehouseID = w.warehouseID AND d.cateID = c.cateID AND d.cateID = ?";
    private static final String SEARCH_DEVICE_BY_BRAND_ID = "SELECT deviceID, deviceName, url, d.warehouseID, d.brandID, quantity, d.cateID, w.warehouseName, c.cateName, b.brandName, d.status FROM device d, warehouse w, category c, Brand b  WHERE d.brandID = b.brandID AND d.warehouseID = w.warehouseID AND d.cateID = c.cateID AND d.brandID = ?";
    private static final String SEARCH_DEVICE_BY_WAREHOUSE_ID = "SELECT deviceID, deviceName, url, d.warehouseID, d.brandID, quantity, d.cateID, w.warehouseName, c.cateName, b.brandName, d.status FROM device d, warehouse w, category c, Brand b  WHERE d.brandID = b.brandID AND d.warehouseID = w.warehouseID AND d.cateID = c.cateID AND d.warehouseID = ?";
    private static final String SEARCH_DEVICE = "SELECT deviceID, deviceName, url, d.warehouseID, d.brandID, quantity, d.cateID, w.warehouseName, c.cateName, b.brandName, d.status FROM device d, warehouse w, category c, Brand b  WHERE d.brandID = b.brandID AND d.warehouseID = w.warehouseID AND d.cateID = c.cateID AND d.deviceName like ?";
    private static final String GET_LIST_DEVICE = "SELECT deviceID, deviceName, url, d.warehouseID, d.brandID, quantity, d.cateID, w.warehouseName, c.cateName, b.brandName, d.status FROM device d, warehouse w, category c, Brand b  WHERE d.brandID = b.brandID AND d.warehouseID = w.warehouseID AND d.cateID = c.cateID";
    private static final String DELETE_DEVICE = "UPDATE device SET status=? WHERE deviceID=?";
    private static final String UPDATE_DEVICE = "UPDATE device SET deviceName=?, warehouseID=?, brandID=?, quantity=?, cateID=? WHERE deviceID=?";
    private static final String UPDATE_IMAGE = "UPDATE device SET url=? WHERE deviceID=?";
    private static final String CREATE_DEVICE = "INSERT INTO device(deviceName,url,warehouseID,brandID,quantity,cateID,status) VALUES (?,?,?,?,?,?,?)";
    private static final String CHECK_DUPLICATE = "SELECT deviceID FROM device WHERE deviceName=? AND warehouseID=?";
    private static final String GET_DEVICE_ID = "SELECT deviceID FROM device WHERE deviceName=?";

    public boolean checkDuplicate(String deviceName, int warehouseID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, deviceName);
                ptm.setInt(2, warehouseID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
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
        return check;
    }

    public int getDeviceID(String deviceName) throws SQLException {
        int deviceID = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_DEVICE_ID);
                ptm.setString(1, deviceName);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    deviceID = rs.getInt("deviceID");
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
        return deviceID;
    }

    public boolean createDevice(String deviceName, String url, int warehouseID, int brandID, int quantity, String cateID) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_DEVICE);
                ptm.setString(1, deviceName);
                ptm.setString(2, url);
                ptm.setInt(3, warehouseID);
                ptm.setInt(4, brandID);
                ptm.setInt(5, quantity);
                ptm.setString(6, cateID);
                ptm.setBoolean(7, true);
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

    public boolean updateImg(String url, int deviceID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_IMAGE);
                ptm.setString(1, url);
                ptm.setInt(2, deviceID);
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

    public boolean updateDevice(DeviceDTO device) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_DEVICE);
                ptm.setString(1, device.getDeviceName());
                ptm.setInt(2, device.getWarehouseID());
                ptm.setInt(3, device.getBrandID());
                ptm.setInt(4, device.getQuantity());
                ptm.setString(5, device.getCateID());
                ptm.setInt(6, device.getDeviceID());
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

    public boolean deleteDevice(String deviceID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_DEVICE);
                ptm.setBoolean(1, false);
                ptm.setString(2, deviceID);
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

    public List<DeviceDTO> getListDevice(String search) throws SQLException {
        List<DeviceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (search != "") {
                    ptm = conn.prepareStatement(SEARCH_DEVICE);
                    ptm.setString(1, "%" + search + "%");
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        boolean status = rs.getBoolean("status");
                        if (status) {
                            int deviceID = rs.getInt("deviceID");
                            String deviceName = rs.getString("deviceName");
                            String url = rs.getString("url");
                            int warehouseID = rs.getInt("warehouseID");
                            String warehouseName = rs.getString("warehouseName");
                            int brandID = rs.getInt("brandID");
                            String brandName = rs.getString("brandName");
                            int quantity = rs.getInt("quantity");
                            String cateID = rs.getString("cateID");
                            String cateName = rs.getString("cateName");
                            list.add(new DeviceDTO(deviceID, deviceName, url, warehouseID, warehouseName, brandID, brandName, quantity, cateID, cateName, status));
                        }
                    }
                } else {
                    ptm = conn.prepareStatement(GET_LIST_DEVICE);
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        boolean status = rs.getBoolean("status");
                        if (status) {
                            int deviceID = rs.getInt("deviceID");
                            String deviceName = rs.getString("deviceName");
                            String url = rs.getString("url");
                            int warehouseID = rs.getInt("warehouseID");
                            String warehouseName = rs.getString("warehouseName");
                            int brandID = rs.getInt("brandID");
                            String brandName = rs.getString("brandName");
                            int quantity = rs.getInt("quantity");
                            String cateID = rs.getString("cateID");
                            String cateName = rs.getString("cateName");
                            list.add(new DeviceDTO(deviceID, deviceName, url, warehouseID, warehouseName, brandID, brandName, quantity, cateID, cateName, status));
                        }
                    }
                }
            }
        } catch (Exception e) {
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
        return list;
    }

    public List<DeviceDTO> getListDeviceByName(String search) throws SQLException {
        List<DeviceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (search != "") {
                    ptm = conn.prepareStatement(SEARCH_DEVICE);
                    ptm.setString(1, "%" + search + "%");
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        boolean status = rs.getBoolean("status");
                        if (status) {
                            int deviceID = rs.getInt("deviceID");
                            String deviceName = rs.getString("deviceName");
                            String url = rs.getString("url");
                            int warehouseID = rs.getInt("warehouseID");
                            String warehouseName = rs.getString("warehouseName");
                            int brandID = rs.getInt("brandID");
                            String brandName = rs.getString("brandName");
                            int quantity = rs.getInt("quantity");
                            String cateID = rs.getString("cateID");
                            String cateName = rs.getString("cateName");
                            list.add(new DeviceDTO(deviceID, deviceName, url, warehouseID, warehouseName, brandID, brandName, quantity, cateID, cateName, status));
                        }
                    }
                } else {
                    ptm = conn.prepareStatement(GET_LIST_DEVICE);
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        boolean status = rs.getBoolean("status");
                        if (status) {
                            int deviceID = rs.getInt("deviceID");
                            String deviceName = rs.getString("deviceName");
                            String url = rs.getString("url");
                            int warehouseID = rs.getInt("warehouseID");
                            String warehouseName = rs.getString("warehouseName");
                            int brandID = rs.getInt("brandID");
                            String brandName = rs.getString("brandName");
                            int quantity = rs.getInt("quantity");
                            String cateID = rs.getString("cateID");
                            String cateName = rs.getString("cateName");
                            list.add(new DeviceDTO(deviceID, deviceName, url, warehouseID, warehouseName, brandID, brandName, quantity, cateID, cateName, status));
                        }
                    }
                }
            }
        } catch (Exception e) {
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
        return list;
    }

    public List<DeviceDTO> getListDeviceByCateID(String categoryID) throws SQLException {
        List<DeviceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (categoryID != "") {
                    ptm = conn.prepareStatement(SEARCH_DEVICE_BY_CATEGORY_ID);
                    ptm.setString(1, categoryID);
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        boolean status = rs.getBoolean("status");
                        if (status) {
                            int deviceID = rs.getInt("deviceID");
                            String deviceName = rs.getString("deviceName");
                            String url = rs.getString("url");
                            int warehouseID = rs.getInt("warehouseID");
                            String warehouseName = rs.getString("warehouseName");
                            int brandID = rs.getInt("brandID");
                            String brandName = rs.getString("brandName");
                            int quantity = rs.getInt("quantity");
                            String cateID = rs.getString("cateID");
                            String cateName = rs.getString("cateName");
                            list.add(new DeviceDTO(deviceID, deviceName, url, warehouseID, warehouseName, brandID, brandName, quantity, cateID, cateName, status));
                        }
                    }
                }
            }
        } catch (Exception e) {
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
        return list;
    }

    public List<DeviceDTO> getListDeviceByBrandID(int brandID) throws SQLException {
        List<DeviceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (brandID != 0) {
                    ptm = conn.prepareStatement(SEARCH_DEVICE_BY_BRAND_ID);
                    ptm.setInt(1, brandID);
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        boolean status = rs.getBoolean("status");
                        if (status) {
                            int deviceID = rs.getInt("deviceID");
                            String deviceName = rs.getString("deviceName");
                            String url = rs.getString("url");
                            int warehouseID = rs.getInt("warehouseID");
                            String warehouseName = rs.getString("warehouseName");
                            String brandName = rs.getString("brandName");
                            int quantity = rs.getInt("quantity");
                            String cateID = rs.getString("cateID");
                            String cateName = rs.getString("cateName");
                            list.add(new DeviceDTO(deviceID, deviceName, url, warehouseID, warehouseName, brandID, brandName, quantity, cateID, cateName, status));
                        }
                    }
                }
            }
        } catch (Exception e) {
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
        return list;
    }

    public List<DeviceDTO> getListDeviceByWarehouseID(int warehouseID) throws SQLException {
        List<DeviceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (warehouseID != 0) {
                    ptm = conn.prepareStatement(SEARCH_DEVICE_BY_WAREHOUSE_ID);
                    ptm.setInt(1, warehouseID);
                    rs = ptm.executeQuery();
                    while (rs.next()) {
                        boolean status = rs.getBoolean("status");
                        if (status) {
                            int deviceID = rs.getInt("deviceID");
                            String deviceName = rs.getString("deviceName");
                            String url = rs.getString("url");
                            String warehouseName = rs.getString("warehouseName");
                            int brandID = rs.getInt("brandID");
                            String brandName = rs.getString("brandName");
                            int quantity = rs.getInt("quantity");
                            String cateID = rs.getString("cateID");
                            String cateName = rs.getString("cateName");
                            list.add(new DeviceDTO(deviceID, deviceName, url, warehouseID, warehouseName, brandID, brandName, quantity, cateID, cateName, status));
                        }
                    }
                }
            }
        } catch (Exception e) {
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
        return list;
    }
}
