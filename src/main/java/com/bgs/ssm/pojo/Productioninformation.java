package com.bgs.ssm.pojo;

public class Productioninformation {
    private Integer id;
    private Integer productionNum;
    private Integer dingdaninfoId;
    private Integer productId;
    private String productSize;
    private String testunit;
    private Integer infoNumber;
    private Integer productioninformationId;


    private String bianma;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductionNum() {
        return productionNum;
    }

    public void setProductionNum(Integer productionNum) {
        this.productionNum = productionNum;
    }

    public Integer getDingdaninfoId() {
        return dingdaninfoId;
    }

    public void setDingdaninfoId(Integer dingdaninfoId) {
        this.dingdaninfoId = dingdaninfoId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getBianma() {
        return bianma;
    }

    public void setBianma(String bianma) {
        this.bianma = bianma;
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

    public Integer getInfoNumber() {
        return infoNumber;
    }

    public void setInfoNumber(Integer infoNumber) {
        this.infoNumber = infoNumber;
    }

    public Integer getProductioninformationId() {
        return productioninformationId;
    }

    public void setProductioninformationId(Integer productioninformationId) {
        this.productioninformationId = productioninformationId;
    }

    @Override
    public String toString() {
        return "Productioninformation{" +
                "id=" + id +
                ", productionNum=" + productionNum +
                ", dingdaninfoId=" + dingdaninfoId +
                ", productId=" + productId +
                ", productSize='" + productSize + '\'' +
                ", testunit='" + testunit + '\'' +
                ", infoNumber=" + infoNumber +
                ", productioninformationId=" + productioninformationId +
                ", bianma='" + bianma + '\'' +
                '}';
    }
}
