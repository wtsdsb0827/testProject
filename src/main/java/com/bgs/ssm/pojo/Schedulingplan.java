package com.bgs.ssm.pojo;

import org.springframework.format.annotation.DateTimeFormat;

//排产计划表
public class Schedulingplan {
    private Integer id;
    private String planEmpno;
    private Integer batchId;
    private Integer dingdanId;



    private Integer deptId;
    private Integer userId;


    private String orderEmpno;
    private String customerName;
    @DateTimeFormat(style = "yyyy-MM-dd")
    private String sendRiqi;
    private String orderStatus;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPlanEmpno() {
        return planEmpno;
    }

    public void setPlanEmpno(String planEmpno) {
        this.planEmpno = planEmpno;
    }

    public Integer getBatchId() {
        return batchId;
    }

    public void setBatchId(Integer batchId) {
        this.batchId = batchId;
    }

    public Integer getDingdanId() {
        return dingdanId;
    }

    public void setDingdanId(Integer dingdanId) {
        this.dingdanId = dingdanId;
    }


    public String getOrderEmpno() {
        return orderEmpno;
    }

    public void setOrderEmpno(String orderEmpno) {
        this.orderEmpno = orderEmpno;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getSendRiqi() {
        return sendRiqi;
    }

    public void setSendRiqi(String sendRiqi) {
        this.sendRiqi = sendRiqi;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Schedulingplan{" +
                "id=" + id +
                ", planEmpno='" + planEmpno + '\'' +
                ", batchId=" + batchId +
                ", dingdanId=" + dingdanId +
                ", deptId=" + deptId +
                ", userId=" + userId +
                ", orderEmpno='" + orderEmpno + '\'' +
                ", customerName='" + customerName + '\'' +
                ", sendRiqi='" + sendRiqi + '\'' +
                ", orderStatus='" + orderStatus + '\'' +
                '}';
    }
}
