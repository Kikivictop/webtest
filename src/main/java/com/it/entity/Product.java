package com.it.entity;


import java.io.Serializable;

public class Product implements Serializable {
    private int id;
    private String productname;
    private String filename;
    private String fid;
    private String sid;
    private Double price;
    private String addr;
    private String content;
    private String savetime;
    private String delstatus;
    private String istj;
    private int salenum;
    private int favnum;

    private int kc;

    private Category fcategory;
    private Category scategory;


    public int getSalenum() {
        return salenum;
    }

    public void setSalenum(int salenum) {
        this.salenum = salenum;
    }

    public int getFavnum() {
        return favnum;
    }

    public void setFavnum(int favnum) {
        this.favnum = favnum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSavetime() {
        return savetime;
    }

    public void setSavetime(String savetime) {
        this.savetime = savetime;
    }

    public String getDelstatus() {
        return delstatus;
    }

    public void setDelstatus(String delstatus) {
        this.delstatus = delstatus;
    }

    public String getIstj() {
        return istj;
    }

    public void setIstj(String istj) {
        this.istj = istj;
    }

    public int getKc() {
        return kc;
    }

    public void setKc(int kc) {
        this.kc = kc;
    }

    public Category getFcategory() {
        return fcategory;
    }

    public void setFcategory(Category fcategory) {
        this.fcategory = fcategory;
    }

    public Category getScategory() {
        return scategory;
    }

    public void setScategory(Category scategory) {
        this.scategory = scategory;
    }
}
