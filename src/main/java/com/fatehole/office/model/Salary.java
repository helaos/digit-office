package com.fatehole.office.model;

import java.util.Date;

public class Salary {
    private Integer id;

    private String name;

    private Integer basicSalary;

    private Integer bonus;

    private Integer lunchSalary;

    private Integer trafficSalary;

    private Integer allSalary;

    private Integer pensionBase;

    private Float pensionRatio;

    private Date createDate;

    private Integer medicalBase;

    private Float medicalRatio;

    private Integer providentFundBase;

    private Float providentFundRatio;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(Integer basicSalary) {
        this.basicSalary = basicSalary;
    }

    public Integer getBonus() {
        return bonus;
    }

    public void setBonus(Integer bonus) {
        this.bonus = bonus;
    }

    public Integer getLunchSalary() {
        return lunchSalary;
    }

    public void setLunchSalary(Integer lunchSalary) {
        this.lunchSalary = lunchSalary;
    }

    public Integer getTrafficSalary() {
        return trafficSalary;
    }

    public void setTrafficSalary(Integer trafficSalary) {
        this.trafficSalary = trafficSalary;
    }

    public Integer getAllSalary() {
        return allSalary;
    }

    public void setAllSalary(Integer allSalary) {
        this.allSalary = allSalary;
    }

    public Integer getPensionBase() {
        return pensionBase;
    }

    public void setPensionBase(Integer pensionBase) {
        this.pensionBase = pensionBase;
    }

    public Float getPensionRatio() {
        return pensionRatio;
    }

    public void setPensionRatio(Float pensionRatio) {
        this.pensionRatio = pensionRatio;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getMedicalBase() {
        return medicalBase;
    }

    public void setMedicalBase(Integer medicalBase) {
        this.medicalBase = medicalBase;
    }

    public Float getMedicalRatio() {
        return medicalRatio;
    }

    public void setMedicalRatio(Float medicalRatio) {
        this.medicalRatio = medicalRatio;
    }

    public Integer getProvidentFundBase() {
        return providentFundBase;
    }

    public void setProvidentFundBase(Integer providentFundBase) {
        this.providentFundBase = providentFundBase;
    }

    public Float getProvidentFundRatio() {
        return providentFundRatio;
    }

    public void setProvidentFundRatio(Float providentFundRatio) {
        this.providentFundRatio = providentFundRatio;
    }
}