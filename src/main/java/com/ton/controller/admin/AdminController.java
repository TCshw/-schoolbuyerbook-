package com.ton.controller.admin;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ton.Util.LayerResult;
import com.ton.entity.*;
import com.ton.service.BookService;
import com.ton.service.UserService;
import com.ton.service.impl.BookServiceimpl;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("admin")
public class AdminController {

private String bookname;

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }
int count;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    JSON json;

    public JSON getJson() {
        return json;
    }

    public void setJson(JSON json) {
        this.json = json;
    }

    @Resource
    private UserService userService;


    public UserService getUserService() {
        return userService;
    }
    @Autowired
    private BookService bookService;

    public BookService getBookService() {
        return bookService;
    }


    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @Resource
    private BookServiceimpl bookServiceimpl;

    public BookServiceimpl getBookServiceimpl() {
        return bookServiceimpl;
    }

    public void setBookServiceimpl(BookServiceimpl bookServiceimpl) {
        this.bookServiceimpl = bookServiceimpl;
    }
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/adminindex")
    public String adminindex() {
        return "admin_index";
    }

    @RequestMapping("/admininfo")
    public String admininfo(@RequestParam("adminid") int id, Model model) {
        model.addAttribute("admin", userService.getAdminInfoById(id));
        return "admin_info";


    }
    @RequestMapping("/admineditPass")
    public String admineditPass(){
        return "admin_editPass";
    }



    @RequestMapping("/changeadminPass")
    @ResponseBody
    public int  changPass(@RequestParam("pre") String pre, @RequestParam("now") String now, Model model, HttpServletRequest request){
        int id=(int)request.getSession().getAttribute("adminid");
        if(userService.checkAccount(id,pre)==0){
            model.addAttribute("msg","原始密码输入错误!");
            return 0;
        }
        else{
            Admin admin=new Admin();
            admin.setAdminid(id);
            admin.setAdminpass(now);
            userService.changeAdminPass(admin);
            model.addAttribute("admin",userService.getAdminInfoById(id));
            System.out.println(admin);
            System.out.println("修改密码");
            return 1;
        }


    }

//    @RequestMapping("/queryEbooks")
//    @ResponseBody
//    // public String execute() throws Exception {
//    public JSON queryEbooks() {
//        System.out.println("nihaoqueryEbooks");
//        List<Existingbooks> list = bookService.queryEbooks();
//       // System.out.println("nihaoqueryEbooks");
//
//        System.out.println(list);
//        // 通过该类解析成 Layer 表格能识别的Json数据
//        json = LayerResult.getJson(list);
//        System.out.println(json.toJSONString());
//      //  System.out.println(list.ge);
//        System.out.println(json);
//        return json;
//    }


    @RequestMapping("/adminquerystuinbook")
    @ResponseBody

    // public String execute() throws Exception {
    public JSON adminquerystuinbook() {
        System.out.println("nihaoqueryEbooks");
        List<Stuinbook> list;

        // System.out.println("nihaoqueryEbooks");
//        if (bookname == null) {
             list = bookServiceimpl.querystuinbook();
//
//            System.out.println(list);
//        }
//        else {
//            System.out.println("bookname");
//            Stuinbook stuinbook = new Stuinbook(bookname);
//            list = bookServiceimpl.querystuinbookbyname(stuinbook);
//        }
//        System.out.println(list);
        // 通过该类解析成 Layer 表格能识别的Json数据
        json = LayerResult.getJson(list);
        System.out.println(json.toJSONString());
        //  System.out.println(list.ge);

        System.out.println(json);
        return json;
    }

    @RequestMapping("/adminqstuinbookbyname/{bookname}")
    @ResponseBody
    // public String execute() throws Exception {
    public JSON adminqstuinbookbyname(@PathVariable String bookname) {
        System.out.println(bookname);

        System.out.println("bookname");

           // Stuinbook stuinbook = new Stuinbook(bookname);
        List<Stuinbook> list = bookService.querystuinbookbyname(bookname);

   System.out.println(list);
        // 通过该类解析成 Layer 表格能识别的Json数据
        json = LayerResult.getJson(list);
        System.out.println(json.toJSONString());


        System.out.println(json);
        return json;
    }



    @RequestMapping("/deletebooksbyid")
    @ResponseBody
    public JSON deletebooksbyid(@RequestParam String bookid) {
        System.out.println("进入deletebooksbyid方法");
        System.out.println(bookid);
        int count = bookServiceimpl.deletebooksbyid(bookid);
        System.out.println(count);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("count",count);
        json = new JSONObject(map);
        System.out.println(json);
        return json;
    }
  @RequestMapping("/UpdateBook")
  @ResponseBody
  public JSON UpdateBook(@ModelAttribute Stuinbook stuinbook) {
      System.out.println("请求UpdateBook到达");

      int count = bookService.UpdateBook(stuinbook);
      Map<String,Object> map = new HashMap<String, Object>();
      map.put("count",count);
      json = new JSONObject(map);
      System.out.println(json);

      return json;
  }

    @ResponseBody
    @RequestMapping(value="/lackbook",method = RequestMethod.POST)
    @DateTimeFormat(pattern = "年-月-日")
    public JSON lackbook(@ModelAttribute Lockbook lockbook) {
        System.out.println("访问到lackbook");
        //实时获取时间

        lockbook = new Lockbook(lockbook.getBookid(),lockbook.getBookname(),lockbook.getBookauthor(),lockbook.getBookpublisher(),lockbook.getBookprice(),lockbook.getBookquantity());
        System.out.println(lockbook.getBookid());


        int i =bookService.lackbook(lockbook);
        System.out.println("访问到Lockbook");

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


}
