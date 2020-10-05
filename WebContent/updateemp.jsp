<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%
   		response.setDateHeader("Expires",-1);
    	response.setHeader("Pragma","no-cache");
    	response.setHeader("Cache-Control","no-store");
    	response.setHeader("Control-Cache", "no-cache");
		if(session.getAttribute("comp")==null){
			response.sendRedirect("login.jsp");
		}
		else
		{
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Spark Office</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <div class="page">
      <!-- Main Navbar-->
      <header class="header">
        <nav class="navbar">
          <!-- Search Box-->
          <div class="search-box">
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="#" role="search">
              <input type="search" placeholder="What are you looking for..." class="form-control">
            </form>
          </div>
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <!-- Navbar Header-->
              <div class="navbar-header">
                <!-- Navbar Brand --><a href="index.jsp" class="navbar-brand">
                  <div class="brand-text brand-big"><span>Spark </span><strong>Office</strong></div>
                  <div class="brand-text brand-small"><strong>S.O.</strong></div></a>
                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
              </div>
              <!-- Navbar Menu -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Search-->
                <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
                <!-- Notifications-->
                <!-- Messages                        -->
                <!-- Logout    -->
                <li class="nav-item"><a href="login.jsp" class="nav-link logout">Logout<i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
      <div class="page-content d-flex align-items-stretch"> 
        <!-- Side Navbar -->
        <nav class="side-navbar">
          <!-- Sidebar Header-->
          <div class="sidebar-header d-flex align-items-center">
            
            <div class="title">
              <h1 class="h4">Company Name</h1>
              <p>Admin panel</p>
            </div>
          </div>
          <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
          <ul class="list-unstyled">
                    <li><a href="index.jsp"> <i class="icon-home"></i>Home </a></li>
                    <li class="active"><a href="showallemp.jsp"> <i class="icon-grid"></i>Show Employees</a></li>
                    <li><a href="addnotice.jsp"> <i class="icon-padnote"></i>Notice</a></li>
        </nav>
        <div class="content-inner">
          <!-- Page Header-->
          <header class="page-header">
            <div class="container-fluid">
              <h2 class="no-margin-bottom">Edit Employee</h2>
            </div>
          </header>
          <!-- Breadcrumb-->
          <div class="breadcrumb-holder container-fluid">
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
              <li class="breadcrumb-item active">Edit Employee </li>
            </ul>
          </div>

          <!--edit Employee -->

           <section class="forms"> 
            <div class="container-fluid">
              <div class="row">
                <!-- Basic Form-->
                <div class="col-lg-6">
                  <div class="card">
                    <div class="card-close">
                      <div class="dropdown">
                        <button type="button" id="closeCard1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                        <div aria-labelledby="closeCard1" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                      </div>
                    </div>
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Edit Employee</h3>
                    </div>
                    <div class="card-body">
                      
                      <div class="content">

         <form action="CompanyController" method="POST">            
            <br>
            <c:forEach var="emplist" items="${employeeList}">
            <div class="form-group">
            <b>Update ID:</b> <input type="text" name="emp_id" class="input-material" value="${emplist.emp_id}" readonly><br>
            </div>
            <div class="form-group">
            <b>Update firstName:</b> <input id="emp_firstName" type="text" name="emp_firstName" class="input-material" value="${emplist.emp_firstName}"><br>
            </div>
            <div class="form-group"> 
            <b>Update middleName:</b> <input id="emp_middleName" type="text" name="emp_middleName" class="input-material" value="${emplist.emp_middleName}"> <br>
            </div>
            <div class="form-group"> 
            <b>Update lastName:</b> <input id="emp_lastName" type="text" name="emp_lastName" class="input-material" value="${emplist.emp_lastName}"><br>
            </div>
            <div class="form-group"> 
            <b>Update position:</b> <input id="emp_position" type="text" name="emp_position" class="input-material" value="${emplist.emp_position}"> <br>
            </div>
            <div class="form-group"> 
            <b>Update email:</b> <input id="emp_mail" type="email" name="emp_mail" class="input-material" value="${emplist.emp_mail}"><br>
            </div>
            <div class="form-group"> 
            <b>Update dob:</b> <input id="emp_dob" type="text" name="emp_dob" class="input-material" value="${emplist.emp_dob}"><br>
            </div>
            <div class="form-group"> 
            <b>Update gender:</b> <input id="emp_gender" type="text" name="emp_gender" class="input-material" value="${emplist.emp_gender}"><br>
            </div>
            <div class="form-group"> 
            <b>Update city:</b> <input id="emp_city" type="text" name="emp_city" class="input-material" value="${emplist.emp_city}"> <br>
            </div>
            <div class="form-group"> 
            <b>Update phone:</b> <input id="emp_phone" type="text" name="emp_phone" class="input-material" value="${emplist.emp_phone}"><br>
            </div>
            <div class="form-group"> 
            <b>Update userId:</b> <input id="emp_userId" type="text" name="emp_userId" class="input-material" value="${emplist.emp_userId}"> <br>
            </div>
            <div class="form-group"> 
            <b>Update password:</b> <input id="emp_password" type="text" name="emp_password" class="input-material" value="${emplist.emp_password}"> <br><br>
            </div>
            <input type="submit" name="updateEmployee" value="updateEmployee" class="btn btn-primary">
        </c:forEach>
        </form>
            </div>
                    </div>
                  </div>
                </div>
         </div>
       </section>
          <!-- Page Footer-->
          <footer class="main-footer">
            <div class="container-fluid">
              <div class="row">
                <div class="col-sm-6">
                  <p>Spark Office &copy; 2017-2019</p>
                </div>
                <div class="col-sm-6 text-right">
               <p>Design & Developed by Paras Manavdariya & Keyur Chandarana</p>
                  <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                </div>
              </div>
            </div>
          </footer>
        </div>
      </div>
    </div>
    <!-- Javascript files-->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
  </body>
</html>
<%
		}
%>