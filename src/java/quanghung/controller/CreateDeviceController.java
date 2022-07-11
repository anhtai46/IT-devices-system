package quanghung.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import quanghung.brand.BrandDAO;
import quanghung.category.CategoryDAO;
import quanghung.description.DescriptionDAO;
import quanghung.description.DescriptionDTO;
import quanghung.descriptionDetail.DescriptionDetailDAO;
import quanghung.descriptionDetail.DescriptionDetailError;
import quanghung.device.DeviceDAO;
import quanghung.device.DeviceError;
import quanghung.device_description.Device_DescriptionDAO;
import quanghung.warehouse.WarehouseDAO;

@MultipartConfig
public class CreateDeviceController extends HttpServlet {

    private static final String ERROR = "createDeviceInfo.jsp";
    private static final String SUCCESS = "MainController?search=&action=SearchDevice";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        DeviceError deviceError = new DeviceError();
        DescriptionDetailError detailError = new DescriptionDetailError();
        try {
            boolean checkValidation = true;
            HttpSession session = request.getSession();
            DeviceDAO deviceDao = new DeviceDAO();
            WarehouseDAO warehouseDao = new WarehouseDAO();
            BrandDAO brandDao = new BrandDAO();
            CategoryDAO categoryDao = new CategoryDAO();
            DescriptionDAO descriptionDao = new DescriptionDAO();
            DescriptionDetailDAO detailDAO = new DescriptionDetailDAO();
            Device_DescriptionDAO device_descriptionDao = new Device_DescriptionDAO();
            String deviceName = request.getParameter("deviceName");
            String warehouseName = request.getParameter("warehouseName");
            String brand = request.getParameter("brandID");
            int brandID = Integer.parseInt(brand);
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String cateName = request.getParameter("cateName");
            int warehouseID = warehouseDao.getWarehouseID(warehouseName);
            String cateID = categoryDao.getCateID(cateName);
           Part part = request.getPart("image");

            String realPath = request.getServletContext().getRealPath("/pictures");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }
            part.write(realPath + "/" + fileName);
            String image = "pictures/" + fileName;
            if (quantity <= 0) {
                deviceError.setQuantityError("Quantity must be a positive integer");
                checkValidation = false;
            }
            if (brand == null) {
                deviceError.setBrandNameError("Please choose brand name");
                checkValidation = false;
            }
            if (checkValidation) {
                boolean createDevice = deviceDao.createDevice(deviceName,image, warehouseID, brandID, quantity, cateID);
                int deviceID = deviceDao.getDeviceID(deviceName);
                List<DescriptionDTO> listDescription = descriptionDao.getListDescription(cateID);
                for (int i = 1; i <= listDescription.size(); i++) {
                    String d = "detailID" + String.valueOf(i);
                    String dd = request.getParameter(d);
                    if (dd == null) {
                        detailError.setDetailNameError( "The device " + deviceName +  " has not yet entered the detailed parameters ! You need to insert detailed parameters later");
                        checkValidation = false;
                    }
                    if (checkValidation) {
                        int detailID = Integer.parseInt(dd);
                        boolean createDevice_Description = device_descriptionDao.createDevice_Description(deviceID, detailID);
                    } else {
                        request.setAttribute("DETAIL_ERROR", detailError);
                        break;
                    }
                }
                if (createDevice) {
                    String success = "Insert device successfully";
                    request.setAttribute("SUCCESS", success);
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("DEVICE_ERROR", deviceError);
            }
        } catch (Exception e) {
            log("Error at Create Device Controller: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
