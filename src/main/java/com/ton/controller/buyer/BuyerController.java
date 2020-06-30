package com.ton.controller.buyer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ton.Util.LayerResult;
import com.ton.entity.*;
import com.ton.service.BookService;
import com.ton.service.UserService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("buyer")
public class BuyerController {
    JSON json;

    public JSON getJson() {
        return json;
    }

    public void setJson(JSON json) {
        this.json = json;
    }
    int count;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    Books books;

    public Books getBooks() {
        return books;
    }

    public void setBooks(Books books) {
        this.books = books;
    }

    @Resource
    private BookService bookService;

    public BookService getBookService() {
        return bookService;
    }

    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @Resource
    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/buyerindex")
    public String buyerindex() {
        return "buyer_index";
    }

    @RequestMapping("/buyerinfo")
    public String buyerinfo(@RequestParam("buyerid") int id, Model model) {
        model.addAttribute("buyer", userService.getBuyerInfoById(id));
        return "buyer_info";


    }
    @RequestMapping("/buyereditPass")
    public String buyereditPass(){
        return "buyer_editPass";
    }
 @ResponseBody
    @RequestMapping("/changebuyerPass")
    public int changPass(@RequestParam("pre") String pre, @RequestParam("now") String now, Model model, HttpServletRequest request){
        int id=(int)request.getSession().getAttribute("buyerid");
        if(userService.checkAccount(id,pre)==0){
            model.addAttribute("msg","原始密码输入错误!");
            return 0;
        }
        else{
            Buyer buyer=new Buyer();
            buyer.setBuyerid(id);
            buyer.setBuyerpass(now);
            userService.changeBuyerPass(buyer);
            model.addAttribute("buyer",userService.getBuyerInfoById(id));
            System.out.println(buyer);
            System.out.println("修改密码");
            return 1;
        }


    }
    @RequestMapping("/buyerupdatebook")
    @ResponseBody
    public JSON UpdateBook(@ModelAttribute Books books) {
        System.out.println("请求UpdateBook到达");

        int count = bookService.buyerupdatebook(books);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("count",count);
        json = new JSONObject(map);
        System.out.println(json);

        return json;
    }

    @ResponseBody
    @RequestMapping(value="/buyer_inbooks",method = RequestMethod.POST)
    @DateTimeFormat(pattern = "年-月-日")
    public JSON buyerinbooks(@ModelAttribute Books books) {
        System.out.println("buyer_inbooks");
        //实时获取时间

        books = new Books(books.getBookid(),books.getBookname(),books.getBookauthor(),books.getBookpublisher(),books.getBookprice(),books.getMajor(),books.getBookquantity());
        System.out.println(books.getBookid());


        int i =bookService.buyerinbooks(books);
        System.out.println(i);

        if (i>0)
        {
            count = 1;

        }else {
            count = 0;
        }



        Map<String,Object> map = new HashMap<String, Object>();

        map.put("count",count);
        System.out.println(count);
        json = new JSONObject(map);
        System.out.println(json);

        return json;
    }

    @ResponseBody
    @RequestMapping(value="/buyerqlbook")
  //  @DateTimeFormat(pattern = "yyyy-MM-dd")

    // public String execute() throws Exception {
    public  JSON buyerqlbook() {
        System.out.println("nihao");

        List<Lockbook> list = bookService.buyerqlbook();
        System.out.println(list);
        // 通过该类解析成 Layer 表格能识别的Json数据
        json = LayerResult.getJson(list);
        System.out.println(json);
        return json;
    }

    @RequestMapping("/deletelackbook")
    @ResponseBody
    public JSON deletelackbook(@RequestParam String bookid) {
        System.out.println("进入ddeletelackbook方法");
        System.out.println(bookid);
        int count = bookService.deletelackbook(bookid);
        System.out.println(count);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("count",count);
        json = new JSONObject(map);
        System.out.println(json);
        return json;
    }

    @RequestMapping("/buyerqlbookbyid/{bookname}")
    @ResponseBody
    // public String execute() throws Exception {
    public JSON buyerqlbookbyid(@PathVariable String bookname) {
        System.out.println(bookname);

        System.out.println("bookname");

        // Stuinbook stuinbook = new Stuinbook(bookname);
        List<Lockbook> list = bookService.buyerqlbookbyid(bookname);

        System.out.println(list);
        // 通过该类解析成 Layer 表格能识别的Json数据
        json = LayerResult.getJson(list);
        System.out.println(json.toJSONString());


        System.out.println(json);
        return json;
    }

    @RequestMapping("/buyeruplbook")
    @ResponseBody
    public JSON buyeruplbook(@ModelAttribute Lockbook lockbook) {
        System.out.println("请求UpdateBook到达");

        int count = bookService.buyeruplbook(lockbook);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("count",count);
        json = new JSONObject(map);
        System.out.println(json);

        return json;
    }
}