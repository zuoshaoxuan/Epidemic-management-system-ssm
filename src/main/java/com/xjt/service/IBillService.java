package com.xjt.service;

import com.xjt.model.Bill;
import com.xjt.model.Caip;
import com.xjt.model.Page;

import java.sql.SQLException;

public interface IBillService {
    public long count();
    public Page<Bill> findAllBillByPager(int page, int size);
    public long count1();
    public Page<Bill> spfindAllBillByPager(int page, int size);
    public int editbill(Bill bill);
    public int billsp(int id);
    public int billno(int id);
    public int insertBill(Bill bill)throws SQLException;
}
