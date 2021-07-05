package com.xjt.model;

import java.util.List;

/**
 * Author: 童书悦
 * Date: 2021-04-05 15:21
 * Content:原创设计，请勿盗用。
 */
public class Page<T> {

    private int page;//分页起始页
    private int size;//每页记录数
    private List<T> rows;//返回的记录集合
    private long total;//总记录条数
    private String username;

    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        this.page = page;
    }
    public int getSize() {
        return size;
    }
    public void setSize(int size) {
        this.size = size;
    }
    public List<T> getRows() {
        return rows;
    }
    public void setRows(List<T> rows) {
        this.rows = rows;
    }
    public long getTotal() {
        return total;
    }
    public void setTotal(long total) {
        this.total = total;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
}
