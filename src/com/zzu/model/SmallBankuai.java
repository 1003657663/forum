package com.zzu.model;

/**
 * Created by chao on 2015/9/23.
 * 小版块的javabean
 */
public class SmallBankuai {
    private int id;//小版块ID
    private String name;//小版块名字
    private String descript;//小版块的描述
    private int parentID;//小版块的福板块ID
    private String time;//小版块的创建时间

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }

    public int getParentID() {
        return parentID;
    }

    public void setParentID(int parentID) {
        this.parentID = parentID;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public SmallBankuai(){

    }
}
