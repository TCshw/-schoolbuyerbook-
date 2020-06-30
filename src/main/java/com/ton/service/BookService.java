package com.ton.service;

import com.ton.entity.*;

import java.util.List;

public interface BookService {

//   public int addPurchasebook(Purchasebook purchasebook);
   public int Stuinbook(Stuinbook stuinbook);
   public  int lackbook(Lockbook lockbook);
   public  int buyerinbooks(Books books);
//   List<Purchasebook> queryPurchasebook();
   List<Stuinbook> querystuinbook();
   List<Lockbook> buyerqlbook();
   List<Books> querybooks();
   List<Stuinbook> querystuinbookbyname(String bookname);

   List<Lockbook> buyerqlbookbyid(String bookname);
   List<Books> querybookbyname(String bookname);
   List<Stuinbook> studentqstuinbookbySname(String studentname);
//   List<Existingbooks> queryEbooks();
   int  deletebooksbyid(String bookid);
   int deletelackbook(String bookid);

  int  UpdateBook(Stuinbook stuinbook);
  int buyerupdatebook(Books books);
  int buyeruplbook(Lockbook lockbook);

}
