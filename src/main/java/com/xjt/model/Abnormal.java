package com.xjt.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;
import java.sql.Timestamp;

public class Abnormal {
    private int id;
    private String username;
    private Timestamp time;
    private String symptom0;
    private String symptom1;
    private String symptom2;
    private String symptom3;
    private String symptom4;
    private String symptom5;
    private String reporter;
    private Date reportertime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSymptom0() {
        return symptom0;
    }

    public void setSymptom0(String symptom0) {
        this.symptom0 = symptom0;
    }

    public String getSymptom1() {
        return symptom1;
    }

    public void setSymptom1(String symptom1) {
        this.symptom1 = symptom1;
    }

    public String getSymptom2() {
        return symptom2;
    }

    public void setSymptom2(String symptom2) {
        this.symptom2 = symptom2;
    }

    public String getSymptom3() {
        return symptom3;
    }

    public void setSymptom3(String symptom3) {
        this.symptom3 = symptom3;
    }

    public String getSymptom4() {
        return symptom4;
    }

    public void setSymptom4(String symptom4) {
        this.symptom4 = symptom4;
    }

    public String getSymptom5() {
        return symptom5;
    }

    public void setSymptom5(String symptom5) {
        this.symptom5 = symptom5;
    }

    public String getReporter() {
        return reporter;
    }

    public void setReporter(String reporter) {
        this.reporter = reporter;
    }

    public Date getReportertime() {
        return reportertime;
    }

    public void setReportertime(Date reportertime) {
        this.reportertime = reportertime;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Abnormal{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", time=" + time +
                ", symptom0='" + symptom0 + '\'' +
                ", symptom1='" + symptom1 + '\'' +
                ", symptom2='" + symptom2 + '\'' +
                ", symptom3='" + symptom3 + '\'' +
                ", symptom4='" + symptom4 + '\'' +
                ", symptom5='" + symptom5 + '\'' +
                ", reporter='" + reporter + '\'' +
                ", reportertime=" + reportertime +
                '}';
    }
}
