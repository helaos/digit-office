package com.fatehole.office.model;

import java.util.Date;

public class OperateLog {
    private Integer id;

    private Date addDate;

    private String operate;

    private Integer hrId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public String getOperate() {
        return operate;
    }

    public void setOperate(String operate) {
        this.operate = operate == null ? null : operate.trim();
    }

    public Integer getHrId() {
        return hrId;
    }

    public void setHrId(Integer hrId) {
        this.hrId = hrId;
    }
}