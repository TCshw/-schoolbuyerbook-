package com.ton.service.impl;

import com.ton.entity.*;
import com.ton.mapper.PurchasebookDao;

import com.ton.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.print.Book;
import java.util.List;

@Service
public class BookServiceimpl implements BookService {
    @Autowired
    private PurchasebookDao purchasebookDao;


    public PurchasebookDao getPurchasebookDao() {
        return purchasebookDao;
    }

    public void setPurchasebookDao(PurchasebookDao purchasebookDao) {
        this.purchasebookDao = purchasebookDao;
    }

//    @Override
//    public int addPurchasebook(Purchasebook purchasebook) {
//     return   purchasebookDao.Purchasebook(purchasebook);
//    }

    @Override
    public int Stuinbook(Stuinbook stuinbook) {
        return purchasebookDao.Stuinbook(stuinbook);
    }

    @Override
    public int lackbook(Lockbook lockbook) {
        return purchasebookDao.lockbook(lockbook);
    }

    @Override
    public int buyerinbooks(Books books) {
        return purchasebookDao.buyerinbooks(books);
    }
//    @Override
//    public List<Purchasebook> queryPurchasebook() {
//        return  (List<Purchasebook>) purchasebookDao.querryPurchasebooks();
//    }

    @Override
    public List<Stuinbook> querystuinbook() {
        return (List<Stuinbook>) purchasebookDao.querystuinbook();
    }

    @Override
    public List<Lockbook> buyerqlbook() {
        return (List<Lockbook>) purchasebookDao.buyerqlbook();
    }

    @Override
    public List<Books> querybooks() {
        return (List<Books>) purchasebookDao.querybooks();
    }

    @Override
    public List<Stuinbook> querystuinbookbyname(String bookname) {

        List<Stuinbook> list = purchasebookDao.querystuinbookbyname(bookname);
        System.out.println("输出"+list);
        return list;
    }

    @Override
    public List<Lockbook> buyerqlbookbyid(String bookname) {
        List<Lockbook> list = purchasebookDao.buyerqlbookbyid(bookname);
        System.out.println("输出"+list);
        return list;
    }

    @Override
    public List<Books> querybookbyname(String bookname) {
        List<Books> list = purchasebookDao.querybookbyname(bookname);
        return list;
    }

    @Override
    public List<Stuinbook> studentqstuinbookbySname(String studentname) {
        List<Stuinbook> list = purchasebookDao.studentqstuinbookbySname(studentname);
        return list;
    }

//    @Override
//    public List<Stuinbook> querystuinbookbyname(String bookname) {
//        return(List<Stuinbook>) purchasebookDao.querystuinbookbyname(bookname);
//    }

//    @Override
//    public List<Stuinbook> querystuinbookbyname(String bookname) {
//        return  (List<Stuinbook>) purchasebookDao.querystuinbookbyname(bookname);
//    }
//
//    @Override
//    public List<Existingbooks> queryEbooks() {
//        return  (List<Existingbooks>) purchasebookDao.queryEbooks();
//    }

    @Override
    public int deletebooksbyid(String bookid) {
        return purchasebookDao.deletebooksbyid(bookid);
    }

    @Override
    public int deletelackbook(String bookid) {
        return purchasebookDao.deletelackbook(bookid);
    }


    @Override
    public int UpdateBook(Stuinbook stuinbook) {
        return purchasebookDao.UpdateBook(stuinbook);
    }

    @Override
    public int buyerupdatebook(Books books) {
        return purchasebookDao.buyerupdatebook(books);
    }

    @Override
    public int buyeruplbook(Lockbook lockbook) {
        return purchasebookDao.buyeruplbook(lockbook);
    }
}
