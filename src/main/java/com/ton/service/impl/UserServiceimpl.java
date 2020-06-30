package com.ton.service.impl;

import com.ton.entity.Admin;
import com.ton.entity.Buyer;
import com.ton.entity.Student;
import com.ton.mapper.UserDao;
import com.ton.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class UserServiceimpl implements UserService {

    @Autowired
    private UserDao userDao;

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public int checkAccount(int id, String pass) {



        if(Integer.toString(id).charAt(4)=='0'){
            if(userDao.selectBuyerById(id).getBuyerpass().equals(pass))
                return 3;
            else
                return 0;

        }else if(Integer.toString(id).charAt(4)=='1'){
            if(userDao.selectStuById(id).getStupass().equals(pass))
                return 1;
            else
                return 0;

        }else  if(Integer.toString(id).charAt(4)=='2'){

            if(userDao.selectAdminById(id).getAdminpass().equals(pass))
                return 2;
            else
                return 0;

        }else{
            return 0;
        }
    }

    @Override
    public String getStuNameById(int id) {
        return userDao.selectStuById(id).getStuName();
    }

    @Override
    public String getBuyerNameById(int id) {
        return userDao.selectBuyerById(id).getBuyername();
    }

    @Override
    public String getAdminNameById(int id) {
        return userDao.selectAdminById(id).getAdminname();
    }

    @Override
    public Student getStuInfoById(int id) {
        return userDao.selectStuById(id);
    }

    @Override
    public Buyer getBuyerInfoById(int id) {
        return userDao.selectBuyerById(id);
    }

    @Override
    public Admin getAdminInfoById(int id) {
        return userDao.selectAdminById(id);
    }

    @Override
    public void changeStuPass(Student student) {
        userDao.updateStuPass(student);
    }

    @Override
    public void changeBuyerPass(Buyer buyer) {
        userDao.updateBuyerPass(buyer);
    }

    @Override
    public void changeAdminPass(Admin admin) {
        userDao.updateAdminPass(admin);
    }


}

