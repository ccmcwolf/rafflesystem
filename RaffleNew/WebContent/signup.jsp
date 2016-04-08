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
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src='js/jquery.js'></script>
<script src='js/bootstrap.min.js'></script>
<script>
	$(document).ready(function() {
		$('#inp2').keyup(function() {
			var value1 = $('#inp1').val();
			var value2 = $('#inp2').val();

			if (value1 === value2) {
				$('#btn').removeClass("disabled");
			} else if (value1 != value2) {
				$('#btn').addClass("disabled");
			}
		});
	});
</script>
</head>
<body>
	<div class="form">

		<ul class="tab-group">
			<li align="center" class="tab active"><a href="index.jsp">Home</a></li>

		</ul>

		<div class="tab-content">
			<div id="signup">
				<h1>Sign Up for Free</h1>

				<form action="EmailSendingServlet" method="post">

					<div class="field-wrap">
						<label> Email Address<span class="req">*</span>
						</label> <input name="recipient" id="inp1" type="email" required
							autocomplete="off" />
					</div>

					<div class="field-wrap">
						<label> Confirm Email Address<span class="req">*</span>
						</label> <input type="email" id="inp2" required autocomplete="off" />
					</div>




					<button type="submit" class="btn button button-block disabled"
						id="btn">Sign Up</button>

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


	<script src="signupassests/js/signupjs.js"></script>

</body>
</html>