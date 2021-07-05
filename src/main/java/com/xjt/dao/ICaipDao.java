package com.xjt.dao;


import com.xjt.model.Caip;
import com.xjt.model.Caiporder;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICaipDao {
    List<Caip> findcaipByPager(Map<String, Object> params);
    long count();
    List<Caip> findAllCaipByPager(Map<String, Object> params);
    long count1();
    int insertCaip(Caip caip) throws SQLException;
    int editcaip(Caip caip);
    int deletcaip(int id);
    List<Caip> FuzzyQueryBycpname(Map<String, Object> params);
    int count2(String cpname);
    int orderCaip(Caiporder caiporder);
    List<Caiporder> findAllorderByPager(Map<String, Object> params);
    int count3(long uid);
    List<Caiporder> findAllByPager(Map<String, Object> params);
    int count4();
    int sended(int id);
    List<Caip> findAllGoodsByPager(Map<String, Object> params);
    int count5();
}