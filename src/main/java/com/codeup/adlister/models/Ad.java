package com.codeup.adlister.models;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private String url;
    private int categoryInt;
    private String category;


    public String getUrl() {
        return url;
    }

    public Ad(long id, long userId, String title, String description) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
    }

    public Ad(long userId, String title, String description, int category) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.categoryInt = category;
    }

    public Ad(long id, long userId, String title, String description, String url) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.url = url;
    }

    public Ad(long userId, String title, String description, String url) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.url = url;
    }

    public Ad(long id, long userId, String title, String description, String url, int category) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.url = url;
        this.categoryInt = category;
    }

    public Ad(long userId, String title, String description, String url, int category) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.url = url;
        this.categoryInt = category;
    }

    public Ad(long userId, String title, String description) {
        this.userId = userId;
        this.title = title;
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryInt() {
        return categoryInt;
    }
    public void setCategoryInt(int category) {
        this.categoryInt = category;
    }
//    public String getCategory(){
//        if(category != null){
//            return category;
//        } else if (categoryInt == 0){
//            return null;
//        } else {
//
//        }
//    }
    public void setCategory(String category) {
        this.category = category;
    }
}
