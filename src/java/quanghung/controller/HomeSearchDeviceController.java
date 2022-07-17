/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package quanghung.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import quanghung.brand.BrandDAO;
import quanghung.category.CategoryDAO;
import quanghung.description.DescriptionDAO;
import quanghung.descriptionDetail.DescriptionDetailDAO;
import quanghung.device.DeviceDAO;
import quanghung.device.DeviceDTO;
import quanghung.warehouse.WarehouseDAO;

public class HomeSearchDeviceController extends HttpServlet {

    private static final String ERROR = "devicePage.jsp";
    private static final String SUCCESS = "devicePage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String search = String.valueOf(request.getParameter("search"));
            request.setAttribute("SEARCH", search);
            String value = request.getParameter("value");
            DeviceDAO deviceDAO = new DeviceDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            BrandDAO brandDao = new BrandDAO();
            WarehouseDAO warehouseDAO = new WarehouseDAO();
            DescriptionDAO descriptionDAO = new DescriptionDAO();
            DescriptionDetailDAO detailDAO = new DescriptionDetailDAO();
            List<DeviceDTO> deviceList = deviceDAO.getListDevice(search);
            Map<String, String> categoryList = categoryDAO.getCategory();
            Map<Integer, String> brandList = brandDao.getListBrand();
            Map<Integer, String> descriptionList = descriptionDAO.getListDescription();
            for (Map.Entry<String, String> category : categoryList.entrySet()) {
                if (search.equals(category.getKey()) && value.equals(category.getValue())) {
                    deviceList = deviceDAO.getListDeviceByCateID(category.getKey());
                    break;
                }
            }
            descriptionList.entrySet();
            for (Map.Entry<Integer, String> description : descriptionList.entrySet()) {
                request.setAttribute(String.valueOf(description.getValue()), detailDAO.getListDescriptionDetail(description.getKey()));
            }
            request.setAttribute("LIST_DESCRIPTION", descriptionList);
            request.setAttribute("LIST_DEVICE", deviceList);
            request.setAttribute("LIST_BRAND", brandList);
            request.setAttribute("LIST_CATEGORY", categoryList);

            url = SUCCESS;
        } catch (Exception e) {
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