/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sender;

import com.nexmo.client.NexmoClient;
import com.nexmo.client.auth.AuthMethod;
import com.nexmo.client.sms.SmsSubmissionResult;
import com.nexmo.client.sms.messages.TextMessage;
import com.nexmo.client.auth.JWTAuthMethod; 
import com.nexmo.client.auth.TokenAuthMethod;

/**
 *
 * @author gotzwinterfeldt
 */
public class SMSSender {
    // create the HttpURLConnection

    public static void sendSMS(String content) {
        try {
            AuthMethod auth = new TokenAuthMethod("dae3d3bf","27d45ac64cd4d222" );
            NexmoClient client = new NexmoClient(auth);
            System.out.println("+491728652312");

            SmsSubmissionResult[] responses = client.getSmsClient().submitMessage(new TextMessage(
                    "+491728652312",
                    "+491728652312",
                    "Hello from Nexmo!"));
            for (SmsSubmissionResult response : responses) {
                System.out.println(response);
            }

        } catch (Exception e) {

        }
    }
}
