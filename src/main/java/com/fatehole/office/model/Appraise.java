package com.fatehole.office.model;

import java.util.Date;

public class Appraise {
    private Integer id;

    private Integer eid;

    private Date appraiseDate;

    private String appraiseResult;

    private String appraiseContent;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    public Date getAppraiseDate() {
        return appraiseDate;
    }

    public void setAppraiseDate(Date appraiseDate) {
        this.appraiseDate = appraiseDate;
    }

    public String getAppraiseResult() {
        return appraiseResult;
    }

    public void setAppraiseResult(String appraiseResult) {
        this.appraiseResult = appraiseResult == null ? null : appraiseResult.trim();
    }

    public String getAppraiseContent() {
        return appraiseContent;
    }

    public void setAppraiseContent(String appraiseContent) {
        this.appraiseContent = appraiseContent == null ? null : appraiseContent.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}