package com.it.entity;


import java.io.Serializable;

public class Member implements Serializable {
    private int id;
    private String uname;
    private String upass;
    private String nickname;
    private String tel;
    private String email;
    private double yue;
    private String delstatus;
    private String filename;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpass() {
        return upass;
    }

    public void setUpass(String upass) {
        this.upass = upass;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public double getYue() {
        return yue;
    }

    public void setYue(double yue) {
        this.yue = yue;
    }

    public String getDelstatus() {
        return delstatus;
    }

    public void setDelstatus(String delstatus) {
        this.delstatus = delstatus;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }
}
