/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Sender;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.JspWriter;

/**
 *
 * @author luisgraml
 */
public class DBConnector {
    
    public String dbname;
    public String dbuser;
    public String dbpw;
    
    public DBConnector(String databasename, String databaseuser, String databasepassword){
        this.dbname = databasename;
        this.dbuser = databaseuser;
        this.dbpw = databasepassword;
    }
    
    public Statement connect(){
        try {
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection(dbname, dbuser, dbpw);
            Statement stmt = conn.createStatement();
            
            return stmt;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
    public boolean login(String email,String password) {
        try{           
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InfHub", "root", "root");     
            PreparedStatement pst = conn.prepareStatement("Select email, passwd from anwender where email=? and passwd=?");
            pst.setString(1, email); 
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();                        
            if(rs.next())            
                return true;    
            else
                return false;            
        }
        catch(Exception e){
            e.printStackTrace();
            return false;
        }       
     }
    
    public static void createSelector(JspWriter out){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/InfHub", "root", "root");
            Statement stmt = conn.createStatement();

            ResultSet rs;
            rs = stmt.executeQuery("SELECT * FROM Rollennamen");
            ResultSetMetaData meta = rs.getMetaData();
            int cols = meta.getColumnCount();
            int rownum = 0;
            while (rs.next()) {
                rownum++;
                for (int i = 0; i < cols; i++) {
                    System.out.print(meta.getColumnLabel(i + 1) + ":" + rs.getObject(i + 1) + " ");
                    try {
                        out.println("<label><input type=\"checkbox\" name=\"checkbox-0\" />" + rs.getObject(i + 1) + "</label>");
                    } catch (IOException ex) {
                        Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
                    }

                }
            }
        } catch (ClassNotFoundException err) {
            try {
                out.println("DB-Driver nicht gefunden!");
                out.println(err);
            } catch (IOException ex) {
                Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException err) {
            try {
                out.println("Connect nicht moeglich");
                out.println(err);
            } catch (IOException ex) {
                Logger.getLogger(DBConnector.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
