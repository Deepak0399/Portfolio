<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Read All Services</title>
</head>
<body>
    <h1>All Services</h1>
    <a href="${pageContext.request.contextPath}/client/home">Client Home</a>
    <br>
    <a href="${pageContext.request.contextPath}/admin/home">Admin Home</a>
    <br>
    <a href="${pageContext.request.contextPath}/admin/addService">Add Service</a>
    <br>

    <c:forEach var="service" items="${listOfServices}">
        <div class="feature_item">
            <img style="width: 300px; height: auto" src="${pageContext.request.contextPath}/img/services/${service.fileName}" alt="">
            <h4>${service.title}</h4>
            <p>${service.description}</p>
            <a href="${pageContext.request.contextPath}/admin/deleteService?id=${service.id}&fileName=${service.fileName}">Delete</a>
            <br>
            <a href="${pageContext.request.contextPath}/admin/updateService?id=${service.id}">Update</a>
        </div>
    </c:forEach>
</body>
</html>
