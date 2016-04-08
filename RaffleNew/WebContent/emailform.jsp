<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spankys Raffle : Sign Up</title>
<!-- <script src="jquery-1.11.3.js"></script>
<script>
	$.ajax({
		url : "EmailSendingServlet",
		type : "POST",
		success : function(e) {
			alert(e);
		}
	});
</script> -->
</head>
<body>
	<form action="EmailSendingServlet" method="post">
		<table border="0" width="35%" align="center">
			<caption>
				<h2>Sign UP</h2>
			</caption>
			<tr>
				<td>Your Email Address</td>
				<td><input type="text" name="recipient" size="50" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Sign Up" /></td>
			</tr>
		</table>

	</form>
</body>
</html>