package com.xjt.dao;

import com.xjt.model.Abnormal;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IAbnormalDao {
    int insertab(Abnormal abnormal) throws SQLException;
    List<Abnormal> findabByPager(Map<String, Object> params);
    long count();
    int abnormalsp(int id);
    int abnormalno(int id);
    List<Abnormal> findab();
    long count1();

}
