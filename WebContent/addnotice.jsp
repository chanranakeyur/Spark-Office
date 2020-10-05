<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="Authentication.CompanyLoginService"%>
<%@page import="java.util.Date"%>
<%@page import="Entity.CompanyEntity"%>
<%
	CompanyEntity comp = (CompanyEntity) session.getAttribute("comp");
%>
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
              <h1 class="h4"><%= comp.getComp_name()%></h1>
              <p>Admin panel</p>
            </div>
          </div>
          <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
          <ul class="list-unstyled">
                    <li><a href="index.jsp"> <i class="icon-home"></i>Home </a></li>
                    <li><a href="showallemp.jsp"> <i class="icon-grid"></i>Show Employees</a></li>
                    <li class="active"><a href="addnotice.jsp"> <i class="icon-padnote"></i>Notice</a></li>
                    

        </nav>
        <div class="content-inner">
          <!-- Page Header-->
          <header class="page-header">
            <div class="container-fluid">
              <h2 class="no-margin-bottom">Notice</h2>
            </div>
          </header>
          <!-- Breadcrumb-->
          <div class="breadcrumb-holder container-fluid">
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
              <li class="breadcrumb-item active">Notice</li>
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
                      <h3 class="h4">Add Notice</h3>
                    </div>
                    <div class="card-body">
                      
                      <div class="content">
			  
              
         <form action="CompanyController" method="POST">            
            <br>
            <div class="form-group">
            <b>Department ID:</b><input type="number" name="dept_id" class="input-material"><br>
            </div>
            <div class="form-group">
            <b>Notice Subject:</b><input type="text" name="notice_title" class="input-material"><br>
            </div>
            <div class="form-group">
            <b>Notice Description:</b> <input type="text" name="notice_des" class="input-material"><br>
            </div>
      		<input type="hidden" name="comp_id" value="<%= comp.getComp_id() %>">
            <input type="submit" name="saveNotice" value="Publish" class="btn btn-primary">
        </form>
        <br>
        
            </div>
                    </div>
                  </div>
                </div>
                
               <div class="col-lg-6">
                 <div class="card">
                 <div class="card-close">
                      <div class="dropdown">
                        <button type="button" id="closeCard1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i></button>
                        <div aria-labelledby="closeCard1" class="dropdown-menu dropdown-menu-right has-shadow"><a href="#" class="dropdown-item remove"> <i class="fa fa-times"></i>Close</a><a href="#" class="dropdown-item edit"> <i class="fa fa-gear"></i>Edit</a></div>
                      </div>
                    </div>
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Delete Notice</h3>
                    </div>
                    <div class="card-body">
                      	<div class="content">
                      	
                      	
                     	
			<form action="CompanyController" method="post">
            <div class="form-group">
            <b>Notice ID:</b> <input type="number" name="notice_id" class="input-material">
            </div>
             <div class="form-inline">
            <input type="submit" name="deleteNotice" value="Delete" class="btn btn-primary">
        	</form>
        			<form action="NoticeController" method="POST">
               		<input type="hidden" name="comp_id" value="<%= comp.getComp_id() %>">
               		<input type="submit" name="showNotice" value="show" class="btn btn-primary">
                    </form>
                    
            			</div>
                    </div>
                    </div>
                    <div class="card-header d-flex align-items-center">
                      <h3 class="h4">Show Notice</h3>
                    </div>
                    <div class="card-body">
                      	<div class="content">
                      	
<table id="myTable" border="1">
  <tr class="header">
    <th>Notice ID</th>
    <th>Department ID</th>
    <th>Notice Title</th>
  </tr>
<c:forEach var="emp" items="${noticeList}">
  <tr>
    <td>${emp.notice_id}</td>
    <td>${emp.dept_id}</td>
    <td>${emp.notice_title}</td>
  </tr> 
  </c:forEach>
</table>
                      	</div>
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