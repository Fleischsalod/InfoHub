<%-- 
    Document   : validate.jsp
    Created on : 21.11.2017, 15:10:08
    Author     : luisgraml
--%>

<%@page import="Sender.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LogIn Validation</title>
    </head>
    <body>
        <%
          DBConnector dbc = new DBConnector();
          String vemail = request.getParameter("email");
          String vpasswd = request.getParameter("passwort");
          
          if(dbc.login(vemail, vpasswd) == true){
              out.println("<a href='sendMail.jsp'><button type='button'>Mail verschicken</button></a>");
          } else {
              out.println("Login failed.");
              out.println("<a href='index.html'><button type='button'>Zurück zu Login</button></a>");
          }
        %>
    </body>
</html>
