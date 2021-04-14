package com.fatehole.office.model;

import java.util.Date;

public class StaffRewardPunish {
    private Integer id;

    private Integer eid;

    private Date rewardPunishDate;

    private String rewardPunishReason;

    private Integer rewardPunishPoint;

    private Integer rewardPunishType;

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

    public Date getRewardPunishDate() {
        return rewardPunishDate;
    }

    public void setRewardPunishDate(Date rewardPunishDate) {
        this.rewardPunishDate = rewardPunishDate;
    }

    public String getRewardPunishReason() {
        return rewardPunishReason;
    }

    public void setRewardPunishReason(String rewardPunishReason) {
        this.rewardPunishReason = rewardPunishReason == null ? null : rewardPunishReason.trim();
    }

    public Integer getRewardPunishPoint() {
        return rewardPunishPoint;
    }

    public void setRewardPunishPoint(Integer rewardPunishPoint) {
        this.rewardPunishPoint = rewardPunishPoint;
    }

    public Integer getRewardPunishType() {
        return rewardPunishType;
    }

    public void setRewardPunishType(Integer rewardPunishType) {
        this.rewardPunishType = rewardPunishType;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}