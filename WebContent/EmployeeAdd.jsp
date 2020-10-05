<%response.setDateHeader("Expires",-1);
    response.setHeader("Pragma","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Control-Cache", "no-cache");
	if(session.getAttribute("comp")==null){
		response.sendRedirect("login.jsp");
	}
	else
	{%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="Authentication.CompanyLoginService"%>
<%@page import="java.util.Date"%>
<%@page import="Entity.CompanyEntity"%>
<%
	CompanyEntity comp = (CompanyEntity) session.getAttribute("comp");
%>

<!DOCTYPE HTML>
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
    <link rel="stylesheet" href="https://font	s.googleapis.com/css?family=Poppins:300,400,700">
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

<div class="page login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <!-- Logo & Information Panel-->
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">

                    <h1>Admin</h1>

                    <h2>Spark Office Login</h2>

                  </div>
                  <p>We Provides Best Employee Management System<br>For Your Greate Business</p>
                </div>
              </div>
            </div>
            <!-- Form Panel    -->
            <div class="col-lg-6 bg-white">
              <div class="form d-flex align-items-center">
                <div class="content">
      <form method="POST" action="CompanyController" id="login-form">
      <div class="form-group">       
      <input type="text" name="firstName" id="firstName" required class="input-material">
      <label for="firstName" class="label-material">firstName</label>
      </div>
      <div class="form-group">
      <input type="text" name="middleName" id="middleName" required class="input-material">
      <label for="middleName" class="label-material">middleName</label>
      </div>
      <div class="form-group">
	  <input type="text" name="lastName" id="lastName" required class="input-material">
	  <label for="lastName" class="label-material">lastName</label>
	  </div>
	  <div class="form-group">
      <input type="text" name="position" id="position" required class="input-material">
      <label for="position" class="label-material">position</label>
      </div>
	  <div class="form-group">
      <input type="email" name="email" id="email" required class="input-material">
      <label for="email" class="label-material">email</label>
      </div>
      <div class="form-group">
      <input type="text" name="city" id="city" required class="input-material">
      <label for="city" class="label-material">city</label>
      </div>
      <div class="form-group">
	  <input type="number" name="phone" id="phone" required class="input-material">
	  <label for="phone" class="label-material">phone</label>
	  </div>
	  
	  <p> Enter your account details below</p>
	  <div class="form-group">
      <input type="text" name="userId" id="userId" required class="input-material">
      <label for="userId" class="label-material">userId</label>
      </div>
      <div class="form-group">
      <input type="password" name="password" id="password" required class="input-material">
      <label for="password" class="label-material">Password</label>
      </div>
      <div class="form-group">
      <input type="password" name="confpassword" id="confpassword" required class="input-material">
      <label for="confpassword" class="label-material">confpassword</label>
      </div>
      <label class="checkbox-custom check-success">
          <input type="checkbox" value="agree this condition" id="checkbox1" required> <label for="checkbox1">I agree to the Terms of Service and Privacy Policy</label>
      </label>
      <input class="btn btn-lg btn-success1 btn-block" type="submit" class="input-material" value="Submit" name="addEmployee">
      <div class="registration">
          Already Registered.
          <a class="" href="login.jsp">
              Login
          </a>
      </div>
  </form>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="copyrights text-center">
        <p>Design & Developed by Paras Manavdariya & Keyur Chandarana</p>
                  
        <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
      </div>
    </div>
	  
	
	
	    <!-- Javascript files-->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/jquery-validation/jquery.validate.min.js"></script>
    <!-- Main File-->
    <script src="js/front.js"></script>
	
</body>
</html>
<%
	}
%>