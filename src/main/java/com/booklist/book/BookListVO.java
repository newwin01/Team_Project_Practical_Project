package com.booklist.book;

import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

public class BookListVO {

    private int seq;
    private String title;
    private String writer;
    private Date regdate;
    private int cnt;
    private String category;
    private String photo;
    private Date mod_date;

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    private String month;

    private MultipartFile uploadFile;

    public MultipartFile getUploadFile(){
        return uploadFile;
    }

    public void setUploadFile(MultipartFile uploadFile){
        this.uploadFile = uploadFile;
    }

    public Date getMod_date() {
        return mod_date;
    }

    public void setMod_date(Date mod_date) {
        this.mod_date = mod_date;
    }

    public int getArrived_date() {
        return arrived_date;
    }

    public void setArrived_date(int arrived_date) {
        this.arrived_date = arrived_date;
    }

    private int arrived_date;
    private int price;
    private int pay_method;

    private String content;

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public Date getModdate() {
        return mod_date;
    }

    public void setModdate(Date moddate) {
        this.mod_date = moddate;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getPhoto() {
        return photo;
    }


    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPay_method() {
        return pay_method;
    }

    public void setPay_method(int pay_method) {
        this.pay_method = pay_method;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
