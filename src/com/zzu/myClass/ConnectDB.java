package com.zzu.myClass;

import java.sql.*;

/**
 * Created by 宋超 on 2015/9/19.
 */

public class ConnectDB {
    Connection connection = null;
    Statement statement = null;
    public ConnectDB(){
        String url = "jdbc:mysql://localhost:3306/forum?characterEncoding=utf-8";
        String name = "root";
        String password = "19930926";
        try {
            Class.forName("org.gjt.mm.mysql.Driver").newInstance();
            connection = DriverManager.getConnection(url,name,password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Statement getState(){
        try {
            statement = connection.createStatement();
            return statement;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void closeDB(){
        try {
            if(statement!=null)
                statement.close();
            if(connection!=null)
                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
