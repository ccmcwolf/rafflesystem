
<script type="text/javascript">
	$(document).ready(function() {
    	   	
    	
		$('.btn-demo-d').on('click', function() {
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

				new $.flavr({
					iconPath : 'img/icons/',
					icon : 'email.png',
					content : 'Login',
					dialog : 'form',
								
					form : {
						content : html,
						method : 'post',
						action : 'LoginAuthenticator'
					},
					onSubmit : function($container, $form) {;
						return $form.serialize();
					}
			    });
		 });
	});
</script>

<script>
	$(document).ready(function (){
		$('.dropdown ul li').click(function() {
			
		});
	});
	
</script>
</head>


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
					String user_type = null;
					boolean isLogged = false;
					if (session.getAttribute("user") == null) {
						isLogged = false;
				%>
				<li class="btn-demo-d"><a href="#login">Login</a></li>
				<li class="btn-demo"><a href="signup.jsp">SignUp</a></li>
				<%
					} else {
						user = (String) session.getAttribute("user");
						user_type = (String) session.getAttribute("userType");
						isLogged = true;
				%>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Welcome ! <%=user%> <span
						class="caret"></span></a>

					<ul class="dropdown-menu">
						<li><a href="LogoutServlet">Logout</a></li>
						<li><a href="raffles.jsp">My raffles</a></li>
						<li><a href="">Profile</a></li>
						<li><a href="">Availability</a></li>
						<%
							if (user_type.equals("ADMIN")) {
						%>
						<li><a href="rafflemngt.jsp">Visit admin page</a></li>
						<%
							}
						%>
					</ul></li>
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
	<!-- /.container -->
</nav>

