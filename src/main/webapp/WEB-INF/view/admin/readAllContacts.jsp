<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/png">
  <title>All Contacts</title>
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
        <h2>All Contacts</h2>
        <div class="page_link">
          <a href="${pageContext.request.contextPath}/admin/home">Admin</a>
          <a href="#">Read All Contacts</a>
        </div>
      </div>
    </div>
  </div>
</section>
<!--================ End Banner Area =================-->

<section class="section_gap">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Subject</th>
                <th>Message</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="contact" items="${contactData}">
                <tr>
                  <td>${contact.id}</td>
                  <td>${contact.name}</td>
                  <td>${contact.subject}</td>
                  <td>${contact.message}</td>
                  <td>
                    <a class="genric-btn danger circle small" href="${pageContext.request.contextPath}/admin/deleteContact?id=${contact.id}">Delete</a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
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
