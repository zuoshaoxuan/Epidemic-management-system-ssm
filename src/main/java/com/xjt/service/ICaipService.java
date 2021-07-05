package com.xjt.service;

import com.xjt.model.Caip;
import com.xjt.model.Caiporder;
import com.xjt.model.Page;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICaipService {
    public Page<Caip> findcaipByPager(int page, int size);
    public long count();
    public Page<Caip> findAllCaipByPager(int page, int size);
    public long count1();
    public int insertCaip(Caip caip) throws SQLException;
    public int editcaip(Caip caip);
    public int deletcaip(int id);
    public Page<Caip> FuzzyQueryBycpname(int page, int size,String cpname);
    public int count2(String cpname);
    public int orderCaip(Caiporder caiporder);
    public Page<Caiporder> findAllorderByPager(int page ,int size,long uid);
    public int count3(long uid);
    public Page<Caiporder> findAllByPager(int page ,int size);
    int count4();
    public int sended(int id);
    public Page<Caip> findAllGoodsByPager(int page, int size);
    int count5();
}
