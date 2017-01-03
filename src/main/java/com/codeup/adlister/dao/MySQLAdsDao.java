package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;


    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> search(String searchQuery) {
        PreparedStatement stmt = null;
        try {
            String sql = "SELECT * FROM ads WHERE title LIKE ?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, "%" + searchQuery + "%");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ads.", e);
        }
    }

    @Override
    public List<Ad> searchCat(int query) {
        PreparedStatement stmt = null;
        try {
            String sql = "SELECT * FROM ads WHERE category = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, query);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ads.", e);
        }
    }

    public List<Ad> userAll(long userId) { // used to display user ads on user profile
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE user_id = ?");
            stmt.setLong(1, userId);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving your ads");
        }
    }

    @Override
    public HashMap<Integer, String> getCategories(){
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM categories");
            ResultSet rs = stmt.executeQuery();
            HashMap<Integer, String> toReturn = new HashMap<>();
            while(rs.next()){
                toReturn.put(rs.getInt(1), rs.getString(2));
            }
            return toReturn;
        } catch (SQLException e) {
            throw new RuntimeException("Error finding categories");
        }
    }

    public void userDelete(Long id) { //allow user to delete ads from his profile page
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("DELETE FROM ads where id = ?");
            stmt.setLong(1,id);
            ResultSet rs = stmt.executeQuery();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting this ad");
        }
    }

    public List<Ad> userList() {
        return null;
    }

    @Override
    public Long insert(Ad ad) {
        try {
            if(ad.getCategoryInt() > 0){
                String insertQuery = "INSERT INTO ads(user_id, title, description, imgpath, category) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
                stmt.setLong(1, ad.getUserId());
                stmt.setString(2, ad.getTitle());
                stmt.setString(3, ad.getDescription());
                stmt.setString(4, ad.getUrl());
                stmt.setInt(5, ad.getCategoryInt());
                stmt.executeUpdate();
                ResultSet rs = stmt.getGeneratedKeys();
                rs.next();
                return rs.getLong(1);
            } else {
                String insertQuery = "INSERT INTO ads(user_id, title, description, imgpath) VALUES (?, ?, ?, ?)";
                PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
                stmt.setLong(1, ad.getUserId());
                stmt.setString(2, ad.getTitle());
                stmt.setString(3, ad.getDescription());
                stmt.setString(4, ad.getUrl());
                stmt.executeUpdate();
                ResultSet rs = stmt.getGeneratedKeys();
                rs.next();
                return rs.getLong(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) {
        try {
            return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getString("imgpath"),
                rs.getInt("category")
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error in extractAd", e);
        }
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    @Override
    public Ad singleAd(int adId) {
        PreparedStatement stmt = null;
        Ad ad= null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE id = ?");
            stmt.setLong(1, adId);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
               ad = extractAd(rs);
            }
            return ad;
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ad.", e);
        }
    }
}
