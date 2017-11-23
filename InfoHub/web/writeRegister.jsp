<%-- 
    Document   : writeRegister
    Created on : 06.11.2017, 21:07:29
    Author     : Winterfeldt
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registering</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>  
    </head>
    <body>

        <!-- Start of first page -->
        <div data-role="page" id="register">

            <div data-role="header">
                <h1>Registering</h1>
            </div><!-- /header -->

            <div role="main" class="ui-content">
                <%
                    String name = request.getParameter("name");
                    String vorname = request.getParameter("vorname");
                    String email = request.getParameter("email");
                    String tel = request.getParameter("tel");
                    String passwort = request.getParameter("passwort");
                    
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InfHub", "root", "root");
                        Statement stmt = conn.createStatement();

                        stmt.executeUpdate("INSERT INTO anwender (name, vorname, email, telenum, passwd) VALUES('" + name + "', '" + vorname + "', '" + email + "', '" + tel + "', '" + passwort + "')");                       

                    } catch (Exception e) {
                        out.println("DB-Driver nicht gefunden!");
                        out.println(e.getMessage());
                    }
                %>
                <p>Sie sind jetzt Teil der Community!</p>
                
                <a href="index.html"><button>Zum Log In</button></a>
            </div><!-- /content -->

            <div data-role="footer">
                <h4>Page Footer</h4>
            </div><!-- /footer -->
        </div><!-- /page -->

        <!-- Start of second page -->
        <div data-role="page" id="bar">

            <div data-role="header">
                <h1>Bar</h1>
            </div><!-- /header -->

            <div role="main" class="ui-content">
                <p>I'm the second in the source order so I'm hidden when the page loads. I'm just shown if a link that references my id is beeing clicked.</p>
                <p><a href="#foo">Back to foo</a></p>
            </div><!-- /content -->

            <div data-role="footer">
                <h4>Page Footer</h4>
            </div><!-- /footer -->
        </div><!-- /page -->
    </body>
</html>
