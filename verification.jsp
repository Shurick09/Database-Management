<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head> Signing in </head>
<title> RUBuying</title>
<%
/*Get the parameter*/
String email = request.getParameter("email");
String password = request.getParameter("password1");
/*establish the connection*/
  try {
        Class.forName("com.mysql.jdbc.Driver");
    }
    catch(ClassNotFoundException ex) {
        System.out.println("Error: unable to load driver class!");
        return;
    }
try{
    System.out.println("Establishing connection");
    Connection myconn = DriverManager.getConnection("jdbc:mysql://cs336g20.coakf4pqnamg.us-east-2.rds.amazonaws.com:3306/innodb", "group20", "group20!");
    System.out.println("established");
    PreparedStatement stmt = myconn.prepareStatement("SELECT * FROM user WHERE Email= ? AND Password = ?");
    stmt.setString(1,email);
    stmt.setString(2,password);
    ResultSet checkAccountResult = stmt.executeQuery();
    System.out.println("query established");


    /* here we check if the email is being used and is valid in our database*/ 
    if(checkAccountResult.next()){
        System.out.println("Pass and email matched");
            %>
             <script>
             alert("Welcome");
             window.location.href="homepage.jsp";
             </script>
             <%
             return;
         }
    else{
        System.out.println("Failed login attempt");
        %> 
        <script>
        alert("Wrong username or password");
        window.location.href="register.jsp";
        </script>
            <%
    }
    /*close connection at the end*/
    myconn.close();
}catch(Exception ex){
    System.out.println("something went wrong");
    %> <script>
    alert("something went wrong, redirecting to login page");
    window.location.href="login"
    <script>
    <%

}
%>
</html>
