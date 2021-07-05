package com.xjt.service;

import com.xjt.model.Abnormal;
import com.xjt.model.Page;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IAbnormalService {
    public int insertab(Abnormal abnormal) throws SQLException;
    public Page<Abnormal> findabByPager(int page, int size);
    public long count();
    public  int abnormalsp(int id);
    public  int abnormalno(int id);
    List<Abnormal> findab();
    long count1();
}
