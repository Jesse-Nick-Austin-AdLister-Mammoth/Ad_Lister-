package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.SearchServlet", urlPatterns = "/search")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("searchQuery");
        request.setAttribute("categories", DaoFactory.getAdsDao().getCategories());
        if(query != null) {
            request.setAttribute("ads", DaoFactory.getAdsDao().search(query));
            request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
        }
    }
}
