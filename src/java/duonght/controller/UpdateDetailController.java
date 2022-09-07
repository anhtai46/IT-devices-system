/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duonght.controller;

import duonght.descriptionDetail.DescriptionDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Trung Duong
 */
public class UpdateDetailController extends HttpServlet {

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
            String detailName = request.getParameter("detailName");
            int descriptionID = Integer.parseInt(request.getParameter("descriptionID"));
            int detailID = DescriptionDetailDAO.getDetailID(detailName, descriptionID);
            String textdetailName = request.getParameter("textDetail");
            boolean checkDuplicate = DescriptionDetailDAO.checkDuplicate(textdetailName, descriptionID);
            if (checkDuplicate) {
                boolean checkStatus = DescriptionDetailDAO.checkStatus(textdetailName, descriptionID);
                if (checkStatus) {
                    request.setAttribute("MESSAGE", "Duplicate Description Detail!");
                } else {
                    boolean isUpdate = DescriptionDetailDAO.updateDescriptionDetail(textdetailName, detailID);
                    if (isUpdate) {
                        request.setAttribute("MESSAGE", "Update Successfully!");
                    } else {
                        request.setAttribute("MESSAGE", "Ops! Something Wrong. Try again!");
                    }
                }
            } else {
                if (textdetailName.length() > 50) {
                    request.setAttribute("MESSAGE", "Description Detail Name Must Not Exceed 50 Characters!");
                } else if (textdetailName.equals("")) {
                    request.setAttribute("MESSAGE", "Not Empty Name Allow!");
                } else {
                    boolean isUpdate = DescriptionDetailDAO.updateDescriptionDetail(textdetailName, detailID);
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
            Logger.getLogger(UpdateDetailController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdateDetailController.class.getName()).log(Level.SEVERE, null, ex);
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
