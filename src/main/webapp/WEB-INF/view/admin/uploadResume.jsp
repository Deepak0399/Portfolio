<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Upload Resume</title>
</head>
<body>
  <h1>Upload Resume</h1>
  <a href="${pageContext.request.contextPath}/client/home">Client Home</a>
  <br>
  <a href="${pageContext.request.contextPath}/admin/home">Admin Home</a>
  <br>
  ${result}
  <br>
  <form action="uploadResume" method="post" enctype="multipart/form-data">
    <input type="file" name="resume">
    <br><br>
    <button>upload</button>
  </form>

</body>
</html>
