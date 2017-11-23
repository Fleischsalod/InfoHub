/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import Sender.MailSender;
import javax.mail.MessagingException;
import javax.mail.Session;

/**
 *
 * @author gotzwinterfeldt
 */
public class TestMail {
    
    public static void main(String[] args){
        
        try{
            MailSender send = new MailSender();
            Session s = send.getGMailSession("service@westend61.de", "freibier#w61");

            send.postMail(s,"graml.luis@web.de","Betreff","Nachrichteninhalt");
        }
        catch(Exception e){
            System.out.println(e);
        
        }
    }
    
}
