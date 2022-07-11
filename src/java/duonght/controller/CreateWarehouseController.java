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
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import duonght.warehouse.WarehoueError;
import duonght.warehouse.WarehouseDAO;

/**
 *
 * @author Trung Duong
 */
public class CreateWarehouseController extends HttpServlet {

    private static final String ERROR = "MainController?action=GetListWarehouse";
    private static final String SUCCESS = "MainController?action=GetListWarehouse";

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
            throws ServletException, IOException, SQLException, ClassNotFoundException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        WarehoueError warehouseError = new WarehoueError();
        try (PrintWriter out = response.getWriter()) {
            boolean checkValidation = true;
            String warehouseName = request.getParameter("warehouseName");
            String location = request.getParameter("location");
            int limitAmout = Integer.parseInt(request.getParameter("limitAmout"));
            boolean isDuplicate = WarehouseDAO.checkDuplicate(warehouseName);
            if (isDuplicate) {
                request.setAttribute("MESSAGE", "Duplicate Warehouse!");
                url = ERROR;
            } else {
                if (warehouseName.length() > 50) {
                    warehouseError.setWarehouseNameError("WarehouseName must not exceed 50 characters");
                    checkValidation = false;
                }
                if (location.length() > 50) {
                    warehouseError.setLocationError("Location must not exceed 50 characters");
                    checkValidation = false;
                }
                if (limitAmout < 0 || limitAmout > 500) {
                    warehouseError.setLimitAmountError("Amount must greater than 0 and less than 500");
                    checkValidation = false;
                }
                if (checkValidation) {
                    boolean isCreate = WarehouseDAO.createWarehouse(warehouseName, location, limitAmout);
                    if (isCreate) {
                        url = SUCCESS;
                        request.setAttribute("MESSAGE", "Insert Successfully!");
                    } else {
                        url = ERROR;
                        request.setAttribute("MESSAGE", "Ops! Something Wrong. Try again!");
                    }
                }
            }
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception e) {
            log("Error at Create Warehouse Controller: " + e.toString());
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
            Logger.getLogger(CreateWarehouseController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateWarehouseController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CreateWarehouseController.class.getName()).log(Level.SEVERE, null, ex);
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
            System.out.println("Come here" + ex.toString());
            Logger.getLogger(CreateWarehouseController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateWarehouseController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(CreateWarehouseController.class.getName()).log(Level.SEVERE, null, ex);
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
