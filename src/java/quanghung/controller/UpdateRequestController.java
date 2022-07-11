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

/**
 *
 * @author Admin
 */
public class UpdateRequestController extends HttpServlet {

    
     private final String ERROR = "viewAllRequestManagement.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action.equals("UpdateRequestApproved")){
                int requestID = Integer.parseInt(request.getParameter("requestID"));
                
                requestDAO dao = new requestDAO();
                boolean checkUpdateRequest = dao.updateRequestStatus(requestID, "approve");
                if(checkUpdateRequest){
                    url="requeststaff.jsp";
                }else{
                    url ="requeststaff.jsp";
                }
                request.setAttribute("LIST_PROCESSING_REQUEST", dao.getRequestBaseOnStatusDetail(true, "Waiting"));
                
            }else if(action.equals("UpdateRequestCancel")){
                int requestID = Integer.parseInt(request.getParameter("requestID"));
                int detailID = Integer.parseInt(request.getParameter("detailID"));
                requestDAO dao = new requestDAO();
                boolean checkUpdateRequest= dao.updateRequestStatus(requestID, "cancel");
                boolean checkUpdateDetail = dao.updateDetailStatus(detailID, "cancel");
                if(checkUpdateDetail == true && checkUpdateRequest == true){
                    if(request.getParameter("cancel").equals("requeststaff.jsp")){
                        request.setAttribute("action", "LoadProcessingRequest");
                    }else if(request.getParameter("cancel").equals("approvedrequeststaff.jsp")){
                        request.setAttribute("action", "LoadApprovedRequest");
                    }else if(request.getParameter("cancel").equals("successfulrequeststaff.jsp")){
                        request.setAttribute("action", "LoadSuccessRequest");
                    }
                    url ="LoadAllRequestManager";
                }else{
                    if(request.getParameter("cancel").equals("requeststaff.jsp")){
                        request.setAttribute("action", "LoadProcessingRequest");
                    }else if(request.getParameter("cancel").equals("approvedrequeststaff.jsp")){
                        request.setAttribute("action", "LoadApprovedRequest");
                    }else if(request.getParameter("cancel").equals("successfulrequeststaff.jsp")){
                        request.setAttribute("action", "LoadSuccessRequest");
                    }
                    url = request.getParameter("cancel");
                }
            }else if(action.equals("UpdateRequestSuccess")){
                int detailID = Integer.parseInt(request.getParameter("detailID"));
                requestDAO dao = new requestDAO();
                boolean checkUpdateDetail = dao.updateDetailStatus(detailID, "Success");
                if(checkUpdateDetail){
                    url = "approvedrequeststaff.jsp";
                }else{
                    url ="approvedrequeststaff.jsp";
                }
                request.setAttribute("LIST_APPROVED_REQUEST", dao.getRequestBaseOnStatusDetail(true, "approve"));
            }else if(action.equals("UpdateRequestReturn")){
                
            }
            
        } catch (Exception e) {
            log("Error at UpdateRequestController: " + e.toString());
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
