/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sender;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.util.*;
import javax.activation.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class MailSender
{
  public MailSender() {}

  /**
   * Method to open a connection to pop3 gmail
   * @param user
   * @param pass
   * @return session to be used to send data
   */
  public static Session getGMailSession( String user, String pass )
  {
    final Properties props = new Properties();

    // Zum Empfangen
    //props.setProperty( "mail.pop3.host", "outlook.office365.com" );
    props.setProperty( "mail.pop3.user", user );
    props.setProperty( "mail.pop3.password", pass );
    /*props.setProperty( "mail.pop3.port", "995" );
    props.setProperty( "mail.pop3.auth", "true" );
    props.setProperty( "mail.pop3.socketFactory.class",
                       "javax.net.ssl.SSLSocketFactory" );
   */
    // Zum Senden
   /* props.setProperty( "mail.smtp.host", "smtp.gmail.com" );
    props.setProperty( "mail.smtp.auth", "true" );
    props.setProperty( "mail.smtp.port", "465" );
    props.setProperty( "mail.smtp.socketFactory.port", "465" );
    props.setProperty( "mail.smtp.socketFactory.class",
                       "javax.net.ssl.SSLSocketFactory" );
    props.setProperty( "mail.smtp.socketFactory.fallback", "false" );

   */ 
    props.setProperty("mail.smtp.from",  user);
    props.setProperty("mail.smtp.user",  user);
    props.setProperty("mail.smtp.password",pass);
    props.setProperty( "mail.smtp.host", "smtp.office365.com" );
    props.setProperty( "mail.smtp.auth", "true" );
    props.setProperty("mail.smtp.starttls.enable", "true");
    props.setProperty( "mail.smtp.port", "587" );
    props.setProperty("mail.smtp.socketFactory.fallback", "true");
    /* props.setProperty( "mail.smtp.socketFactory.port", "587" );
    props.setProperty( "mail.smtp.socketFactory.class",
                       "javax.net.ssl.SSLSocketFactory" );
                       * 
                       */
    //props.setProperty( "mail.smtp.socketFactory.fallback", "false" );

     
    
    return Session.getInstance( props, new javax.mail.Authenticator() {
      @Override protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication( props.getProperty( "mail.pop3.user" ),
                                           props.getProperty( "mail.pop3.password" ) );
      }
    } );
  }
  
  /**
   * Send a message with email
   * @param session valid session form gerGmail Session
   * @param recipient valid email address
   * @param subject subject of our mail
   * @param message our message as string
   * @throws MessagingException will throw exception
   */
  public static void postMail( Session session, String recipient,
                             String subject, String message )
  throws MessagingException
{
  Message msg = new MimeMessage( session );

  InternetAddress addressTo = new InternetAddress( recipient );
  msg.setRecipient( Message.RecipientType.TO, addressTo );

  msg.setSubject( subject );
  msg.setContent( message, "text/plain" );
  Transport.send( msg );
}
  
}