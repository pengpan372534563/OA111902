package com.pp.oa.entity;

public class PageBean {
    //当前页
    private Integer pageIndex=1;
    //每页显示条数
    private Integer pageSize=3;
    //总页数
    private Integer pageCount;
    //总条数
    private Integer rowCount;

    //起始数
    private Integer startRow;

    public Integer getStartRow() {
        //(当前页-1)* 每页条数
        return (pageIndex-1)*pageSize;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageCount() {
        return (rowCount%pageSize== 0)  ? (rowCount/pageSize) : (rowCount/pageSize) +1;
    }

    public Integer getRowCount() {
        return this.getRowCount();
    }

    public void setRowCount(Integer rowCount) {
        this.rowCount = rowCount;
    }
}
