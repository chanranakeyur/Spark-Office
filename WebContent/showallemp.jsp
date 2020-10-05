<%@page import="DAOImpl.CompanyDAOImpl"%>
<%@page import="Entity.EmployeeEntity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="Authentication.CompanyLoginService"%>
<%@page import="java.util.Date"%>
<%@page import="Entity.CompanyEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
	CompanyEntity comp = (CompanyEntity) session.getAttribute("comp");
	CompanyDAOImpl compdaoimpl = new CompanyDAOImpl();
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
		int comp_id = comp.getComp_id();
		List<EmployeeEntity> employeeList = new ArrayList<EmployeeEntity>();
        employeeList = compdaoimpl.showAllEmployee(comp_id);
        request.setAttribute("employeeList", employeeList);
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bubbly - Boootstrap 4 Admin template by Bootstrapious.com</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.css">


    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png?3">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <!-- navbar-->
	<header class="header">
      <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow"><a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i class="fas fa-align-left"></i></a><a href="index.jsp" class="navbar-brand font-weight-bold text-uppercase text-base">The Spark 2.0</a>
        <ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
          <li class="nav-item">
            <form id="searchForm" class="ml-auto d-none d-lg-block">
              <div class="form-group position-relative mb-0">
                <button type="submit" style="top: -3px; left: 0;" class="position-absolute bg-white border-0 p-0"><i class="o-search-magnify-1 text-gray text-lg"></i></button>
                <input type="search" placeholder="Search ..." class="form-control form-control-sm border-0 no-shadow pl-4">
              </div>
            </form>
          </li>
          <li class="nav-item dropdown mr-3"><a id="notifications" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle text-gray-400 px-1"><i class="fa fa-bell"></i><span class="notification-icon"></span></a>
            <div aria-labelledby="notifications" class="dropdown-menu"><a href="#" class="dropdown-item">
                <div class="d-flex align-items-center">
                  <div class="icon icon-sm bg-violet text-white"><i class="fab fa-twitter"></i></div>
                  <div class="text ml-2">
                    <p class="mb-0">You have 2 followers</p>
                  </div>
                </div></a><a href="#" class="dropdown-item"> 
                <div class="d-flex align-items-center">
                  <div class="icon icon-sm bg-green text-white"><i class="fas fa-envelope"></i></div>
                  <div class="text ml-2">
                    <p class="mb-0">You have 6 new messages</p>
                  </div>
                </div></a><a href="#" class="dropdown-item">
                <div class="d-flex align-items-center">
                  <div class="icon icon-sm bg-blue text-white"><i class="fas fa-upload"></i></div>
                  <div class="text ml-2">
                    <p class="mb-0">Server rebooted</p>
                  </div>
                </div></a><a href="#" class="dropdown-item">
                <div class="d-flex align-items-center">
                  <div class="icon icon-sm bg-violet text-white"><i class="fab fa-twitter"></i></div>
                  <div class="text ml-2">
                    <p class="mb-0">You have 2 followers</p>
                  </div>
                </div></a>
              <div class="dropdown-divider"></div><a href="#" class="dropdown-item text-center"><small class="font-weight-bold headings-font-family text-uppercase">View all notifications</small></a>
            </div>
          </li>
          <li class="nav-item dropdown ml-auto"><a id="userInfo" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><img src="img/avatar-6.jpg" alt="Jason Doe" style="max-width: 2.5rem;" class="img-fluid rounded-circle shadow"></a>
            <div aria-labelledby="userInfo" class="dropdown-menu"><a href="#" class="dropdown-item"><strong class="d-block text-uppercase headings-font-family">Company Name</strong><small>Web Developer</small></a>
              <div class="dropdown-divider"></div><a href="#" class="dropdown-item">Settings</a><a href="#" class="dropdown-item">Activity log       </a>
              <div class="dropdown-divider"></div><a href="logout.jsp" class="dropdown-item">Logout</a>
            </div>
          </li>
        </ul>
      </nav>
    </header>
    <div class="d-flex align-items-stretch">
      <div id="sidebar" class="sidebar py-3">
        <div class="text-gray-400 text-uppercase px-3 px-lg-4 py-4 font-weight-bold small headings-font-family">MAIN</div>
        <ul class="sidebar-menu list-unstyled">
              <li class="sidebar-list-item"><a href="index.jsp" class="sidebar-link text-muted"><i class="o-home-1 mr-3 text-gray"></i><span>Home</span></a></li>
              <li class="sidebar-list-item"><a href="showallemp.jsp" class="sidebar-link text-muted active"><i class="o-table-content-1 mr-3 text-gray"></i><span>Employee</span></a></li>
              <li class="sidebar-list-item"><a href="forms.html" class="sidebar-link text-muted"><i class="o-survey-1 mr-3 text-gray"></i><span>Forms</span></a></li>
          <li class="sidebar-list-item"><a href="#" data-toggle="collapse" data-target="#pages" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>Pages</span></a>
       
          </li>
              <li class="sidebar-list-item"><a href="login.html" class="sidebar-link text-muted"><i class="o-exit-1 mr-3 text-gray"></i><span>Login</span></a></li>
        </ul>
      </div>
      
      <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
          <section class="py-5">
            <div class="row">
              <div class="col-md-12 mb-4">
                <div class="card">
                  <div class="card-header">
                    <h6 class="text-uppercase mb-0">Employees</h6>
                    <h6 class="text-uppercase mb-0" align="right">Add Your Valuable Employees <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-primary">Add</button></h6>
                  </div>
                  
                  <div class="card-body">     
                  <div id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
                      <div role="document" class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h4 id="exampleModalLabel" class="modal-title">Add Employee</h4>
                            <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                          </div>
                          <div class="modal-body">
                            <p>Enter Details of Your Employee</p>
                            <form method="POST" action="CompanyController">
                              <input type="hidden" name="comp_id" value="<%=comp.getComp_id()%>">
                              <div class="form-group">
                                <label>Department ID</label>
                                <input type="number" name="dept_id" id="dept_id" required class="form-control" placeholder="Department ID">
                              </div>
                              <div class="form-group">
                                <label>First Name</label>
                                <input type="text" name="emp_firstName" id="emp_firstName" required class="form-control" placeholder="First Name">
                              </div>
                              <div class="form-group">
                                <label>Middle Name</label>
                                <input type="text" name="emp_middleName" id="emp_middleName" required class="form-control"  placeholder="Middle Name">      
                              </div>
                              <div class="form-group">
                                <label>Last Name</label>
                                <input type="text" name="emp_lastName" id="emp_lastName" required class="form-control"  placeholder="Last Name">
                              </div>
                              <div class="form-group">
                                <label>Position</label>
                                <input type="text" name="emp_position" id="emp_position" required class="form-control"  placeholder="Position">
                              </div>
                              <div class="form-group">
                                <label>E-Mail</label>
                                <input type="email" name="emp_mail" id="emp_mail" required class="form-control"  placeholder="E-Mail">
                              </div>
                              <div class="form-group">
                                <label>Date Of Birth</label>
                                <input type="date" name="emp_dob" id="emp_dob" required class="form-control"  placeholder="Date Of Birth">
                              </div>
                              <div class="custom-control custom-radio custom-control-inline">
                                <input id="customRadioInline1" type="radio" name="emp_gender" class="custom-control-input">
                                <label for="customRadioInline1" class="custom-control-label">Male</label>
                          	  </div>
                          	  <div class="custom-control custom-radio custom-control-inline">
                                <input id="customRadioInline2" type="radio" name="emp_gender" class="custom-control-input">
                                <label for="customRadioInline2" class="custom-control-label">Female</label>
                              </div>
                              <div class="form-group">
                                <label>City</label>
                                <input type="text" name="emp_city" id="emp_city" required class="form-control"  placeholder="City">
                              </div>
                              <div class="form-group">
                                <label>Phone</label>
                                <input type="number" name="emp_phone" id="emp_phone" required class="form-control"  placeholder="Phone">
                              </div>
                              <div class="form-group">       
                                <label>User Id</label>
                                <input type="text" name="emp_userId" id="emp_userId" required class="form-control"  placeholder="User Id">
                              </div>
                              <div class="form-group">       
                                <label>Password</label>
                                <input type="password" name="emp_password" id="emp_password" required class="form-control"  placeholder="Password">
                              </div>
                              <div class="form-group">       
                                <label>Confirm Password</label>
                                <input type="password" name="emp_confpassword" id="emp_confpassword" required class="form-control"  placeholder="Confirm Password">
                              </div>
                              <div class="form-group">       
                                <input type="submit" value="Add" name="addEmployee" class="btn btn-primary">
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>    
                    <table class="table table-striped table-hover card-text" data-toggle="table" data-pagination="true" data-search="true">
                      <thead>
                        <tr>
                          <th data-sortable="true">Employee Id</th>
    					  <th data-sortable="true">Name</th>
    					  <th data-sortable="true">Dept.ID</th>
    					  <th data-sortable="true">Email</th>
    					  <th data-sortable="true">UserId</th>
				      	  <th data-sortable="true">Action</th>
                        </tr>
                      </thead>
                      
                      <tbody>
                      <c:forEach var="employeeList" items="${employeeList}">
                        <tr>
                          <td>${employeeList.emp_id}</td>
                          <td>${employeeList.emp_firstName} ${employeeList.emp_middleName} ${employeeList.emp_lastName}</td>
                          <td>${employeeList.dept_id}</td>
                          <td>${employeeList.emp_mail}</td>
                          <td>${employeeList.emp_userId}</td>
                          <td class="text-center">
                          	<a href='editEmployee.jsp?u=${employeeList.emp_id}' class="fas fa-edit" style="text-decoration:none; color:black;margin-right:5px;"></a>
                          	<a href='deleteEmployee.jsp?u=${employeeList.emp_id}' class="fas fa-trash-alt" style="text-decoration:none; color:black;"></a>
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
        </div>
        <footer class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-6 text-center text-md-left text-primary">
                <p class="mb-2 mb-md-0">Your company &copy; 2018-2020</p>
              </div>
              <div class="col-md-6 text-center text-md-right text-gray-400">
                <p class="mb-0">Design by <a href="https://bootstrapious.com/admin-templates" class="external text-gray-400">Bootstrapious</a></p>
                <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
    <script src="js/front.js"></script>
    <script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>
  </body>

</html>
<%
	}
%>

