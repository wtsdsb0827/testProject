package com.bgs.ssm.pojo;

import org.springframework.format.annotation.DateTimeFormat;

public class Followup {
   private Integer id;
    @DateTimeFormat(style = "yyyy-MM-dd")
   private String followStarttime;
    @DateTimeFormat(style = "yyyy-MM-dd")
   private String followEndtime;
   private String followWorkshop;
    private Integer followupId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFollowStarttime() {
        return followStarttime;
    }

    public void setFollowStarttime(String followStarttime) {
        this.followStarttime = followStarttime;
    }

    public String getFollowEndtime() {
        return followEndtime;
    }

    public void setFollowEndtime(String followEndtime) {
        this.followEndtime = followEndtime;
    }

    public String getFollowWorkshop() {
        return followWorkshop;
    }

    public void setFollowWorkshop(String followWorkshop) {
        this.followWorkshop = followWorkshop;
    }

    public Integer getFollowupId() {
        return followupId;
    }

    public void setFollowupId(Integer followupId) {
        this.followupId = followupId;
    }

    @Override
    public String toString() {
        return "Followup{" +
                "id=" + id +
                ", followStarttime='" + followStarttime + '\'' +
                ", followEndtime='" + followEndtime + '\'' +
                ", followWorkshop='" + followWorkshop + '\'' +
                ", followupId=" + followupId +
                '}';
    }
}
