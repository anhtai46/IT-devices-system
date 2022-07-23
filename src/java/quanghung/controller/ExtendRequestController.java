/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package quanghung.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manhcuong.request.requestDAO;
import manhcuong.request.requestDetailDTO;

/**
 *
 * @author Admin
 */
public class ExtendRequestController extends HttpServlet {

   private final String SUCCESS = "MainController?action=LoadProcessRequest";
    private final String ERROR = "MainController?search=&action=LoadSuccessfulRequest";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int requestID = Integer.parseInt("requestID");
            String message = request.getParameter("message");
            int extendDate = Integer.parseInt(request.getParameter("extendDate"));
            boolean check = false;
            boolean checkUpdateRequest = false;
            
            requestDAO dao = new requestDAO();
            requestDetailDTO detail = dao.getRequestDetailByRequestID(requestID);
            check = dao.creatExtendRequest(requestID, message, extendDate);
            if(check == true){
                checkUpdateRequest = dao.updateRequestStatus(requestID, "Waiting...");
                
                
            }
            if(check == true && checkUpdateRequest == true ){
                url = SUCCESS;
            }else{
                url = ERROR;
                request.setAttribute("ERROR_MESSAGE", "Error occur in CreateExtend ");
            }
            
        } catch (Exception e) {
            log("Error at CreateRequestController: " + e.toString());
        }finally{
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