package com.xjt.service;

import com.xjt.model.Page;
import com.xjt.model.Room;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IRoomService {
    public Page<Room> findroomByPager(int page, int size);
    public long count();
    public int insertRoom(Room room) throws SQLException;
    public int editroom(Room room);
    public int deletroom(int id);
    public int updateuser(Room room);
    public int updateuserd(int userid);
    public List<Room> findNoneRoom();
}
