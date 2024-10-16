package com.company;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="login",urlPatterns = {"/2120500841"})
public class LoginServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charaset=UTF-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.write("<div id=info style='background-color:#77ccff'>");
        printWriter.write("<h3 style='text-align:center;color:#225588'>"+"2120500841"+"</h3>" + "<br>");
        printWriter.write("<h3 style='text-align:center;color:#225588'>"+"郭旭杰"+"</h3>" + "<br>");
        printWriter.write("<h3 style='text-align:center;color:#225588'>"+"男"+"</h3>" + "<br>");
        printWriter.write("<h3 style='text-align:center;color:#225588'>"+"2002-10-13"+"</h3>" + "<br>");
        printWriter.write("<h3 style='text-align:center;color:#225588'>"+"宁夏省银川市"+"</h3>");
        printWriter.write("</div>");
        printWriter.write("<h3 style='text-align:center;color:#225588'>");
        printWriter.write("<h3 style='text-align:center;color:#225588'>");
        printWriter.write("<h3 style='text-align:center;color:#225588'>");
    }
}
