package com.ton.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Purchasebook {
    private int bookid;
    private String bookname;
    private String bookauthor;
    private String bookpublisher;
    private int bookprice;
    private int bookquantity;
    private String studentname;
    @JSONField(format="yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date bookdate;

    public Purchasebook(int bookid, String bookname, String bookauthor, String bookpublisher, int bookprice, int bookquantity) {
        this.bookid = bookid;
        this.bookname = bookname;
        this.bookauthor = bookauthor;
        this.bookpublisher = bookpublisher;
        this.bookprice = bookprice;
        this.bookquantity = bookquantity;
    }

    public Purchasebook(int bookid, String bookname, String bookauthor, String bookpublisher, int bookprice, int bookquantity, String studentname) {
        this.bookid = bookid;
        this.bookname = bookname;
        this.bookauthor = bookauthor;
        this.bookpublisher = bookpublisher;
        this.bookprice = bookprice;
        this.bookquantity = bookquantity;
        this.studentname = studentname;
    }

    public Purchasebook(int bookid, String bookname, String bookauthor, String bookpublisher, int bookprice, int bookquantity, String studentname, Date bookdate) {
        this.bookid = bookid;
        this.bookname = bookname;
        this.bookauthor = bookauthor;
        this.bookpublisher = bookpublisher;
        this.bookprice = bookprice;
        this.bookquantity = bookquantity;
        this.studentname = studentname;

        this.bookdate = bookdate;
    }

    public Purchasebook() {

    }



    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getBookauthor() {
        return bookauthor;
    }

    public void setBookauthor(String bookauthor) {
        this.bookauthor = bookauthor;
    }

    public String getBookpublisher() {
        return bookpublisher;
    }

    public void setBookpublisher(String bookpublisher) {
        this.bookpublisher = bookpublisher;
    }

    public int getBookprice() {
        return bookprice;
    }

    public void setBookprice(int bookprice) {
        this.bookprice = bookprice;
    }

    public int getBookquantity() {
        return bookquantity;
    }

    public void setBookquantity(int bookquantity) {
        this.bookquantity = bookquantity;
    }

    public String getStudentname() {
        return studentname;
    }

    public void setStudentname(String studentname) {
        this.studentname = studentname;
    }

    public Date getBookdate() {
        return bookdate;
    }

    public void setBookdate(Date bookdate) {
        this.bookdate = bookdate;
    }

    @Override
    public String toString() {
        return "Purchasebook{" +
                "bookid=" + bookid +
                ", bookname='" + bookname + '\'' +
                ", bookauthor='" + bookauthor + '\'' +
                ", bookpublisher='" + bookpublisher + '\'' +
                ", bookprice=" + bookprice +
                ", bookquantity=" + bookquantity +
                ", studentname='" + studentname + '\'' +
                ", bookdate=" + bookdate +
                '}';
    }
}

