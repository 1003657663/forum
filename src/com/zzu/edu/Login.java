package com.zzu.edu;

import com.zzu.AboutDB.CheckUser;
import com.zzu.AboutDB.ConnectDB;
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
        CheckUser checkUser = new CheckUser();
        if(checkUser.isUser(name,password)){
            //登陆成功
            //分配session
            HttpSession session = request.getSession(true);
            session.setAttribute("isLogin",true);
            session.setAttribute("name", name);
            out.print(true);
        }else{
            //登陆失败
            out.print(false);
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
