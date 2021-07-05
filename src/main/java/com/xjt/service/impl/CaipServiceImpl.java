package com.xjt.service.impl;

import com.xjt.dao.ICaipDao;
import com.xjt.model.Caip;
import com.xjt.model.Caiporder;
import com.xjt.model.Page;
import com.xjt.service.ICaipService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("caipService")
public class CaipServiceImpl implements ICaipService {
    @Resource
    private ICaipDao caipDao;
    @Override
    public Page<Caip> findcaipByPager(int page, int size) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", (page-1)*size);
        params.put("size", size);
        Page<Caip> pager = new Page<Caip>();
        List<Caip> list = caipDao.findcaipByPager(params);
        pager.setRows(list);
        pager.setTotal(caipDao.count());
        return pager;
    }
    @Override
    public long count() {
        return caipDao.count();
    }

    @Override
    public Page<Caip> findAllCaipByPager(int page, int size) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", (page-1)*size);
        params.put("size", size);
        Page<Caip> pager = new Page<Caip>();
        List<Caip> list = caipDao.findAllCaipByPager(params);
        pager.setRows(list);
        pager.setTotal(caipDao.count1());
        return pager;
    }
    @Override
    public long count1() {
        return caipDao.count1();
    }

    @Override
    public int insertCaip(Caip caip) throws SQLException {
        return caipDao.insertCaip(caip);
    }

    @Override
    public int editcaip(Caip caip) {
        return caipDao.editcaip(caip);
    }

    @Override
    public int deletcaip(int id) {
        return caipDao.deletcaip(id);
    }

    @Override
    public Page<Caip> FuzzyQueryBycpname(int page, int size, String cpname) {
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("page", (page-1)*size);
        param.put("size", size);
        param.put("cpname",cpname);
        Page<Caip> pager = new Page<Caip>();
        List<Caip> list = caipDao.FuzzyQueryBycpname(param);
        pager.setRows(list);
        pager.setTotal(caipDao.count2(cpname));
        return pager;
    }

    @Override
    public int count2(String cpname) {
        return caipDao.count2(cpname);
    }

    @Override
    public int orderCaip(Caiporder caiporder) {
        return caipDao.orderCaip(caiporder);
    }

    @Override
    public Page<Caiporder> findAllorderByPager(int page, int size,long uid) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", (page-1)*size);
        params.put("size", size);
        params.put("uid",uid);
        Page<Caiporder> pager = new Page<Caiporder>();
        List<Caiporder> list = caipDao.findAllorderByPager(params);
        pager.setRows(list);
        pager.setTotal(caipDao.count3(uid));
        return pager;
    }

    @Override
    public int count3(long uid) {
        return caipDao.count3(uid);
    }

    @Override
    public Page<Caiporder> findAllByPager(int page, int size) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", (page-1)*size);
        params.put("size", size);
        Page<Caiporder> pager = new Page<Caiporder>();
        List<Caiporder> list = caipDao.findAllByPager(params);
        pager.setRows(list);
        pager.setTotal(caipDao.count4());
        return pager;
    }

    @Override
    public int count4() {
        return caipDao.count4();
    }

    @Override
    public int sended(int id) {
        return caipDao.sended(id);
    }

    @Override
    public Page<Caip> findAllGoodsByPager(int page, int size) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", (page-1)*size);
        params.put("size", size);
        Page<Caip> pager = new Page<Caip>();
        List<Caip> list = caipDao.findAllGoodsByPager(params);
        pager.setRows(list);
        pager.setTotal(caipDao.count5());
        return pager;
    }

    @Override
    public int count5() {
        return caipDao.count5();
    }


}
