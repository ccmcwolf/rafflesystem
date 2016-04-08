<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%out.print("Welcome <H3>"+request.getAttribute("user")+"</H3>"); %>
	<form
		action="AddNewUsertoDB?user_email=<%out.print(request.getAttribute("user"));%>"
		method="post">
		<table border="0" width="35%" align="center">
			<caption>
				<h2>Complete Your Sign UP</h2>
			</caption>
			<div class="field-wrap">
				<label> Set user Name </label> <input type="text" name="usrnm"
					required autocomplete="off" />
			</div>
			<tr>
				<td>Your Password</td>
				<td><input type="password" name="pass" size="50" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Sign Up" /></td>
			</tr>
		</table>
	</form>
</body>
</html>