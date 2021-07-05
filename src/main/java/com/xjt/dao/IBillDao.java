package com.xjt.dao;

import com.xjt.model.Bill;
import com.xjt.model.Caip;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IBillDao {
    List<Bill> findAllBillByPager(Map<String, Object> params);
    long count();
    List<Bill> spfindAllBillByPager(Map<String, Object> params);
    long count1();
    int editbill(Bill bill);
    int billsp(int id);
    int billno(int id);
    int insertBill(Bill bill)throws SQLException;
}
