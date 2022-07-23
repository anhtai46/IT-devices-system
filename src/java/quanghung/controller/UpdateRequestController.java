/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package quanghung.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import manhcuong.request.requestDAO;
import manhcuong.request.requestDTO;

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
                int detailID = Integer.parseInt(request.getParameter("detailID"));
                requestDAO dao = new requestDAO();
                //checkUpdateDate = dao.updateRequestExpiredDateForExtend(detail.getDetailID(), extendDate);
                boolean checkUpdateRequest = dao.updateRequestStatus(requestID, "approve");
                boolean checkUpdateRequestDetail = dao.updateDetailStatus(detailID, "approve");
                if(checkUpdateRequest== true && checkUpdateRequestDetail == true){
                    url="MainController?action=LoadProcessingRequest";
                }else{
                    url ="MainController?action=LoadProcessingRequest";
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
                        
                        url ="MainController?action=LoadProcessingRequest";
                    }
                    
                }else{
                    if(request.getParameter("cancel").equals("requeststaff.jsp")){
                        url = "MainController?action=LoadProcessRequest";
                    }else if(request.getParameter("cancel").equals("approvedrequeststaff.jsp")){
                        url = "MainController?action=LoadApproveRequest";
                    }else if(request.getParameter("cancel").equals("successfulrequeststaff.jsp")){
                        url = "MainController?action=LoadSuccessfulRequest";
                    }
                    
                }
            }else if(action.equals("UpdateRequestSuccess")){
                int detailID = Integer.parseInt(request.getParameter("detailID"));
                requestDAO dao = new requestDAO();
                boolean checkUpdateDetail = dao.updateDetailStatus(detailID, "Received");
                boolean checkUpdateDate = dao.updateRequestBorrowDate(detailID, new Date(System.currentTimeMillis()));
                List<requestDTO> list1 = new ArrayList<>();
                List<requestDTO> list2 = new ArrayList<>();
                list1.addAll(dao.getRequestBaseOnStatusDetail(true, "approve"));
                for(int i = 0; i < list1.size(); i++){
                    if(!list1.get(i).getRequestStatus().equalsIgnoreCase("Waiting...")){
                        list2.add(list1.get(i));
                    }
                }
                if(checkUpdateDetail == true && checkUpdateDate == true){
                    url = "approvedrequeststaff.jsp";
                }else{
                    url ="approvedrequeststaff.jsp";
                }
                request.setAttribute("LIST_APPROVED_REQUEST", list2);
            }else if(action.equals("UpdateRequestReturn")){
                int requestID = Integer.parseInt(request.getParameter("requestID"));
                int detailID = Integer.parseInt(request.getParameter("detailID"));
                requestDAO dao = new requestDAO();
                boolean checkUpdateRequest= dao.updateRequestStatus(requestID, "Returned");
                boolean checkUpdateDetail = dao.updateDetailStatus(detailID, "Returned");
                requestDTO request2 = dao.getRequestByID(requestID);
                boolean checkCreateReturn = dao.creatReturnRequest(request2);
                if(checkCreateReturn == true && checkUpdateDetail == true && checkUpdateRequest == true){
                    url = "MainController?action=LoadSuccessRequest";
                }
                
                
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