package com.xjt.dao;


import com.xjt.model.Room;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IRoomDao {
    List<Room> findroomByPager(Map<String, Object> params);
    long count();
    int insertRoom(Room room) throws SQLException;
    int editroom(Room room);
    int deletroom(int id);
    int updateuser(Room room);
    int updateused(int userid);
    List<Room> findNoneRoom();

}
