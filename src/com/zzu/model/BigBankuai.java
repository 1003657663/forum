package com.zzu.model;

/**
 * Created by chao on 2015/9/23.
 */
public class BigBankuai {
    private int id;//大板块id
    private String name;//大板块的名字
    private String time;//打板块的创建时间
    private int admin;//大板块的管理员

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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public BigBankuai(){

    }

}
