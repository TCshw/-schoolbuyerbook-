package com.ton.controller.student;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ton.Util.LayerResult;
import com.ton.entity.*;
import com.ton.service.BookService;
import com.ton.service.UserService;
import com.ton.service.impl.BookServiceimpl;
import org.apache.ibatis.annotations.Param;
import org.omg.PortableInterceptor.SUCCESSFUL;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("student")
public class StudentController {
JSON json;

    public JSON getJson() {
        return json;
    }

    public void setJson(JSON json) {
        this.json = json;
    }
    int count;
  Purchasebook purchasebook = new Purchasebook();
  Stuinbook stuinbook = new Stuinbook();

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Stuinbook getStuinbook() {
        return stuinbook;
    }

    public void setStuinbook(Stuinbook stuinbook) {
        this.stuinbook = stuinbook;
    }

    public Purchasebook getPurchasebook() {
        return purchasebook;
    }

    public void setPurchasebook(Purchasebook purchasebook) {
        this.purchasebook = purchasebook;
    }

    @Resource
    private UserService userService;
    @Resource
    private BookService bookService;
    @Resource
    private BookServiceimpl bookServiceimpl;

    public BookServiceimpl getBookServiceimpl() {
        return bookServiceimpl;
    }

    public void setBookServiceimpl(BookServiceimpl bookServiceimpl) {
        this.bookServiceimpl = bookServiceimpl;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public BookService getBookService() {
        return bookService;
    }

    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping("/studentIndex")
    public String studentIndex() {
        return "studentIndex";
    }


    @RequestMapping("/studentInfo")
    public String studentInfo(@RequestParam("stuid") int id, Model model) {
        model.addAttribute("student", userService.getStuInfoById(id));
        return "studentInfo";


    }

    @RequestMapping("/editStuPass")
    public String editStuPass(){
        return "stu_editpass";
    }




    @RequestMapping("/changeStuPass")
    @ResponseBody
    public int changPass(@RequestParam("pre") String pre, @RequestParam("now") String now, Model model, HttpServletRequest request){
        int id=(int)request.getSession().getAttribute("stuid");

        System.out.println("xuesdaoda");
        if(userService.checkAccount(id,pre)==0){
            model.addAttribute("msg","原始密码输入错误!");
            return 0;
        }
        else{
            Student student=new Student();
            student.setStuId(id);
            student.setStupass(now);
            userService.changeStuPass(student);
            model.addAttribute("student",userService.getStuInfoById(id));
            System.out.println(student);
            System.out.println("修改密码");
            return 1;
        }


    }


    @ResponseBody
    @RequestMapping(value="/Stuinbook",method = RequestMethod.POST)
  @DateTimeFormat(pattern = "年-月-日")
    public JSON addStuinbook(@ModelAttribute Stuinbook stuinbook) {
        System.out.println("访问到stuinbook");
        //实时获取时间

        stuinbook = new Stuinbook(stuinbook.getBookid(),stuinbook.getBookname(),stuinbook.getBookauthor(),stuinbook.getBookpublisher(),stuinbook.getBookprice(),stuinbook.getBookquantity(),stuinbook.getStudentname(),stuinbook.getBookdate(),stuinbook.getBookstate(),stuinbook.getLackbooks());
        System.out.println(stuinbook.getBookid());
        System.out.println(stuinbook.getBookstate());
        System.out.println(stuinbook.getLackbooks());

        int i =bookService.Stuinbook(stuinbook);
        System.out.println("访问到stuinbook3");

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


//    @ResponseBody
//    @RequestMapping(value="/Purchasebook",method = RequestMethod.POST)
//    @DateTimeFormat(pattern = "年-月-日")
//    public JSON addPurchasebook(@ModelAttribute Purchasebook purchasebook) {
//        System.out.println("访问到stuinbook");
//        //实时获取时间
//
//        purchasebook = new Purchasebook(purchasebook.getBookid(),purchasebook.getBookname(),purchasebook.getBookauthor(),purchasebook.getBookpublisher(),purchasebook.getBookprice(),purchasebook.getBookquantity(),purchasebook.getStudentname(),purchasebook.getBookdate());
//
//        int i =bookServiceimpl.addPurchasebook(purchasebook);
//        System.out.println("访问到stuinbook3");
//
//        if (i>0)
//        {
//            count = 1;
//
//        }else {
//            count = 0;
//        }
//
//
//
//        Map<String,Object> map = new HashMap<String, Object>();
//
//        map.put("count",count);
//        System.out.println(count);
//        json = new JSONObject(map);
//        System.out.println(json);
//
//        return json;
//    }
//









//    @ResponseBody
//    @RequestMapping(value="/queryPurchasebook")
//@DateTimeFormat(pattern = "yyyy-MM-dd")
//
//   // public String execute() throws Exception {
//    public  JSON queryPurchasebook() {
//        System.out.println("nihao");
//
//        List<Purchasebook> list = bookService.queryPurchasebook();
//        System.out.println(list);
//        // 通过该类解析成 Layer 表格能识别的Json数据
//     json = LayerResult.getJson(list);
//        System.out.println(json);
//        return json;
//    }


    @ResponseBody
    @RequestMapping(value="/querystuinbook")
    @DateTimeFormat(pattern = "yyyy-MM-dd")

    // public String execute() throws Exception {
    public  JSON querystuinbook() {
        System.out.println("nihao");

        List<Stuinbook> list = bookService.querystuinbook();
        System.out.println(list);
        // 通过该类解析成 Layer 表格能识别的Json数据
        json = LayerResult.getJson(list);
        System.out.println(json);
        return json;
    }







    @RequestMapping("/queryPurchasebook2")

    public String queryPurchasebook2() {
        System.out.println("qingqiud");
        return "querrybooks";
    }


    @RequestMapping("/fileImp1")
    @ResponseBody
    // 不返回json数据就要添加ResponseBody标签
    public Map<String,Object> fileImp1(@RequestParam("file") MultipartFile file , HttpServletRequest request)  {
        System.out.println("nih");
        String path = request.getSession().getServletContext().getRealPath("filePage");

        File newfile = new File(path, file.getOriginalFilename());
        Map map = new HashMap();
        System.out.printf(file.getOriginalFilename());

        try {
            file.transferTo(newfile);
            map.put("msg","OK");
            map.put("code",200);
        } catch (IOException e) {
            e.printStackTrace();
            map.put("msg","erro");
            map.put("code",0);
        }

        return map;
    }




    @RequestMapping("/studentqstuinbookbySname/{studentname}")
    @ResponseBody
    // public String execute() throws Exception {
    public JSON studentqstuinbookbySname(@PathVariable String studentname) {
        System.out.println(studentname);



        List<Stuinbook> list = bookService.studentqstuinbookbySname(studentname);

        System.out.println(list);
        // 通过该类解析成 Layer 表格能识别的Json数据
        json = LayerResult.getJson(list);
        System.out.println(json.toJSONString());


        System.out.println(json);
        return json;
    }

    @ResponseBody
    @RequestMapping(value="/querybooks")
  //  @DateTimeFormat(pattern = "yyyy-MM-dd")

    // public String execute() throws Exception {
    public  JSON querybooks() {
        System.out.println("nihao");

        List<Books> list = bookService.querybooks();
        System.out.println(list);
        // 通过该类解析成 Layer 表格能识别的Json数据
        json = LayerResult.getJson(list);
        System.out.println(json);
        return json;
    }

    @RequestMapping("/querybookbyname/{bookname}")
    @ResponseBody
    // public String execute() throws Exception {
    public JSON querybookbyname(@PathVariable String bookname) {
        System.out.println(bookname);

        System.out.println("bookname");

        // Stuinbook stuinbook = new Stuinbook(bookname);
        List<Books> list = bookService.querybookbyname(bookname);

        System.out.println(list);
        // 通过该类解析成 Layer 表格能识别的Json数据
        json = LayerResult.getJson(list);
        System.out.println(json.toJSONString());


        System.out.println(json);
        return json;
    }



}