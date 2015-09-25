package com.zzu.model;

/**
 * Created by chao on 2015/9/23.
 */
public class Tiezi {
    private int id;
    private String title;
    private String context;
    private int peopleID;
    private int bankuaiID;
    private String time;
    private int click;
    private int like;
    private int isGood;
    public Tiezi(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public int getPeopleID() {
        return peopleID;
    }

    public void setPeopleID(int peopleID) {
        this.peopleID = peopleID;
    }

    public int getBankuaiID() {
        return bankuaiID;
    }

    public void setBankuaiID(int bankuaiID) {
        this.bankuaiID = bankuaiID;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getClick() {
        return click;
    }

    public void setClick(int click) {
        this.click = click;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getIsGood() {
        return isGood;
    }

    public void setIsGood(int isGood) {
        this.isGood = isGood;
    }
}
