package com.bgs.ssm.pojo;

public class Product {
    private Integer  id;
    private String bianma;
    private String  productStatus;
    private String  productName;
    private String  productSize;
    private String  oilproductName;
    private String  oilproductSize;
    private String  testunit;
    private String  testway;
    private Integer  kucun;
    private Integer  erpkucun;
    private Integer  dingdanId;
    private Integer  productId;

   private String  infoTime;
    private Integer  infoNumber;
    private Integer infoAllrenumber;
    private Integer infoWillrenumber;

    private Integer productionNum;

    public Integer getProductionNum() {
        return productionNum;
    }

    public void setProductionNum(Integer productionNum) {
        this.productionNum = productionNum;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getDingdanId() {
        return dingdanId;
    }

    public void setDingdanId(Integer dingdanId) {
        this.dingdanId = dingdanId;
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
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

    public String getOilproductName() {
        return oilproductName;
    }

    public void setOilproductName(String oilproductName) {
        this.oilproductName = oilproductName;
    }

    public String getOilproductSize() {
        return oilproductSize;
    }

    public void setOilproductSize(String oilproductSize) {
        this.oilproductSize = oilproductSize;
    }

    public String getTestunit() {
        return testunit;
    }

    public void setTestunit(String testunit) {
        this.testunit = testunit;
    }

    public String getTestway() {
        return testway;
    }

    public void setTestway(String testway) {
        this.testway = testway;
    }

    public String getBianma() {
        return bianma;
    }

    public void setBianma(String bianma) {
        this.bianma = bianma;
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
        return "Product{" +
                "id=" + id +
                ", bianma='" + bianma + '\'' +
                ", productStatus='" + productStatus + '\'' +
                ", productName='" + productName + '\'' +
                ", productSize='" + productSize + '\'' +
                ", oilproductName='" + oilproductName + '\'' +
                ", oilproductSize='" + oilproductSize + '\'' +
                ", testunit='" + testunit + '\'' +
                ", testway='" + testway + '\'' +
                ", kucun=" + kucun +
                ", erpkucun=" + erpkucun +
                ", dingdanId=" + dingdanId +
                ", productId=" + productId +
                ", infoTime='" + infoTime + '\'' +
                ", infoNumber=" + infoNumber +
                ", infoAllrenumber=" + infoAllrenumber + ", infoWillrenumber=" + infoWillrenumber +
                ", productionNum="+productionNum +
                '}';
    }
}
