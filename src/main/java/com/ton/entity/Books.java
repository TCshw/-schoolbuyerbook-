package com.ton.entity;

public class Books {
    private  String bookid;
    private  String bookname;
    private String bookauthor;
    private String bookpublisher;
    private int bookprice;
    private  String major;
    private int bookquantity;

    public Books(String bookid, String bookname, String bookauthor, String bookpublisher, int bookprice, String major, int bookquantity) {
        this.bookid = bookid;
        this.bookname = bookname;
        this.bookauthor = bookauthor;
        this.bookpublisher = bookpublisher;
        this.bookprice = bookprice;
        this.major = major;
        this.bookquantity = bookquantity;
    }

    public Books() {
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

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public int getBookquantity() {
        return bookquantity;
    }

    public void setBookquantity(int bookquantity) {
        this.bookquantity = bookquantity;
    }

    @Override
    public String toString() {
        return "Books{" +
                "bookid='" + bookid + '\'' +
                ", bookname='" + bookname + '\'' +
                ", bookauthor='" + bookauthor + '\'' +
                ", bookpublisher='" + bookpublisher + '\'' +
                ", bookprice=" + bookprice +
                ", major='" + major + '\'' +
                ", bookquantity=" + bookquantity +
                '}';
    }
}
