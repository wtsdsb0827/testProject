package com.bgs.ssm.pojo;

import java.util.ArrayList;
import java.util.List;

public class Dept {
    private Integer id;
    private String deptName;
    private String contact;
    private String contactphone;
    private String introduce;
    private Integer pid;
    private String paixu;
    private List<Dept> childList = new ArrayList<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getContactphone() {
        return contactphone;
    }

    public void setContactphone(String contactphone) {
        this.contactphone = contactphone;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPaixu() {
        return paixu;
    }

    public void setPaixu(String paixu) {
        this.paixu = paixu;
    }

    public List<Dept> getChildList() {
        return childList;
    }

    public void setChildList(List<Dept> childList) {
        this.childList = childList;
    }

    @Override
    public String toString() {
        return "Dept{" +
                "id=" + id +
                ", deptName='" + deptName + '\'' +
                ", contact='" + contact + '\'' +
                ", contactphone='" + contactphone + '\'' +
                ", introduce='" + introduce + '\'' +
                ", pid=" + pid +
                ", paixu='" + paixu + '\'' +
                ", childList=" + childList +
                '}';
    }
}
