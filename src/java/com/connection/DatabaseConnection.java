/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.connection;

/**
 *
 * @author prateek
 */

import com.mysql.cj.jdbc.Driver;
import java.sql.*;

public class DatabaseConnection {
//    public DatabaseConnection() throws SQLException{
//        makeConnection();
//    } 

    public static Connection connection;  

     public static Connection getConnection() throws SQLException {
        if (connection == null) {
             new Driver();
                     // buat koneksi
             connection = DriverManager.getConnection(
                       "jdbc:mysql://localhost/logistics",
                       "root",
                       "");
         }
         return connection;
     }  

  //Creating universal method to close connect will mysql database
    public static void CloseConnection() {
        if (connection != null) {
            try {
                connection.close();
                connection = null;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    //Creating universal method to query for retriving information
    public static ResultSet getResultFromSqlQuery(String SqlQueryString) {
        //Creating Resultset object
        ResultSet rs = null;
        try {
            //Checking whether the connection is null or null
            if (connection == null) {
                getConnection();
            }
            //Querying the query
            rs = connection.createStatement().executeQuery(SqlQueryString);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rs;
    }

    //Creating universal method to query for inserting or updating information in mysql database
    public static int insertUpdateFromSqlQuery(String SqlQueryString) {
        int i = 2;
        try {
            //Checking whether the connection is null or null
            if (connection == null) {
                getConnection();
            }
            //Querying the query
            i = connection.createStatement().executeUpdate(SqlQueryString);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return i;
    }
}