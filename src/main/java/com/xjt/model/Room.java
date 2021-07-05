package com.xjt.model;

public class Room {
    private  int id;
    private String roomname;
    private String roomadd;
    private int  userd;
    private int userid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomname() {
        return roomname;
    }

    public void setRoomname(String roomname) {
        this.roomname = roomname;
    }

    public String getRoomadd() {
        return roomadd;
    }

    public void setRoomadd(String roomadd) {
        this.roomadd = roomadd;
    }

    public int getUserd() {
        return userd;
    }

    public void setUserd(int userd) {
        this.userd = userd;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", roomname='" + roomname + '\'' +
                ", roomadd='" + roomadd + '\'' +
                ", userd=" + userd +
                ", userid=" + userid +
                '}';
    }
}
