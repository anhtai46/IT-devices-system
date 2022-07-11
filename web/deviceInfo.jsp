

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="deviceName" value="${sessionScope.DEVICE_NAME}"/>
        <c:set var="cateName" value="${sessionScope.CATE_NAME}"/>
        <c:set var="warehouseName" value="${sessionScope.WAREHOUSE_NAME}"/>
        <c:set var="descriptionList" value="${sessionScope.DESCRIPTION_LIST}"/>
        <c:set var="brandList" value="${sessionScope.BRAND_LIST}"/>

        <h1>Input device's information:</h1>
        <form action="MainController" method="POST">
            Device Name: <input type="text" name="deviceName"  value="${deviceName}" /></br>
            Category Name<input type="text" name="cateName"  value="${cateName}" readonly></br>
            Warehouse Name<input type="text" name="warehouseName" value="${warehouseName}" readonly></br>
            Brand Name        
            <select name="brandID">
                <c:forEach var="brand" items="${brandList}">
                    <option value="${brand.key}">${brand.value}</option>
                </c:forEach>
            </select> </br>
            Quantity<input type="number" name="quantity" required=""/></br>
            <c:forEach var="description" items="${descriptionList}" varStatus="counter">
                ${description.descriptionName}
                <c:set var="detailID" value='detailID${counter.count}'/>
                <select name="${detailID}">   
                    <c:forEach var="detail" items="${sessionScope[description.descriptionName]}">
                        <option value="${detail.getDetailID()}">${detail.getDetailName()}</option>
                    </c:forEach>
                </select> </br>
                <c:set var="detailID" value='detailID'/>
            </c:forEach>

            <input type="submit" name="action" value="CreateDevice"/>
            <input type="reset"  value="Reset"/>
        </form>
    </body>

</html>

