<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Services</title>
</head>
<body>
<h1>Add Service</h1>

<a href="${pageContext.request.contextPath}/client/home">Client Home</a>
<br>
<a href="${pageContext.request.contextPath}/admin/home">Admin Home</a>
<br>
    ${result}
    <br>

    <form action="${pageContext.request.contextPath}/admin/addService" method="post" enctype="multipart/form-data">
        <c:forEach var="err" items="${errors}">
            <c:if test="${err.field == 'title'}"> ${err.defaultMessage} </c:if>
        </c:forEach>
        <br>
        <input type="text" name="title" placeholder="enter title"/>
        <br>
        <c:forEach var="err" items="${errors}">
            <c:if test="${err.field == 'description'}">${err.defaultMessage}</c:if>
        </c:forEach>
        <br>
            <textarea name="description">Enter Description Here...</textarea>
        <br>
        ${fileError}
        <br>
        <input type="file" name="serviceFile">
        <br><br>
        <button type="submit" name="save">save</button>


    </form>
</body>
</html>
