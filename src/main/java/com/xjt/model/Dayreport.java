package com.xjt.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Dayreport {
    private int id;
    private int uid;
    private int temp;
    private Timestamp cdate;
    private Date reportetime;
    private String emotion;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getTemp() {
        return temp;
    }

    public void setTemp(int temp) {
        this.temp = temp;
    }

    public Timestamp getCdate() {
        return cdate;
    }

    public void setCdate(Timestamp cdate) {
        this.cdate = cdate;
    }

    public Date getReportetime() {
        return reportetime;
    }

    public void setReportetime(Date reportetime) {
        this.reportetime = reportetime;
    }

    public String getEmotion() {
        return emotion;
    }

    public void setEmotion(String emotion) {
        this.emotion = emotion;
    }

    @Override
    public String toString() {
        return "Dayreport{" +
                "id=" + id +
                ", uid=" + uid +
                ", temp=" + temp +
                ", cdate=" + cdate +
                ", reportetime=" + reportetime +
                ", emotion='" + emotion + '\'' +
                '}';
    }
}
