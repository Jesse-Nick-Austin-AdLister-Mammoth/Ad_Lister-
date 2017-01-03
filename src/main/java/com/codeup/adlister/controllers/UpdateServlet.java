package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateServlet", urlPatterns = "/update")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        User user = (User) request.getSession().getAttribute("user");
        Ad ad;
        if(Integer.valueOf(request.getParameter("category")) != 0){
            if(request.getParameter("fileurl") != null && !request.getParameter("fileurl").equals("")) {
                ad = new Ad(
                        user.getId(),
                        request.getParameter("title"),
                        request.getParameter("description"),
                        request.getParameter("fileurl"),
                        Integer.valueOf(request.getParameter("category"))
                );
            } else {
                ad = new Ad(
                        user.getId(),
                        request.getParameter("title"),
                        request.getParameter("description"),
                        Integer.valueOf(request.getParameter("category"))
                );
            }
        } else {
            if(request.getParameter("fileurl") != null && !request.getParameter("fileurl").equals("")) {
                ad = new Ad(
                        user.getId(),
                        request.getParameter("title"),
                        request.getParameter("description"),
                        request.getParameter("fileurl")
                );
            } else {
                ad = new Ad(
                        user.getId(),
                        request.getParameter("title"),
                        request.getParameter("description")
                );
            }
        }
        DaoFactory.getAdsDao().update(ad);
        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getHeader("Referer"));
    }
}
