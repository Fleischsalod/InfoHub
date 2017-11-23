<%@page import="Sender.DBConnector"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>


        <title>Page Title</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>  
    </head>
    <body>

        <!-- Start of first page -->
        <div data-role="page" id="foo">

            <div data-role="header">
                <h1>Registrieren</h1>
            </div><!-- /header -->

            <div role="main" class="ui-content">
                <form onsubmit="return checkForm(this);">
                    <label for="basic">Name:</label>
                    <input type="text" name="name" id="name" value="" data-mini="true" />
                    <label for="basic">Vorname:</label>
                    <input type="text" name="vorname" id="vorname" value="" data-mini="true" />
                    <label for="basic">Email:</label>
                    <input type="text" name="email" id="email" value="" data-mini="true" />
                    <label for="basic">Telefonnummer:</label>
                    <input type="text" name="tel" id="tel" value="" data-mini="true" />
                    <label for="basic">Passwort:</label>
                    <input type="password" name="passwort" id="passwort" value="" data-mini="true" />
                    <label for="basic">Passwort bestätigen:</label>
                    <input type="password" name="vpasswort" id="vpasswort" value="" data-mini="true" />
                    <input type="submit" value="Weiter"/>
                </form>
            </div><!-- /content -->

            <div data-role="footer">
                <h4>Page Footer</h4>
            </div><!-- /footer -->
        </div><!-- /page -->

        <!-- Start of second page -->
        <div data-role="page" id="bar">

            <div data-role="header">
                <h1>Ihre Rolle</h1>
            </div><!-- /header -->

            <div role="main" class="ui-content">
                <%
                    DBConnector con = new DBConnector();
                    con.createSelector(out);
                %>
                <p><a href="#foo">Zurück</a></p>
                <input type="button" value="Registrieren" onclick='call()'>
                
            </div><!-- /content -->

            <div data-role="footer">
                <h4>Page Footer</h4>
            </div><!-- /footer -->
        </div><!-- /page -->
        <script language="javascript" type="text/javascript">
        function call(){
            var nname = $('#name').val();
            var nemail= $('#email').val();
            var nvorname= $('#vorname').val();
            var ntel= $('#tel').val();
            var npw= $('#passwort').val();
            //Hier muss getestet werden, welcher Gruppen angekreuzt wurden
            
            //Sende an die nächste Seite
            window.location.replace("writeRegister.jsp?name="+nname+"&vorname="+nvorname+"&email="+nemail+"&tel="+ntel+"&passwort="+npw);
        }
        
        function checkForm(form){
            if(form.passwort.value !== "" && form.passwort.value === form.vpasswort.value) {
                window.location.replace("#bar");
              return true;
              
            } else {
              alert("Error: Please check that you've entered and confirmed your password!");
              form.passwort.focus();
              return false;
            }
        }
        </script>
        
        
    </body>
</html>
