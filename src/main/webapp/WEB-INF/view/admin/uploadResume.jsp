<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/png">
  <title>Upload Resume</title>
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
        <h2>Upload Resume</h2>
        <div class="page_link">
          <a href="${pageContext.request.contextPath}/admin/home">Admin</a>
          <a href="#">Upload Resume</a>
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
    <form action="${pageContext.request.contextPath}/admin/uploadResume" method="post" enctype="multipart/form-data" class="row">
      <div class="col-lg-6 offset-lg-3">
        <div class="form-group">
          <label for="resume">Select Resume (PDF)</label>
          <input type="file" id="resume" name="resume" accept="application/pdf" class="form-control-file">
        </div>
        <div class="text-right">
          <button type="submit" class="primary_btn"><span>Upload</span></button>
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
