<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
  	<%
    response.setDateHeader("Expires",-1);
    response.setHeader("Pragma","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Control-Cache", "no-cache");
		if(session.getAttribute("emp_mail")==null){
			response.sendRedirect("client_index.jsp");
		}
		else
		{
	%>
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
                <!-- Navbar Brand --><a href="client_index.jsp" class="navbar-brand">
                  <div class="brand-text brand-big"><span>Spark</span><strong>Office</strong></div>
                  <div class="brand-text brand-small"><strong>S.O.</strong></div></a>
                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
              </div>
              <!-- Navbar Menu -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Search-->
                <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
                <!-- Logout    -->
                <li class="nav-item">
                <a href="logout.jsp" class="nav-link logout">Logout<i class="fa fa-sign-out"></i></a>
                </li>
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
              <h1 class="h4">
              <a href="client_profile.jsp">Hello,
              <%@page import="Entity.EmployeeEntity" %>
              <% EmployeeEntity emp=(EmployeeEntity) session.getAttribute("client"); %> 
              <%= emp.getEmp_firstName() %>
              </a></h1>
              <p>Employee Panel</p>
            </div>
          </div>
          <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
          <ul class="list-unstyled">
                    <li class="active"><a href="client_home.jsp"> <i class="icon-home"></i>Home </a></li>
                    <li><a href="client_leave.jsp"> <i class="icon-grid"></i>Leave </a></li>
                    <li><a href="client_notice.jsp"> <i class="icon-grid"></i>Show Notice </a></li>
                    

           </ul>

        </nav>


        <div class="content-inner">
          <!-- Page Header-->
          <header class="page-header">
            <div class="container-fluid">
              <h2 class="no-margin-bottom">Dashboard</h2>
            </div>
          </header>
          <!-- Dashboard Counts Section-->
          
          <!-- Dashboard Header Section    -->
          <section class="dashboard-header">
            <div class="container-fluid">
              <div class="row">
                <!-- Statistics -->
                <div class="statistics col-lg-6 col-12">
                 
                  <div class="statistic d-flex align-items-center bg-white has-shadow">
                    <a href="client_notice.jsp" style="text-decoration: none;">
                    <div class="icon bg-red"><i class="fa fa-tasks"></i></div>
                    <div class="text"><strong>Notice</strong></a></div>
                  </div>
                  <div class="statistic d-flex align-items-center bg-white has-shadow">
                    <a href="client_leave.jsp" style="text-decoration: none;">
                    <div class="icon bg-red"><i class="fa fa-tasks"></i></div>
                    <div class="text"><strong>Leave</strong></a></div>
                  </div>
                  <div class="statistic d-flex align-items-center bg-white has-shadow">
                    <form action="AtndController" method="post">
                              <div class="input-group">
                              
                                <input type="hidden" name="emp_id" value="<%= emp.getEmp_id() %>">
                                <span class="input-group-btn">
                                <input type="hidden" name="comp_id" value="<%= emp.getComp_id() %>">
                                <button type="submit" class="btn btn-primary" name="checkin">Check In !</button>
                                &nbsp;
                                <button type="submit" class="btn btn-primary" name="checkout">Check Out !</button></span>
                              </div>
                </form>
                  </div> 
                </div>
                <!-- Line Chart            -->
                <div class="chart col-lg-6 col-12">
                  



                </div>
                <div class="chart col-lg-3 col-12">
                  <!-- Bar Chart   -->
                  <div class="bar-chart has-shadow bg-white">
                    
                  </div>
                  <!-- Numbers-->
                  


                </div>
              </div>
            </div>
          </section>
          
          
          <!-- Page Footer-->
          <footer class="main-footer">
            <div class="container-fluid">
              <div class="row">
                <div class="col-sm-6">
                  <p>Spark Office &copy; 2017</p>
                </div>
                <div class="col-sm-6 text-right">
                  <p>Design & Developed by Rupareliya Akash & Sugnay Borsaniya</p>
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
    <script src="js/charts-home.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
  </body>
</html>
<% } %>