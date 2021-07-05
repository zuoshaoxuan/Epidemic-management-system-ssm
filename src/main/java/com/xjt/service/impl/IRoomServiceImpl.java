package com.xjt.service.impl;

import com.xjt.dao.IRoomDao;
import com.xjt.model.Page;
import com.xjt.model.Room;
import com.xjt.service.IRoomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("roomService")
public class IRoomServiceImpl implements IRoomService {
    @Resource
    private IRoomDao roomDao;

    @Override
    public Page<Room> findroomByPager(int page, int size) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", (page-1)*size);
        params.put("size", size);
        Page<Room> pager = new Page<Room>();
        List<Room> list= roomDao.findroomByPager(params);
        pager.setRows(list);
        pager.setTotal(roomDao.count());
        return pager;
    }

    @Override
    public long count() {
        return roomDao.count();
    }

    @Override
    public int insertRoom(Room room) throws SQLException {
        return roomDao.insertRoom(room);
    }

    @Override
    public int editroom(Room room) {
        return roomDao.editroom(room);
    }

    @Override
    public int deletroom(int id) {
        return roomDao.deletroom(id);
    }

    @Override
    public int updateuser(Room room) {
        return roomDao.updateuser(room);
    }
    public int updateuserd(int userid) {
        return roomDao.updateused(userid);
    }

    @Override
    public List<Room> findNoneRoom() {
        return roomDao.findNoneRoom();
    }
}
