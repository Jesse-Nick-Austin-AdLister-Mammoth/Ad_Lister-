package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.HashMap;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    List<Ad> userAll(long userId);
    List<Ad> search(String searchQuery);
    HashMap<Integer, String> getCategories();
    Ad singleAd(int adId);
    List<Ad> searchCat(int query);
    void userDelete(int id);
}
