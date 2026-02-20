<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/png">
  <title>Read All Services</title>
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
        <h2>All Services</h2>
        <div class="page_link">
          <a href="${pageContext.request.contextPath}/admin/home">Admin</a>
          <a href="#">Read All Services</a>
        </div>
      </div>
    </div>
  </div>
</section>
<!--================ End Banner Area =================-->

<section class="section_gap">
  <div class="container">
    <div class="row mb-3">
      <div class="col text-right">
        <a class="primary_btn" href="${pageContext.request.contextPath}/admin/addService"><span>Add Service</span></a>
      </div>
    </div>
    <div class="row">
      <c:if test="${not empty result}">
        <div class="col-12 mb-3">
          <div class="alert alert-info" role="alert">${result}</div>
        </div>
      </c:if>
      <c:forEach var="service" items="${listOfServices}">
        <div class="col-md-6 col-lg-4 mb-4">
          <div class="feature_item text-center">
            <img class="img-fluid mb-3" src="${pageContext.request.contextPath}/img/services/${service.fileName}" alt="${service.title}">
            <h4>${service.title}</h4>
            <p>${service.description}</p>
            <div class="mt-2">
              <a class="genric-btn danger circle small" href="${pageContext.request.contextPath}/admin/deleteService?id=${service.id}&fileName=${service.fileName}">Delete</a>
              <a class="genric-btn info circle small" href="${pageContext.request.contextPath}/admin/updateService?id=${service.id}">Update</a>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
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
