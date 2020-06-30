package com.ton.controller;

import com.ton.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@SessionAttributes({"username","adminid","stuid","buyerid"})
public class LoginController {
    @Resource
    private UserService userService;

    @RequestMapping("login")
    public String login() {
        System.out.println("nihao");
        return "admin_login";
    }

    @ResponseBody
    @RequestMapping(value = "check", method = RequestMethod.POST)
    public int checkAccount(@RequestParam("userid") int id, @RequestParam("userpass") String pass, Model model) {
        System.out.println("hhhhhhh");
        if (userService.checkAccount(id, pass) == 3) {
            model.addAttribute("username", userService.getBuyerNameById(id));
            model.addAttribute("buyerid", id);
            return 3;
        } else if (userService.checkAccount(id, pass) == 1) {
            model.addAttribute("username", userService.getStuNameById(id));
            model.addAttribute("stuid", id);
            return 1;
        } else if (userService.checkAccount(id, pass) == 2) {
            model.addAttribute("username", userService.getAdminNameById(id));
            model.addAttribute("adminid", id);
            return 2;
        } else {
            model.addAttribute("msg", "密码错误");
            //这里不加redirect，否则前端el取不到值
            return 0;
        }
    }

    @RequestMapping("exit")
    public String exit(HttpServletRequest request) {
        request.getSession().invalidate();
        return "login";
    }

}