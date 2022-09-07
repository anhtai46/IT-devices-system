/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duonght.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import quanghung.brand.BrandDAO;

/**
 *
 * @author Trung Duong
 */
public class UpdateBrandController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String textBrand = request.getParameter("textBrand");
            String cateID = request.getParameter("textCateID");
            String brandName = request.getParameter("brandName");
            boolean checkDuplicate = BrandDAO.checkDuplicate(textBrand, cateID);
            if (checkDuplicate) {
                boolean checkStatus = BrandDAO.checkStatus(textBrand, cateID);
                if (checkStatus) {
                    request.setAttribute("MESSAGE", "Duplicate Brand!");
                } else {
                    boolean isUpdate = BrandDAO.updateBrand(brandName, textBrand, cateID);
                    if (isUpdate) {
                        request.setAttribute("MESSAGE", "Update Successfully!");
                    } else {
                        request.setAttribute("MESSAGE", "Ops! Something Wrong. Try again!");
                    }
                }
            } else {
                if (textBrand.length() > 50) {
                    request.setAttribute("MESSAGE", "Brand Name Must Not Exceed 50 Characters!");
                } else if (textBrand.equals("")) {
                    request.setAttribute("MESSAGE", "Not Empty Name Allow!");
                } else {
                    boolean isUpdate = BrandDAO.updateBrand(brandName, textBrand, cateID);
                    if (isUpdate) {
                        request.setAttribute("MESSAGE", "Update Successfully!");
                    } else {
                        request.setAttribute("MESSAGE", "Ops! Something Wrong. Try again!");
                    }
                }
            }
            request.getRequestDispatcher("MainController?action=GetListCategory").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBrandController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBrandController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
