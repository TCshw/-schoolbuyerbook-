package com.ton.mapper;

import com.ton.entity.*;

import java.util.List;

public interface PurchasebookDao {

//    int Purchasebook(Purchasebook purchasebook);
    int Stuinbook(Stuinbook stuinbook);
   int  lockbook(Lockbook lockbook);

    int buyerinbooks(Books books);
//    List<Purchasebook> querryPurchasebooks();
    List<Stuinbook> querystuinbook();
    List<Books> querybooks();
    List<Lockbook> buyerqlbook();
    List<Books> querybookbyname(String bookname);
    List<Stuinbook> querystuinbookbyname(String bookname);
    List<Lockbook> buyerqlbookbyid(String bookname);

    List<Stuinbook> studentqstuinbookbySname(String studentname);

//    List<Existingbooks> queryEbooks();
    int deletebooksbyid(String bookid);
    int deletelackbook(String bookid);
    int UpdateBook(Stuinbook stuinbook);
    int buyerupdatebook(Books books);
    int buyeruplbook(Lockbook lockbook);
}
