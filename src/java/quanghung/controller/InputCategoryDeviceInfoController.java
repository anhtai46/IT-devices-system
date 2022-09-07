package quanghung.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import quanghung.brand.BrandDAO;
import quanghung.category.CategoryDAO;
import quanghung.description.DescriptionDAO;
import quanghung.description.DescriptionDTO;
import quanghung.descriptionDetail.DescriptionDetailDAO;
import quanghung.descriptionDetail.DescriptionDetailDTO;

public class InputCategoryDeviceInfoController extends HttpServlet {

    private static final String ERROR = "updateCategory.jsp";
    private static final String SUCCESS = "updateCategoryDeviceInfo.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            CategoryDAO categoryDao = new CategoryDAO();
            DescriptionDAO descriptionDao = new DescriptionDAO();
            DescriptionDetailDAO descriptionDetailDao = new DescriptionDetailDAO();
            BrandDAO brandDao = new BrandDAO();
            int deviceID = (int) session.getAttribute("DEVICE_ID");
            String cateID = request.getParameter("cateID");
            String currentCategory = (String) session.getAttribute("CATE_ID");
            if (currentCategory.equals(cateID)) {
                request.setAttribute("DUPLICATE_CATEGORY", "Your choice is duplicate with current category! Choose another!");
            } else {
                String cateName = categoryDao.getCateName(cateID);
                session.setAttribute("DEVICE_ID", deviceID);
                Map<Integer, String> listBrand = brandDao.getListBrandBasedOnCateID(cateID);
                List<DescriptionDTO> listDescription = descriptionDao.getListDescription(cateID);
                for (DescriptionDTO l : listDescription) {
                    List<DescriptionDetailDTO> listDescriptionDetail = descriptionDetailDao.getListDescriptionDetail(l.getDescriptionID());
                    session.setAttribute(l.getDescriptionName(), listDescriptionDetail);
                }
                session.setAttribute("CATE_NAME", cateName);
                session.setAttribute("DESCRIPTION_LIST", listDescription);
                session.setAttribute("BRAND_LIST", listBrand);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at InputCategoryDeviceInfoController: " + e.toString());
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
