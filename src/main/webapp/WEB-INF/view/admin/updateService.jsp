<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!Doctype html>
<html lang="en">
<head>
    <title>Update Service</title>
</head>
<body>

    <h2>Update Service</h2>
    <br>
    <form action="${pageContext.request.contextPath}/admin/updateService" method="post" enctype="multipart/form-data">

        <input type="hidden" name="id" value="${serviceData.id}"><br>
        <input type="hidden" name="oldFileName" value="${serviceData.fileName}">
        <input type="text" name="title" placeholder="enter title" value="${serviceData.title}"/>
        <br>
        <textarea name="description" placeholder="Enter Description Here...">${serviceData.description}</textarea>
        <br>
        <input type="file" name="serviceFile">
        <br><br>
        <button>save</button>
    </form>
</body>
</html>
