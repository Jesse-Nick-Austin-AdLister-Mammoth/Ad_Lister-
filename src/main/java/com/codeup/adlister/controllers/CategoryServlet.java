package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CategoryServlet", urlPatterns = "/cat")
public class CategoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("categories", DaoFactory.getAdsDao().getCategories());
        if(request.getParameter("searchCat") != null){
            int query = Integer.valueOf(request.getParameter("searchCat"));
            request.setAttribute("ads", DaoFactory.getAdsDao().searchCat(query));
        } else {
            request.setAttribute("ads", DaoFactory.getAdsDao().all());
        }
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }
}