<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Contacts</title>
</head>
<body>
    <h1>All Contacts</h1>
    <a href="${pageContext.request.contextPath}/client/home">Client Home</a>
    <br>
    <a href="${pageContext.request.contextPath}/admin/home">Admin Home</a>

    <c:forEach var="contact" items="${contactData}">
        ${contact.id}<br>
        ${contact.name}<br>
        ${contact.subject}<br>
        ${contact.message}<br><br>
        <a href="${pageContext.request.contextPath}/admin/deleteContactById?id=${contact.id}">DELETE</a>

    </c:forEach>

</body>
</html>
