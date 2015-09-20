package com.zzu.edu;

import com.zzu.myClass.ConnectDB;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by chao on 2015/9/18.
 * 登陆用servlet
 */
@WebServlet(name = "Login",urlPatterns = "/login")
public class Login extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setStatus(200);
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
                    //登陆失败
                    out.print(false);
                }else{
                    //登陆成功
                    //分配session
                    HttpSession session = request.getSession(true);
                    session.setAttribute("isLogin",true);
                    session.setAttribute("name",name);
                    out.print(true);
                }
            } catch (SQLException e) {
                //登陆异常
                response.setStatus(500);
                out.print("null");
                e.printStackTrace();
            }
        }else{
            response.setStatus(500);
            out.println("null");
        }
        connectDB.closeDB();
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
