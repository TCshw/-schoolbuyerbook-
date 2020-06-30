package com.ton.entity;

import com.alibaba.fastjson.annotation.JSONField;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Stuinbook {

    private String bookid;
    private String bookname;
    private String bookauthor;
    private String bookpublisher;
    private int bookprice;
    private int bookquantity;
    private String studentname;

    @JSONField(format="yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date bookdate;
    private String bookstate;
    private int lackbooks;

    public Stuinbook(String bookid, String bookname, String bookauthor, String bookpublisher, int bookprice, int bookquantity, String studentname, Date bookdate, String bookstate, int lackbooks) {
        this.bookid = bookid;
        this.bookname = bookname;
        this.bookauthor = bookauthor;
        this.bookpublisher = bookpublisher;
        this.bookprice = bookprice;
        this.bookquantity = bookquantity;
        this.studentname = studentname;
        this.bookdate = bookdate;
        this.bookstate = bookstate;
        this.lackbooks = lackbooks;
    }

    public Stuinbook(String bookid, String bookname, String bookauthor, String bookpublisher, int bookprice, int bookquantity, String studentname, Date bookdate, String bookstate) {
        this.bookid = bookid;
        this.bookname = bookname;
        this.bookauthor = bookauthor;
        this.bookpublisher = bookpublisher;
        this.bookprice = bookprice;
        this.bookquantity = bookquantity;
        this.studentname = studentname;
        this.bookdate = bookdate;
        this.bookstate = bookstate;
    }

    public Stuinbook() {
    }

    public Stuinbook(String bookname) {

    }

    public String getBookid() {
        return bookid;
    }

    public void setBookid(String bookid) {
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

    public String getBookstate() {
        return bookstate;
    }

    public void setBookstate(String bookstate) {
        this.bookstate = bookstate;
    }

    public int getLackbooks() {
        return lackbooks;
    }

    public void setLackbooks(int lackbooks) {
        this.lackbooks = lackbooks;
    }

    @Override
    public String toString() {
        return "Stuinbook{" +
                "bookid='" + bookid + '\'' +
                ", bookname='" + bookname + '\'' +
                ", bookauthor='" + bookauthor + '\'' +
                ", bookpublisher='" + bookpublisher + '\'' +
                ", bookprice=" + bookprice +
                ", bookquantity=" + bookquantity +
                ", studentname='" + studentname + '\'' +
                ", bookdate=" + bookdate +
                ", bookstate='" + bookstate + '\'' +
                ", lackbooks=" + lackbooks +
                '}';
    }
}
