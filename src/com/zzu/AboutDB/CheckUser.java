package com.zzu.AboutDB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by chao on 2015/9/23.
 */
public class CheckUser {
    ConnectDB connectDB;
    public CheckUser(){
        connectDB = new ConnectDB();
    }
    public boolean isUser(String name,String password){
        Statement statement = connectDB.getState();
        String checkSql = "select * from user where name='"+name+"' and password='"+password+"'";
        try {
            ResultSet resultSet = statement.executeQuery(checkSql);
            if(resultSet.first()){
                return true;
            }else{
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean insertUser(){
        return true;
    }
}
