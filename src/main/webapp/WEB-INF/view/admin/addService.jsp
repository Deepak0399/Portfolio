<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/png">
  <title>Add Service</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/linericon/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/nice-select/css/nice-select.css">
  <!-- main css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<!--================ Start Header Area =================-->
<%@include file="../header.jsp"%>
<!--================ End Header Area =================-->

<!--================ Start Banner Area =================-->
<section class="banner_area">
  <div class="banner_inner d-flex align-items-center">
    <div class="container">
      <div class="banner_content text-center">
        <h2>Add Service</h2>
        <div class="page_link">
          <a href="${pageContext.request.contextPath}/admin/home">Admin</a>
          <a href="#">Add Service</a>
        </div>
      </div>
    </div>
  </div>
</section>
<!--================ End Banner Area =================-->

<section class="section_gap">
  <div class="container">
    <c:if test="${not empty result}">
      <div class="alert alert-info" role="alert">${result}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/admin/addService" method="post" enctype="multipart/form-data" class="row">
      <div class="col-lg-8 offset-lg-2">
        <div class="form-group">
          <label for="title">Title</label>
          <input type="text" id="title" name="title" class="form-control" placeholder="Enter title">
          <small class="text-danger">
            <c:forEach var="err" items="${errors}">
              <c:if test="${err.field == 'title'}">${err.defaultMessage}</c:if>
            </c:forEach>
          </small>
        </div>
        <div class="form-group">
          <label for="description">Description</label>
          <textarea id="description" name="description" class="form-control" rows="4" placeholder="Enter Description Here..."></textarea>
          <small class="text-danger">
            <c:forEach var="err" items="${errors}">
              <c:if test="${err.field == 'description'}">${err.defaultMessage}</c:if>
            </c:forEach>
          </small>
        </div>
        <div class="form-group">
          <label for="serviceFile">Service Image</label>
          <input type="file" id="serviceFile" name="serviceFile" class="form-control-file">
          <small class="text-danger">${fileError}</small>
        </div>
        <div class="text-right">
          <button type="submit" name="save" class="primary_btn"><span>Save</span></button>
          <a class="genric-btn default circle" href="${pageContext.request.contextPath}/admin/home">Cancel</a>
        </div>
      </div>
    </form>
  </div>
</section>

<!--================Footer Area =================-->
<%@include file="../footer.jsp"%>
<!--================End Footer Area =================-->

<!-- Optional JavaScript -->
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/stellar.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/vendors/nice-select/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/vendors/isotope/imagesloaded.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath}/vendors/isotope/isotope-min.js"></script>
<script src="${pageContext.request.contextPath}/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ajaxchimp.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mail-script.js"></script>
<script src="${pageContext.request.contextPath}/js/theme.js"></script>
</body>
</html>
