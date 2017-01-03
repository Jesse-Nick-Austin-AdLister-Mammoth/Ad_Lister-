package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ShowAdServlet", urlPatterns = "/ads/show")
public class ShowAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int AdID = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("categories", DaoFactory.getAdsDao().getCategories());
        request.setAttribute("ad", DaoFactory.getAdsDao().singleAd(AdID));
        request.getRequestDispatcher("/WEB-INF/ads/show.jsp").forward(request, response);
    }

}
