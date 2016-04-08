<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Success</title>
</head>
<body>
	<%
		String user = null;
		if (session.getAttribute("user") == null) {
			response.sendRedirect("index.jsp");
		} else {
			user = (String) session.getAttribute("user");
		}
		
		String user_name = null;
		String session_id = null;
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("user")) {
					user_name = cookie.getValue();
				}
				
				if (cookie.getName().equals("JSESSIONID")) {
					session_id = cookie.getValue();
				}
			}
		}
	%>

	<h3>
		Hello
		<%=user_name %>, welcome back !
	</h3>
	<form action="LogOutServlet" method="post">
		<input type="submit" value="Logout" />
	</form>
</body>
</html>