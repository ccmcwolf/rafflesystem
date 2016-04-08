<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.Transaction"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="org.hibernate.Criteria"%>
<%@ page import="org.hibernate.SQLQuery"%>
<%@ page import="util.HibernateUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Spanky's Raffle</title>


<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/freelancer.css" rel="stylesheet">

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/animate.css" />
<script src="js/flavr.js"></script>
<link rel="stylesheet" type="text/css" href="css/flavr.css" />

<!-- Custom CSS -->
<link href="css/logo-nav.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript">
	$(document).ready(function () {
		$.ajax({
			type:"GET",
			url:"DisplayRaffles",
			dataType:"json",
			success: function (data) {
				if (data.ExistingRaffleData.length) {
					$.each(data.ExistingRaffleData, function(i,data) {
						var min_price = data.min_price;
						var raf_data = "<a href='orders.jsp'><div class='col-sm-3' style='margin-top: 20px'>	<div style='background-color: red; padding: 10px 5px 10px 5px; height: 200px;'></div></div></a>";
						$(raf_data).appendTo("#port-folio");
					});					
				} else {
					$(raf_data).html("No Results");
				}
			}
		});
	});
</script>

</head>
<body id="page-top" class="index">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="col-lg-12 text-center">
		<h2>Available Raffles</h2>
		<hr class="star-primary">
	</div>

	<div style="margin: 20px 20px 20px 20px;">
		<div id="port-folio" class="row">
		<!-- <div class="col-sm-3" style="margin-top: 20px">
			<a href="index.jsp"><div style="background-color: red; padding: 10px 5px 10px 5px; height: 200px;"></div></a>	
		</div> -->
		</div>

	</div>

	<!-- Footer -->
	<footer class="text-center">
	<div class="footer-above">
		<div class="container">
			<div class="row">
				<div class="footer-col col-md-4">
					<h3>Location</h3>
					<p>
						Place address<br>Street
					</p>
				</div>
				<div class="footer-col col-md-4">
					<h3>Around the Web</h3>
					<ul class="list-inline">
						<li><a href="#" class="btn-social btn-outline"><i
								class="fa fa-fw fa-facebook"></i></a></li>
						<li><a href="#" class="btn-social btn-outline"><i
								class="fa fa-fw fa-google-plus"></i></a></li>
						<li><a href="#" class="btn-social btn-outline"><i
								class="fa fa-fw fa-twitter"></i></a></li>
						<li><a href="#" class="btn-social btn-outline"><i
								class="fa fa-fw fa-linkedin"></i></a></li>
						<li><a href="#" class="btn-social btn-outline"><i
								class="fa fa-fw fa-dribbble"></i></a></li>
					</ul>
				</div>
				<div class="footer-col col-md-4">
					<h3>Using the system</h3>
					<p>We will not tolerate any individual that will try to take
						advantage of this system. Please follow the our rules or you will
						be BAND PERMENTALLY from this site.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="footer-below">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">Copyright &copy; SpankysRaffle.com</div>
			</div>
		</div>
	</div>
	</footer>
</body>
</html>