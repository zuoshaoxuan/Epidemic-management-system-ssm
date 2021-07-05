package com.xjt.model;

public class Caip {
    private long id;
    private String cpname;
    private String cpdescribe;
    private int caipy;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public String getCpdescribe() {
        return cpdescribe;
    }

    public void setCpdescribe(String cpdescribe) {
        this.cpdescribe = cpdescribe;
    }

    public int getCaipy() {
        return caipy;
    }

    public void setCaipy(int caipy) {
        this.caipy = caipy;
    }

    @Override
    public String toString() {
        return "caip{" +
                "id=" + id +
                ", cpname='" + cpname + '\'' +
                ", cpdescribe='" + cpdescribe + '\'' +
                ", caipy=" + caipy +
                '}';
    }
}
