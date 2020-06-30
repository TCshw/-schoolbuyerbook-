package com.ton.mapper;

import com.ton.entity.Admin;
import com.ton.entity.Buyer;
import com.ton.entity.Student;

public interface UserDao {
    public Student selectStuById(int id);
    public Admin selectAdminById(int id);
    public Buyer selectBuyerById(int id);
    public void updateStuPass(Student student);
    public void updateBuyerPass(Buyer buyer);
    public void updateAdminPass(Admin admin);

}
