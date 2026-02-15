<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Home</title>
</head>
<body>
    <h1>Admin Panel</h1>
    <a href="${pageContext.request.contextPath}/client/home">Client Home</a>
    <br>
    <a href="${pageContext.request.contextPath}/admin/readAllContacts">Read All Contacts</a>
</body>
</html>
