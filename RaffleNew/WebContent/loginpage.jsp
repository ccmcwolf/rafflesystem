<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign-Up/Login Form</title>
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="signupassests/css/normalize.css">
<link rel="stylesheet" href="signupassests/css/style.css">
</head>
<body>
	<div class="form">

		<ul class="tab-group">
			<li align="center" class="tab active"><a href="index.jsp">Home</a></li>
		</ul>

		<div class="tab-content">
			<div id="signup">
				<h1>Welcome to Spankeys Raffle!</h1>

				<form action="LoginAuthenticator" method="post">

					<div class="field-wrap">
						<label>Email<span class="req">*</span>
						</label> <input name="recipient" type="email" required autocomplete="off" />
					</div>

					<div class="field-wrap">
						<label>Confirm password<span class="req">*</span>
						</label> <input type="password" required autocomplete="off" />
					</div>
					<button type="submit" class="button button-block" />
					Login
					</button>
				</form>
			</div>

			<div id="login">
				<h1>Welcome Back!</h1>



			</div>

		</div>
		<!-- tab-content -->

	</div>
	<!-- /form -->
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="signupassests/js/signupjs.js"></script>
</body>
</html>