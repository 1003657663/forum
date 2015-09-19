package com.zzu.edu;

import com.zzu.myClass.ConnectDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by chao on 2015/9/18.
 */
@WebServlet(name = "Login",urlPatterns = "/login")
public class Login extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        ConnectDB connectDB = new ConnectDB();
        Statement statement = connectDB.getState();
        if(statement!=null){
            String loginSql = "select * from user where name='"+name+"' and password='"+password+"'";
            try {
                ResultSet result = statement.executeQuery(loginSql);
                //判断数据库是否有此人数据
                if(!result.first()){
                    request.setAttribute("isLogin",false);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request,response);
                }else{
                    request.setAttribute("isLogin",true);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else{
            out.println("连接数据库失败");
        }
        connectDB.closeDB();
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
