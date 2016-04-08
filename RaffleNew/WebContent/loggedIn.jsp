<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	$(document)
			.ready(
					function() {
						$('.btn-demo')
								.on(
										'click',
										function() {
											var html = '   <div class="form-row">'
													+ '   <input type="text" name="username" ' +
                       '   placeholder="Username" />'
													+ '   </div>'
													+ '   <div class="form-row">'
													+ '   <input type="password" name="password" ' +
                       '   placeholder="Password" />'
													+ '   </div>'
													+ '   <div class="form-row">'
													+ '   <input type="password" name="verypassword" ' +
                       '   placeholder="Verify Password" />'
													+ '   </div>'
													+ '   <div class="form-row">'
													+ '   <input type="checkbox" name="agree" ' +
                       '   id="check"/>'
													+ '   <label for="check">I confirm I am above 18 years and agree to policies of SpankysRaffle.com</label>'
													+ '   </div>';

											new $.flavr({
												iconPath : 'img/icons/',
												icon : 'email.png',
												content : 'Sign Up',
												dialog : 'form',

												form : {
													content : html,
													method : 'get'
												},
												onSubmit : function($container,
														$form) {
													;
													return $form.serialize();
												}
											});
										});

						$('.btn-demo-dd')
								.on(
										'click',
										function() {
											var html = '   <div class="form-row">'
													+ '   <input type="text" name="username" ' +
                           '   placeholder="Username" />'
													+ '   </div>'
													+ '   <div class="form-row">'
													+ '   <input type="password" name="password" ' +
                           '   placeholder="Password" />'
													+ '   </div>'
													+ '   <div class="form-row">'
													+ '   <input type="checkbox" name="remember" ' +
                           '   id="check"/>'
													+ '   <label for="check">Remember me</label>'
													+ '   </div>';

											new $.flavr(
													{
														iconPath : 'img/icons/',
														icon : 'email.png',
														content : 'Login',
														dialog : 'form',

														form : {
															content : html,
															method : 'post',
															action : 'LoginAuthenticator'
														},
														onSubmit : function(
																$container,
																$form) {
															;
															return $form
																	.serialize();
														}
													});
										});
					});
</script>

<!-- 
<script type="text/javascript">
$(document).ready(function() {
			 	new $.flavr({
			 		position    : 'top-mid',
			 		content     : 'Welcome ! you\' successfully logged-in<br>Where to next?',
			 		buttons     : {
			 			primary : { 
			 				text   : 'Primary',
			 				style  : 'primary',
			 				action : function() {
			 							$('.raf').click();
			 							return false;
			 			    }
			 			},
			 			
			 			success    : { 
			 				text   : 'Success',
			 				style  : 'success',
			 				action : function() {
			 							alert('sususususs');
			 							return false;
			 			    }
			 			},
			 			
			 			close      : {
			 				style  : 'default'
			 			}
			 		}
			 	});
			 	
			 	
				$('.btn-demo-d').on('click', function() {
					var html = '   <div class="form-row">'
							 + '   		<a class="btn btn-default" href="raffles.jsp">Raffle</a>' +
							 + '   </div>'
							 + '   <div class="form-row">'
							 + '   		<a class="btn btn-default" href="raffles.jsp">Next</a>' +
							 + '   </div>'

					new $.flavr({
						content : 'Welcome ! you\' successfully logged-in<br>Where to next?',
						
									
						form : {
							position    : 'top-mid',
							content : html
						}
				    });
			 });
	 		
	});
</script> -->

<script type="text/javascript"></script>
</head>

<body id="page-top" class="index">



	</div>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar " role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#"> <img id="navbarimg"
				src="img/logonew1_small.png" class="img-responsive" alt="">
			</a>
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

			</div>


		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="hidden"><a href="#page-top"></a></li>
				<li class="page-scroll"><a href="#home">Home</a></li>
				<li class="page-scroll"><a href="#about">About</a></li>
				<li class="page-scroll"><a href="#contact">Contact</a></li>
				<%
					String user = null;
					boolean isLogged = false;
					if (session.getAttribute("user") == null) {
						isLogged = false;
				%>
				<li class="btn-demo-d"><a href="#login">Login</a></li>
				<li class="btn-demo"><a href="#signup">SignUp</a></li>
				<%
					} else {
						user = (String) session.getAttribute("user");
						isLogged = true;
				%>
				<li><a href="LogoutServlet"><%=user%>Logout</a></li>
				<li class="show-demo-d"></li>
				<%
					}

					String user_name = null;
					String session_id = null;
					Cookie[] cookies = request.getCookies();

					if (cookies != null) {
						for (Cookie cookie : cookies) {
							if (cookie.getName().equals("user")) {
								user_name = cookie.getValue();
								/*
								
								*/
							}
						}
					}
				%>



			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>


	<!-- Header -->
	<header>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<img class="img-responsive" src="img/profile.png" alt="">
				<div class="intro-text">
					<span class="name">Welcome !</span>
					<hr class="star-light">
					<span class="skills">Spanky's Raffle .com</span>
				</div>
			</div>
		</div>
	</div>
	</header>

	<!-- Portfolio Grid Section -->
	<section id="home">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>Home</h2>
				<hr class="star-primary">
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4 portfolio-item">
				<%
					if (!isLogged) {
				%>
				<a class="btn-demo-d" href="#login"> <img
					src="img/portfolio/tickets.png" class="img-responsive" alt="">
				</a>
				<%
					} else {
				%>
				<a class="raf" href="raffles.jsp"> <img
					src="img/portfolio/tickets.png" class="img-responsive" alt="">
				</a>
				<%
					}
				%>
			</div>

			<div class="col-sm-4 portfolio-item">
				<%
					if (!isLogged) {
				%>
				<a href="#login" class="btn-demo-d"> <img
					src="img/portfolio/winner.png" class="img-responsive" alt="">
				</a>
				<%
					} else {
				%>
				<!-- if logged then what's going on winner -->
				<a href="" class=""> <img src="img/portfolio/winner.png"
					class="img-responsive" alt="">
				</a>
				<%
					}
				%>
			</div>

			<div class="col-sm-4 portfolio-item">
				<%
					if (!isLogged) {
				%>
				<a href="#login" class="btn-demo-d"> <img
					src="img/portfolio/blog.png" class="img-responsive" alt="">
				</a>
				<%
					} else {
				%>
				<!-- if logged then what's going on winner -->
				<a href="" class=""> <img src="img/portfolio/blog.png"
					class="img-responsive" alt="">
				</a>
				<%
					}
				%>
			</div>

		</div>
	</div>
	</section>

	<!-- About Section -->
	<section class="success" id="about">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>About</h2>
				<hr class="star-light">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-lg-offset-2">
				<p>This system will let you have complete access over the things
					that you want to raffle off. People that raffle there stuff can
					make double or more off of what the product is normally worth by
					this system.</p>
			</div>
			<div class="col-lg-4">
				<p>The person that will be raffling there things get to choose
					how many tickets and how much per ticket they want to use to
					raffle. This system is completely random, and will not favor to any
					individual.</p>
			</div>

		</div>
	</div>
	</section>

	<!-- Contact Section -->
	<section id="contact">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>Contact Me</h2>
				<hr class="star-primary">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
				<!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
				<form name="sentMessage" id="contactForm" novalidate>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label>Name</label> <input type="text" class="form-control"
								placeholder="Name" id="name" required
								data-validation-required-message="Please enter your name.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label>Email Address</label> <input type="email"
								class="form-control" placeholder="Email Address" id="email"
								required
								data-validation-required-message="Please enter your email address.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label>Phone Number</label> <input type="tel"
								class="form-control" placeholder="Phone Number" id="phone"
								required
								data-validation-required-message="Please enter your phone number.">
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<div class="row control-group">
						<div
							class="form-group col-xs-12 floating-label-form-group controls">
							<label>Message</label>
							<textarea rows="5" class="form-control" placeholder="Message"
								id="message" required
								data-validation-required-message="Please enter a message."></textarea>
							<p class="help-block text-danger"></p>
						</div>
					</div>
					<br>
					<div id="success"></div>
					<div class="row">
						<div class="form-group col-xs-12">
							<button type="submit" class="btn btn-success btn-lg">Send</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</section>

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

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-top page-scroll visible-xs visible-sm">
		<a class="btn btn-primary" href="#page-top"> <i
			class="fa fa-chevron-up"></i>
		</a>
	</div>


	<!-- Plugin JavaScript -->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/cbpAnimatedHeader.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/freelancer.js"></script>



</body>

</html>