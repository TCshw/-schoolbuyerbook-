package com.ton.entity;

public class Lockbook {
    private  String bookid;
    private String bookname;
    private String bookauthor;
    private String bookpublisher;
    private  int bookprice;
    private int bookquantity;

    public Lockbook(String bookid, String bookname, String bookauthor, String bookpublisher, int bookprice, int bookquantity) {
        this.bookid = bookid;
        this.bookname = bookname;
        this.bookauthor = bookauthor;
        this.bookpublisher = bookpublisher;
        this.bookprice = bookprice;
        this.bookquantity = bookquantity;
    }

    public Lockbook() {
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

    public int getBookquantity() {
        return bookquantity;
    }

    public void setBookquantity(int bookquantity) {
        this.bookquantity = bookquantity;
    }

    public int getBookprice() {
        return bookprice;
    }

    public void setBookprice(int bookprice) {
        this.bookprice = bookprice;
    }

    @Override
    public String toString() {
        return "Lockbook{" +
                "bookid='" + bookid + '\'' +
                ", bookname='" + bookname + '\'' +
                ", bookauthor='" + bookauthor + '\'' +
                ", bookpublisher='" + bookpublisher + '\'' +
                ", bookprice=" + bookprice +
                ", bookquantity=" + bookquantity +
                '}';
    }
}
