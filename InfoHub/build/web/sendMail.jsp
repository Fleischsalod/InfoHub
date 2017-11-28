<%-- 
    Document   : sendMail
    Created on : 22.11.2017, 10:34:33
    Author     : luisgraml
--%>

<%@page import="javax.mail.Session"%>
<%@page import="Sender.MailSender"%>
<%@page import="Sender.DBCredentials"%>
<%@page import="Sender.DBConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mailsender</title>
    </head>
    <body>
        <p>You can send Mails from here.</p>
        <div role="main" class="ui-content">
            <form>
                <!-- Auswahlfelder für Empfänger -->
                <label for="mail">E-Mail-Adresse:</label>
                <input type="email" id="mail" />

                <!-- Textfelder -->
                <label for="betreff">Betreff:</label>
                <input type="text" id="betreff" />
                <label for="nachricht">Nachricht:</label>
                <input type="text" id="nachricht" />

                <!-- Senden -->
                <input type="submit" value="Senden" />
            </form>
        </div>       
        <%
            // Datenbank-Verbindung
            DBConnector dbc = new DBConnector(DBCredentials.DBNAME, DBCredentials.DBUSER, DBCredentials.DBPW);
            dbc.connect();
            // Daten holen
            String mail = request.getParameter("mail");
            String betreff = request.getParameter("betreff");
            String nachricht = request.getParameter("nachricht");
            
            // Mails senden
            try {
                MailSender send = new MailSender();
                Session s = send.getGMailSession("mail@dit.education", "Mail2017+1");

                send.postMail(s, mail, betreff, nachricht);
                out.println("Nachricht erfolgreich versendet");
            
            } catch (Exception e) {
                System.out.println("Leider konnte ihre Nachricht nicht versendet werden.");
            }
            
        %>
        <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script> 
    </body>
</html>
