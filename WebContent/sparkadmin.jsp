<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    	response.setDateHeader("Expires",-1);
    	response.setHeader("Pragma","no-cache");
    	response.setHeader("Cache-Control","no-store");
    	response.setHeader("Control-Cache", "no-cache");
    
    	if(session.getAttribute("spark")==null)
    	{
    		response.sendRedirect("MainAdminlogin.jsp");
    	}
    	else
    	{
    	
%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>

<%@page import="java.util.Date"%>
<%@page import="Entity.CompanyEntity"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}

</style>  

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
                  <div class="brand-text brand-big"><span>Spark</span><strong>Office</strong></div>
                  <div class="brand-text brand-small"><strong>S.O.</strong></div></a>
                <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>
              </div>
              <!-- Navbar Menu -->
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Search-->
                <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li>
                
                <!-- Logout    -->
                <li class="nav-item"><a href="sparklogout.jsp" class="nav-link logout">Logout<i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>
      <div class="page-content d-flex align-items-stretch"> 
        <!-- Side Navbar -->
        <nav class="side-navbar">
       
          <ul class="list-unstyled">
                    <li class="active"><a href="sparkadmin.jsp"> <i class="icon-home"></i>Home </a></li>
                    

           </ul>

        </nav>


        <div class="content-inner">
          <!-- Page Header-->
          <header class="page-header">
            <div class="container-fluid">
              <h2 class="no-margin-bottom">Dashboard For Founders</h2>
            </div>
          </header>
         
          <section class="dashboard-header">
            <div class="container-fluid">
              <div class="row">
                <!-- Statistics -->
                
                <div class="statistics col-lg-3 col-12">

                  <div class="statistic d-flex align-items-center bg-white has-shadow">
                    <a href="addcompany.jsp" style="text-decoration: none;">
                    <div class="icon bg-red"><i class="fa fa-tasks"></i></div>
                    <div class="text"><strong>Add</strong><br><small>Company</small></a></div>
                    
                  </div>
              </div>

               <div class="statistics col-lg-8 col-12">



                <form class="form-inline" action="CompanyController" method="POST">
                        <div class="form-group">
                          <input id="inlineFormInput" name="comp_id" type="text" placeholder="Enter Company ID" class="mr-3 form-control">
                        </div>
                        
                        <div class="form-group">
                          <button type="submit" name="compDelete" class="btn btn-primary">Delete</button>&nbsp;<button type="submit" name="showAllComp" class="btn btn-primary">Show</button>
                        </div>
                      </form>
                          </div>
                  </div>

  <!-- table start -->
               			
                    
                   
                    <div class="card-body">
<table id="myTable" border="1">
  <tr class="header">
    <th>Company ID</th>
    <th>Company Name</th>
    <th>Company Phone</th>
    <th>Company Address</th>
    <th>Company Fax</th>
    <th>Company Mail</th>
   	<th>Company Password</th>
  </tr>
  <c:forEach var="compList" items="${compList}">
  <tr>
  	<td>${compList.comp_id}</td>
    <td>${compList.comp_name}</td>
    <td>${compList.comp_phone}</td>
    <td>${compList.comp_address}</td>
    <td>${compList.comp_fax}</td>
    <td>${compList.comp_mail}</td>
    <td>${compList.comp_password}</td>
  </tr> 
  </c:forEach>
</table>
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
    <script src="js/charts-home.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
  </body>
</html>

<%
}
%>