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

<link href="css/rfle_page.css" rel="stylesheet">

</head>

<body id="page-top" class="index" onload="calc()">


	<%
		String user = null;
		String user_type = null;
		boolean isLogged = false;
		if (session.getAttribute("user") == null) {
			isLogged = false;
		} else {
			user = (String) session.getAttribute("user");
			user_type = (String) session.getAttribute("userType");
			isLogged = true;
		}
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<%
		int raffleValue = Integer.parseInt(request.getParameter("value"));
		int existing_raffle_count = Integer.valueOf(session.getAttribute("raffle_count_exists").toString());
		String startDate = (String) session.getAttribute("startDate");
		String endDate = (String) session.getAttribute("endDate");
	%>

	<div class="container-fluid" style="background: #e7e9ec;">
		<div class="row full">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-9">
						<div class="border top">
							<h4>Raffle</h4>
							<div class="row">
								<div class="col-md-4">
									<div>
										<p style="color: #666; text-align: center;">
											<small style="color: #666; font-size: 20px;">Your
												raffle value : </small> <br>
										<div style="text-align: center;">
											<p id="rafVal" style="font-size: 30px; color: red;"><%=raffleValue%></p>
										</div>
										</p>
									</div>
								</div>
								<div class="col-md-4" style="text-align: center;">
									<p style="color: #666;">
										<small style="color: #666; font-size: 20px;"> How many
											raffles do you want?</small> <select id="qty" onchange="calc()"
											style="color: black; font-family: sans-serif; font-size: 22px; margin-top: 10px;">
											<%
												int limit = existing_raffle_count;
												for (int i = 1; i < (limit + 1); i++) {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
												}
											%>
										</select>
									</p>
									<script>
										function calc() {
											var e = parseInt(document
													.getElementById("qty").value);
											var x = <%=raffleValue%>;
											document.getElementById("gt").innerHTML = x * e;
										}
									</script>
								</div>

								<div class="col-md-4" style="text-align: center;">
									<small style="color: #666; font-size: 20px;">Grand
										total </small>
									<p id="gt" style="font-size: 30px; color: red;"></p>
									<p style="font-size: 18px; color: red;">$</p>
								</div>
							</div>
						</div>

						<br>

						<div class="border list">
							<h4>Description</h4>
							<div class="row">
								<div class="col-md-4">
									<ul class="list-group">
										<%
											if (session.getAttribute("raffle_count_and_ids") != null) {
												ArrayList<Integer> data = (ArrayList<Integer>) session.getAttribute("raffle_count_and_ids");

												for (int i = 0; i < data.size(); i++) {
										%>
										<li
											style="text-align:center; display: block; color: white;; padding: 5px 5px 5px 5px; margin: 5px 5px 5px 5px; background: rgba(0, 0, 0, 0.2);">
											<div class="checkbox">
												<label style="width: 100%; height: 100%;"><input type="checkbox"/>Raffle number : <b><%=data.get(i)%></b></label>
											</div>
										</li>
										<%
											}
											}
										%>
									</ul>
								</div>
								<div class="col-md-4"></div>
								<div class="col-md-4">
									<br> <input type="submit" class="btnBuyRefs"
										value="Buy now" name="buyRefs" />
								</div>
							</div>
						</div>

						<div class="border bot">
							<h4>Competitors</h4>
							<table class="table table-hover" style="color: black;">
								<tbody>
								<thead>
									<tr>
										<td>Name</td>
										<td>Name</td>
										<td>Name</td>
									</tr>
								</thead>
								<tr>
									<td>Name</td>
									<td>Name</td>
									<td>Name</td>
								</tr>
								<tr>
									<td>Name</td>
									<td>Name</td>
									<td>Name</td>
								</tr>
							</table>
							</tbody>
						</div>
					</div>

					<div class="col-md-3 top">
						<div class="winner_topLevel border">
							<h4>Winner will get</h4>
							<br>
							<h1>$</h1>
							<br>

						</div>

						<div class="buyN border"></div>
					</div>
				</div>
			</div>
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