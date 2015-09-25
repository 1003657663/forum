package com.zzu.AboutDB;

import com.zzu.model.Tiezi;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by 宋超 on 2015/9/23.
 */
public class GetTiezi {
    ConnectDB connectDB;
    public GetTiezi(){
        connectDB = new ConnectDB();
    }
    public ArrayList<Tiezi> getTieziInfo(){
        ArrayList<Tiezi> tieziS = new ArrayList<>();
        Statement statement = connectDB.getState();
        String tieziSql = "select * from tiezi";
        try {
            ResultSet resultSet = statement.executeQuery(tieziSql);
            while (resultSet.next()){
                Tiezi tiezi = new Tiezi();
                tiezi.setBankuaiID(resultSet.getInt("id"));
                tiezi.setTitle(resultSet.getString("title"));
                tiezi.setContext(resultSet.getString("context"));
                tiezi.setPeopleID(resultSet.getInt("peopleID"));
                tiezi.setTime(resultSet.getString("time"));
                tiezi.setLike(resultSet.getInt("like"));
                tiezi.setIsGood(resultSet.getInt("isGood"));
                tiezi.setClick(resultSet.getInt("click"));
                tieziS.add(tiezi);
            }
            return tieziS;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
