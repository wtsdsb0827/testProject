package com.bgs.ssm.pojo;

import org.springframework.format.annotation.DateTimeFormat;

public class DingDanInfo {

    private Integer  id;
    @DateTimeFormat(style = "yyyy-MM-dd")
    private String  infoTime;
    private Integer  infoNumber;
    private Integer  productId;


    private String bianma;
    private String  productName;
    private String  productSize;
    private String  testunit;

    private Integer infoAllrenumber;
    private Integer infoWillrenumber;
    private Integer  kucun;
    private Integer  erpkucun;

    private Integer  dingdaninfoId;


    public Integer getDingdaninfoId() {
        return dingdaninfoId;
    }

    public void setDingdaninfoId(Integer dingdaninfoId) {
        this.dingdaninfoId = dingdaninfoId;
    }

    public String getBianma() {
        return bianma;
    }

    public void setBianma(String bianma) {
        this.bianma = bianma;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getInfoTime() {
        return infoTime;
    }

    public void setInfoTime(String infoTime) {
        this.infoTime = infoTime;
    }

    public Integer getInfoNumber() {
        return infoNumber;
    }

    public void setInfoNumber(Integer infoNumber) {
        this.infoNumber = infoNumber;
    }



    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }


    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductSize() {
        return productSize;
    }

    public void setProductSize(String productSize) {
        this.productSize = productSize;
    }

    public String getTestunit() {
        return testunit;
    }

    public void setTestunit(String testunit) {
        this.testunit = testunit;
    }

    public Integer getKucun() {
        return kucun;
    }

    public void setKucun(Integer kucun) {
        this.kucun = kucun;
    }

    public Integer getErpkucun() {
        return erpkucun;
    }

    public void setErpkucun(Integer erpkucun) {
        this.erpkucun = erpkucun;
    }


    public Integer getInfoAllrenumber() {
        return infoAllrenumber;
    }

    public void setInfoAllrenumber(Integer infoAllrenumber) {
        this.infoAllrenumber = infoAllrenumber;
    }

    public Integer getInfoWillrenumber() {
        return infoWillrenumber;
    }

    public void setInfoWillrenumber(Integer infoWillrenumber) {
        this.infoWillrenumber = infoWillrenumber;
    }


    @Override
    public String toString() {
        return "DingDanInfo{" +
                "id=" + id +
                ", infoTime='" + infoTime + '\'' +
                ", infoNumber=" + infoNumber +
                ", productId=" + productId +
                ", bianma='" + bianma + '\'' +
                ", productName='" + productName + '\'' +
                ", productSize='" + productSize + '\'' +
                ", testunit='" + testunit + '\'' +
                ", infoAllrenumber=" + infoAllrenumber +
                ", infoWillrenumber=" + infoWillrenumber +
                ", kucun=" + kucun +
                ", erpkucun=" + erpkucun +
                ", dingdaninfoId=" + dingdaninfoId +
                '}';
    }
}
