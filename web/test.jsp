<%-- 
    Document   : test
    Created on : Jun 29, 2022, 1:56:56 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <button class="btn btn-secondary" type="submit" name="action" value="LoadAllRequestManager">Load All request</button></a>
       <table class="table text-center">
                    <thead>
                        <tr>
                            <th>Request ID</th>
                            <th>Username</th>
                            <th>Date</th>
                            <th>Substance</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach var="request" varStatus="counter" items="${requestScope.LIST_REQUEST}">
                        <tr>
                            <td>${request.requestID}</td>
                            <td>${request.user.userName}</td>
                            <td>${request.requestDate}</td>
                            <td>${request.requestSubstance}</td>
                            <td>${request.requestStatus}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
    </body>
</html>
