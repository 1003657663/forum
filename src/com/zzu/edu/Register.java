package com.zzu.edu;

import com.zzu.myClass.ConnectDB;
import sun.text.resources.FormatData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 宋超 on 2015/9/19.
 * 注册用servlet
 */
@WebServlet(name = "Register",urlPatterns = "/register")
public class Register extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        response.setStatus(200);
        ConnectDB connectDB = new ConnectDB();
        Statement statement = connectDB.getState();
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String time = dateFormat.format(date);

        //---------在获得的值都不为空的情况下
        if(name!=""&&password!=""&&email!="") {
            String checkSql = "select * from user where name='"+name+"'";
            String loginSql = "insert into user values (null,'"+name+"','"+password+"','"+email+"',0,null,null,null,null,'"+time+"')";
            try {
                //查询是否存在此名字的用户，如果存在返回exist
                ResultSet resultSet = statement.executeQuery(checkSql);
                if(resultSet.first()){
                    //存在此用户
                    out.print("exist");
                }else {
                    //注册成功
                    statement.execute(loginSql);
                    HttpSession session = request.getSession(true);
                    session.setAttribute("isLogin",true);
                    session.setAttribute("name",name);
                    out.print(true);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.print(false);
            }
        }else {
            out.print("null");
        }
        connectDB.closeDB();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
