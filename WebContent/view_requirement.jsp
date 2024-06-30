<%@page import="pm_poshan.*" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Admin Pannel</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Glance Design Dashboard Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />

<!-- font-awesome icons CSS -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons CSS -->

 <!-- side nav css file -->
 <link href='css/SidebarNav.min.css' media='all' rel='stylesheet' type='text/css'/>
 <!-- side nav css file -->
 
 <!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>

<!--webfonts-->
<link href="//fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&amp;subset=cyrillic,cyrillic-ext,latin-ext" rel="stylesheet">
<!--//webfonts--> 

<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->

</head> 
<body class="cbp-spmenu-push">
	<div class="main-content">
	<div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-left" id="cbp-spmenu-s1">
		<!--left-fixed -navigation-->
		<aside class="sidebar-left">
      <nav class="navbar navbar-inverse">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".collapse" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <h1><a class="navbar-brand" href="Admin_Dashboard.html"><span class="fa fa-area-chart"></span> Admin<span class="dashboard_text">Dashboard</span></a></h1>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="sidebar-menu">
              <li class="header">MAIN NAVIGATION</li>
               <li class="treeview">
                <a href="add_school.html">
                <i class="fa fa-laptop"></i>
                <span>Add School</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
              </li>
              <li class="treeview">
                <a href="view_school.jsp">
                <i class="fa fa-laptop"></i>
                <span>View and Delete School</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
              </li>
			  <li class="treeview">
                <a href="add_supplier.html">
                <i class="fa fa-laptop"></i>
                <span>Add Supplier</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>               
              </li>
              <li class="treeview">
                <a href="view_supplier.jsp">
                <i class="fa fa-laptop"></i>
                <span>view and Delete Supplier</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>               
              </li>
              <li class="treeview">
                <a href="view_requirement.jsp">
                <i class="fa fa-pie-chart"></i>
                <span>requirement</span>
                </a>
              </li>
			  <li>
                <a href="view_complaint.jsp">
                <i class="fa fa-th"></i> <span>complaints</span>
                </a>
              </li>
              <li class="treeview">
                <a href="meal.jsp">
                <i class="fa fa-laptop"></i>
                <span>Change meal</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
              </li>
              <li class="treeview">
                <a href="view_report.html">
                <i class="fa fa-laptop"></i>
                <span>View Report</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
              </li>
            </ul>
          </div>
          <!-- /.navbar-collapse -->
      </nav>
    </aside>
	</div>
		<!--left-fixed -navigation-->
		
		<!-- header-starts -->
		<div class="sticky-header header-section ">
			<div class="header-left">
				
				
			</div>
			<div class="header-right">
				
				<div class="profile_details">		
					<ul>
						<li class="dropdown profile_details_drop">
							<a href="index.html" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								<div>	
									
									<div class="user-name">
										<p>Log Out</p>
									</div>
									<i class="fa fa-angle-down lnr"></i>
									<i class="fa fa-angle-up lnr"></i>
									<div class="clearfix"></div>	
								</div>	
							</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>				
			</div>
			<div class="clearfix"> </div>	
		</div>
		<!-- //header-ends -->
	</div>
	
	<div id="page-wrapper">
		<div class="main-page">
			<h2 class="title1">Pendding requirement</h2>
				<div class="tables">
					<div class="bs-example widget-shadow" data-example-id="bordered-table">
						<table class="table table-bordered"> 
							<thead> 
							<tr> 
								<th>school id</th>
								<th>Rice</th> 
								<th>Dal</th> 
								<th>Spices</th> 
								<th>Salt</th>
								<th>Oil</th>
								<th>Action</th>
							</tr> 
							</thead> 
			<% 
				Connection con = ConnectDB.connect();
			String status = "pending";
				try
				{
					PreparedStatement ps = con.prepareStatement("Select * from requirement where status = ?");
					ps.setString(1, status);
					ResultSet rs = ps.executeQuery();
					while(rs.next())
					{
			%>
						<tbody> 
							<tr> 
							<td><%=rs.getString(8) %></td>
								<td><%=rs.getInt(2) %></td>
							<td><%=rs.getInt(3) %></td>
							<td><%=rs.getInt(4) %></td>
							<td><%=rs.getInt(5) %></td>
							<td><%=rs.getInt(6)%></td> 
							<td><a href="supplier_require.jsp?id=<%=rs.getInt(1)%>">supplier</a></td>  
							</tr> 
			<% 		
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			%>		
						</tbody>	
					</table>
			</div>
			</div>
			
			<h2 class="title1">delivered Requirement</h2>
				<div class="tables">
					<div class="bs-example widget-shadow" data-example-id="bordered-table">
						<table class="table table-bordered"> 
							<thead> 
							<tr> 
								<th>school id</th>
								<th>Rice</th> 
								<th>Dal</th> 
								<th>Spices</th> 
								<th>Salt</th>
								<th>Oil</th>
								<th>Action</th>
							</tr> 
							</thead> 
			<% 
			String status1 = "approved";
				try
				{
					PreparedStatement ps1 = con.prepareStatement("Select * from requirement where status = ?");
					ps1.setString(1, status1);
					ResultSet rs = ps1.executeQuery();
					while(rs.next())
					{
			%>
						<tbody> 
							<tr> 
							<td><%=rs.getString(8) %></td>
							<td><%=rs.getInt(2) %></td>
							<td><%=rs.getInt(3) %></td>
							<td><%=rs.getInt(4) %></td>
							<td><%=rs.getInt(5) %></td>
							<td><%=rs.getInt(6)%></td>
						<td><a href="delete_require_1.jsp?Sid=<%=rs.getInt(1)%>">delete</a></td> 
							</tr> 
			<% 		
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
			%>		
						</tbody>	
					</table>	
		</div>
	</div>

		</div>
	</div>
	
	<!-- side nav js -->
	<script src='js/SidebarNav.min.js' type='text/javascript'></script>
	<script>
      $('.sidebar-menu').SidebarNav()
    </script>
	<!-- //side nav js -->
	
	<!-- Classie --><!-- for toggle left push menu script -->
		<script src="js/classie.js"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			
			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>
	<!-- //Classie --><!-- //for toggle left push menu script -->
	
	<!--scrolling js-->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->
	
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"> </script>
	
</body>
</html>