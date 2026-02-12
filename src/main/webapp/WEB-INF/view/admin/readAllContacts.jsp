<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<html>
<head>
    <title>All Contacts</title>
</head>
<body>
    <a href="${pageContext.request.contextPath}/client/home">Client Home</a>
    <a href="${pageContext.request.contextPath}/admin/home">Admin Home</a>

    <c:forEach var="contact" items="${contactData}">
        ${contact.id}<br>
        ${contact.name}<br>
        ${contact.subject}<br>
        ${contact.message}<br><br>


    </c:forEach>

</body>
</html>
