package com.bgs.ssm.pojo;
/*
    批次表
 */
public class Batch {


    private Integer id;
    private String batchEmpno;
    private String batchName;

    private String planEmpno;

    private Integer batchId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBatchEmpno() {
        return batchEmpno;
    }

    public void setBatchEmpno(String batchEmpno) {
        this.batchEmpno = batchEmpno;
    }

    public String getBatchName() {
        return batchName;
    }

    public void setBatchName(String batchName) {
        this.batchName = batchName;
    }

    public Integer getBatchId() {
        return batchId;
    }

    public void setBatchId(Integer batchId) {
        this.batchId = batchId;
    }


    public String getPlanEmpno() {
        return planEmpno;
    }

    public void setPlanEmpno(String planEmpno) {
        this.planEmpno = planEmpno;
    }

    @Override
    public String toString() {
        return "Batch{" +
                "id=" + id +
                ", batchEmpno='" + batchEmpno + '\'' +
                ", batchName='" + batchName + '\'' +
                ", planEmpno='" + planEmpno + '\'' +
                ", batchId=" + batchId +
                '}';
    }

    public Batch() {
    }

    private Batch(int id) {
        this.id = id;
    }

    private Batch(int batchId,String batchEmpno) {
        this.batchId = batchId;
        this.batchEmpno = batchEmpno;
    }
}
