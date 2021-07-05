package com.xjt.service.impl;

import com.xjt.dao.IAbnormalDao;
import com.xjt.model.Abnormal;
import com.xjt.model.Caip;
import com.xjt.model.Page;
import com.xjt.service.IAbnormalService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("abnormalService")
public class IAbnormalServicrImpl implements IAbnormalService {
    @Resource
    private IAbnormalDao abnormalDao;

    @Override
    public int insertab(Abnormal abnormal) throws SQLException {
        return abnormalDao.insertab(abnormal);
    }

    @Override
    public Page<Abnormal> findabByPager(int page, int size) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", (page-1)*size);
        params.put("size", size);
        Page<Abnormal> pager = new Page<Abnormal>();
        List<Abnormal> list = abnormalDao.findabByPager(params);
        pager.setRows(list);
        pager.setTotal(abnormalDao.count());
        return pager;
    }

    @Override
    public long count() {
        return abnormalDao.count();
    }

    @Override
    public int abnormalsp(int id) {
        return abnormalDao.abnormalsp(id);
    }

    @Override
    public int abnormalno(int id) {
        return abnormalDao.abnormalno(id);
    }

    @Override
    public List<Abnormal> findab() {
        return abnormalDao.findab();
    }

    @Override
    public long count1() {
        return abnormalDao.count1();
    }
}
