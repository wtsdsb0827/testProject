package com.bgs.ssm.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.List;

public class DingDan {

    private Integer  id;
    private Integer  ddiid;
    private String  orderEmpno;
    private Integer  customerId;
    private Integer  dingdaninfoId;
    private Integer  deptId;
    private Integer  sellpeopleId;
    private String  orderStatus;
    @DateTimeFormat(style = "yyyy-MM-dd")
    private String orderDate;
    private String orderName;

    private String allName;         //销售员
    private String customerName;    //客户
    private String deptName;        //部门名称



    private Integer userId;

    private Integer productId;
    private String  receiveChuanzhen;
    private String  receiveBeizhu;
    private String  receivePhone;
    private String  sendPeople;
    private String  sendDept;
    @DateTimeFormat(style = "yyyy-MM-dd")
    private String  sendRiqi;
    @DateTimeFormat(style = "yyyy-MM-dd")
    private String  infoTime;
    private String  sendChuanzhen;
    private String  sendPhone;
    private String  beizhu;
    private String  tupian;


    private String  productName;
    private String  productSize;
    private String infoNumber;
    private String  testunit;


    public Integer getDdiid() {
        return ddiid;
    }

    public void setDdiid(Integer ddiid) {
        this.ddiid = ddiid;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getTestunit() {
        return testunit;
    }

    public void setTestunit(String testunit) {
        this.testunit = testunit;
    }

    public String getProductSize() {
        return productSize;
    }

    public void setProductSize(String productSize) {
        this.productSize = productSize;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getInfoTime() {
        return infoTime;
    }

    public void setInfoTime(String infoTime) {
        this.infoTime = infoTime;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getUserId() {
        return userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderEmpno() {
        return orderEmpno;
    }

    public void setOrderEmpno(String orderEmpno) {
        this.orderEmpno = orderEmpno;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getDingdaninfoId() {
        return dingdaninfoId;
    }

    public void setDingdaninfoId(Integer dingdaninfoId) {
        this.dingdaninfoId = dingdaninfoId;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Integer getSellpeopleId() {
        return sellpeopleId;
    }

    public void setSellpeopleId(Integer sellpeopleId) {
        this.sellpeopleId = sellpeopleId;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getAllName() {
        return allName;
    }

    public void setAllName(String allName) {
        this.allName = allName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }


    public String getInfoNumber() {
        return infoNumber;
    }

    public void setInfoNumber(String infoNumber) {
        this.infoNumber = infoNumber;
    }


    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }


    public String getReceiveChuanzhen() {
        return receiveChuanzhen;
    }

    public void setReceiveChuanzhen(String receiveChuanzhen) {
        this.receiveChuanzhen = receiveChuanzhen;
    }

    public String getReceiveBeizhu() {
        return receiveBeizhu;
    }

    public void setReceiveBeizhu(String receiveBeizhu) {
        this.receiveBeizhu = receiveBeizhu;
    }

    public String getReceivePhone() {
        return receivePhone;
    }

    public void setReceivePhone(String receivePhone) {
        this.receivePhone = receivePhone;
    }

    public String getSendPeople() {
        return sendPeople;
    }

    public void setSendPeople(String sendPeople) {
        this.sendPeople = sendPeople;
    }

    public String getSendDept() {
        return sendDept;
    }

    public void setSendDept(String sendDept) {
        this.sendDept = sendDept;
    }

    public String getSendRiqi() {
        return sendRiqi;
    }

    public void setSendRiqi(String sendRiqi) {
        this.sendRiqi = sendRiqi;
    }

    public String getSendChuanzhen() {
        return sendChuanzhen;
    }

    public void setSendChuanzhen(String sendChuanzhen) {
        this.sendChuanzhen = sendChuanzhen;
    }

    public String getSendPhone() {
        return sendPhone;
    }

    public void setSendPhone(String sendPhone) {
        this.sendPhone = sendPhone;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

    public String getTupian() {
        return tupian;
    }

    public void setTupian(String tupian) {
        this.tupian = tupian;
    }

    @Override
    public String toString() {
        return "DingDan{" +
                "id=" + id +
                ", orderEmpno='" + orderEmpno + '\'' +
                ", customerId=" + customerId +
                ", dingdaninfoId=" + dingdaninfoId +
                ", deptId=" + deptId +
                ", sellpeopleId=" + sellpeopleId +
                ", orderStatus='" + orderStatus + '\'' +
                ", orderDate='" + orderDate + '\'' +
                ", orderName='" + orderName + '\'' +
                ", allName='" + allName + '\'' +
                ", customerName='" + customerName + '\'' +
                ", deptName='" + deptName + '\'' +
                ", userId=" + userId +
                ", productId=" + productId +
                ", receiveChuanzhen='" + receiveChuanzhen + '\'' +
                ", receiveBeizhu='" + receiveBeizhu + '\'' +
                ", receivePhone='" + receivePhone + '\'' +
                ", sendPeople='" + sendPeople + '\'' +
                ", sendDept='" + sendDept + '\'' +
                ", sendRiqi='" + sendRiqi + '\'' +
                ", infoTime='" + infoTime + '\'' +
                ", sendChuanzhen='" + sendChuanzhen + '\'' +
                ", sendPhone='" + sendPhone + '\'' +
                ", beizhu='" + beizhu + '\'' +
                ", tupian='" + tupian + '\'' +
                ", productName='" + productName + '\'' +
                ", productSize='" + productSize + '\'' +
                ", infoNumber='" + infoNumber + '\'' +
                ", testunit='" + testunit + '\'' +
                '}';
    }
}
