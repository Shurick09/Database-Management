<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<% 
    String Email = request.getParameter("email");
    session.getAttribute("email",email);
%>
<!DOCTYPE html>
<html>
<head>
    <title> RUBuying</title>
</head>
<body> If youre here its that you successfully logged in. I hope to have a search bar and just recommendations and stuff on this part of the website</body>

</html>