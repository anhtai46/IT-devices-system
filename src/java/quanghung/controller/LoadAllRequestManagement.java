/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package quanghung.controller;

import DLC.MessageSpecified;
import duonght.dao.AccountDao;
import duonght.dto.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import manhcuong.request.requestDAO;
import manhcuong.request.requestDTO;

/**
 *
 * @author Admin
 */
public class LoadAllRequestManagement extends HttpServlet {

    private final String ALL_REQUEST = "viewAllRequestManagement.jsp";
    private final String PROCESSING_REQUEST = "requeststaff.jsp";
    private final String APPROVED_REQUEST = "approvedrequeststaff.jsp";
    private final String SUCCESSFULL_REQUEST = "successfulrequeststaff.jsp";
    private final String RETURNED_REQUEST = "returnedrequeststaff";
    private final String CANCEL_REQUEST = "cancelrequeststaff.jsp";
    private final String ERROR = "viewAllRequestManagement.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action.equals("LoadAllRequestManager")) {
                requestDAO o_dao = new requestDAO();
                
                List<requestDTO> list = new ArrayList<>();
                /*for (Account user : users){
                list.addAll(o_dao.getOrderByUserID(user.getUserID(), true));
                list.addAll(o_dao.getOrderByUserID(user.getUserID(), false));
            }*/

                ///mod
                list.addAll(o_dao.getOrders(true));
                list.addAll(o_dao.getOrders(false));
                //end mod

                Collections.sort(list);
                if (!list.isEmpty()) {
                    request.setAttribute("LIST_REQUEST", list);
                    //request.setAttribute("LIST_USER", users);
                    url = ALL_REQUEST;
                } else {
                    MessageSpecified message = new MessageSpecified(null, "Empty", "Don't have any request!");
                    request.setAttribute("ERROR_MESSAGE", message);
                }
            }else if(action.equals("LoadProcessingRequest")){
                requestDAO o_dao = new requestDAO();
                List<requestDTO> list = new ArrayList<>();
                list.addAll(o_dao.getRequestBaseOnStatusDetail(true, "Waiting"));
                list.addAll(o_dao.getRequestBaseOnStatusDetail(false, "Waiting"));
                Collections.sort(list);
                if(!list.isEmpty()){
                    request.setAttribute("LIST_PROCESSING_REQUEST", list);
                    url = PROCESSING_REQUEST;
                }
                else{
                    MessageSpecified message = new MessageSpecified(null, "Empty", "Don't have any processing request!");
                    request.setAttribute("ERROR_MESSAGE", message);
                }
                
            }else if(action.equals("LoadApprovedRequest")){
                requestDAO o_dao = new requestDAO();
                List<requestDTO> list = new ArrayList<>();
                list.addAll(o_dao.getRequestBaseOnStatusDetail(true, "approve"));
                list.addAll(o_dao.getRequestBaseOnStatusDetail(false, "approve"));
                Collections.sort(list);
                if(!list.isEmpty()){
                    request.setAttribute("LIST_APPROVED_REQUEST", list);
                    url = APPROVED_REQUEST;
                }
                else{
                    MessageSpecified message = new MessageSpecified(null, "Empty", "Don't have any processing request!");
                    request.setAttribute("ERROR_MESSAGE", message);
                }
            }else if(action.equals("LoadSuccessRequest")){
                requestDAO o_dao = new requestDAO();
                List<requestDTO> list = new ArrayList<>();
                list.addAll(o_dao.getRequestBaseOnDetailStatus(true, "received"));
                list.addAll(o_dao.getRequestBaseOnDetailStatus(false, "received"));
                Collections.sort(list);
                if(!list.isEmpty()){
                    request.setAttribute("LIST_SUCCESSFUL_REQUEST", list);
                    url = SUCCESSFULL_REQUEST;
                }
                else{
                    MessageSpecified message = new MessageSpecified(null, "Empty", "Don't have any returned request!");
                    request.setAttribute("ERROR_MESSAGE", message);
                }
            }else if(action.equals("LoadReturnedRequest")){
                requestDAO o_dao = new requestDAO();
                List<requestDTO> list = new ArrayList<>();
                list.addAll(o_dao.getRequestBaseOnStatusDetail(true, "returned"));
                list.addAll(o_dao.getRequestBaseOnStatusDetail(false, "returned"));
                Collections.sort(list);
                if(!list.isEmpty()){
                    request.setAttribute("LIST_RETURNED_REQUEST", list);
                    url = RETURNED_REQUEST;
                }
                else{
                    MessageSpecified message = new MessageSpecified(null, "Empty", "Don't have any returned request!");
                    request.setAttribute("ERROR_MESSAGE", message);
                }
            }else if(action.equals("LoadCanceledRequest")){
                requestDAO o_dao = new requestDAO();
                List<requestDTO> list = new ArrayList<>();
                list.addAll(o_dao.getRequestBaseOnStatusDetail(true, "cancel"));
                list.addAll(o_dao.getRequestBaseOnStatusDetail(false, "cancel"));
                Collections.sort(list);
                if(!list.isEmpty()){
                    request.setAttribute("LIST_CANCEL_REQUEST", list);
                    url = CANCEL_REQUEST;
                }
                else{
                    MessageSpecified message = new MessageSpecified(null, "Empty", "Don't have any processing request!");
                    request.setAttribute("ERROR_MESSAGE", message);
                }
            }

        } catch (Exception e) {
            log("Error at LoadOrderController: " + e.toString());
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
