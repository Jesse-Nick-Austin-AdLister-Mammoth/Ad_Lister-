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
        int query = Integer.valueOf(request.getParameter("searchCat"));
        request.setAttribute("categories", DaoFactory.getAdsDao().getCategories());
        request.setAttribute("ads", DaoFactory.getAdsDao().searchCat(query));
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);

    }
}