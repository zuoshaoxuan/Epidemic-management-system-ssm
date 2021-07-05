package com.xjt.service.impl;

import com.xjt.dao.IBillDao;
import com.xjt.model.Bill;
import com.xjt.model.Caip;
import com.xjt.model.Page;
import com.xjt.service.IBillService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service("billService")
public class IBillServiceImpl implements IBillService {
    @Resource
    private IBillDao billDao;

    @Override
    public long count() {
        return billDao.count();
    }

    @Override
    public Page<Bill> findAllBillByPager(int page, int size) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", (page-1)*size);
        params.put("size", size);
        Page<Bill> pager = new Page<Bill>();
        List<Bill> list = billDao.findAllBillByPager(params);
        pager.setRows(list);
        pager.setTotal(billDao.count());
        return pager;
    }

    @Override
    public long count1() {
        return billDao.count1();
    }

    @Override
    public Page<Bill> spfindAllBillByPager(int page, int size) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", (page-1)*size);
        params.put("size", size);
        Page<Bill> pager = new Page<Bill>();
        List<Bill> list = billDao.spfindAllBillByPager(params);
        pager.setRows(list);
        pager.setTotal(billDao.count1());
        return pager;
    }

    @Override
    public int editbill(Bill bill) {
        return billDao.editbill(bill);
    }

    @Override
    public int billsp(int id) {
        return billDao.billsp(id);
    }

    @Override
    public int billno(int id) {
        return billDao.billno(id);
    }

    @Override
    public int insertBill(Bill bill) throws SQLException {
        return billDao.insertBill(bill);
    }
}
