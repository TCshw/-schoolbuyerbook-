package com.ton.service;

import com.ton.entity.Admin;
import com.ton.entity.Buyer;
import com.ton.entity.Student;

public interface UserService {
    public int checkAccount(int id,String pass);
    public String getStuNameById(int id);
    public String getBuyerNameById(int id);
    public  String  getAdminNameById(int id);
    public Student getStuInfoById(int id);
    public Buyer getBuyerInfoById(int id);
    public Admin getAdminInfoById(int id);
    public void changeStuPass(Student student);
    public void changeBuyerPass(Buyer buyer);
    public void changeAdminPass(Admin admin);

}