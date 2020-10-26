package com.bgs.ssm.pojo;

import java.util.ArrayList;
import java.util.List;

/*
    关系表
 */
public class Relation {
    private Integer id;
    private Integer roleId;
    private Integer menuId;
    private String url;


    private Integer pId;
    private String menuName;

    private String quanxian;    //权限的设定

    private List<Relation> ChildList = new ArrayList<>();





    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public List<Relation> getChildList() {
        return ChildList;
    }

    public void setChildList(List<Relation> childList) {
        ChildList = childList;
    }

    public String getQuanxian() {
        return quanxian;
    }

    public void setQuanxian(String quanxian) {
        this.quanxian = quanxian;
    }



    @Override
    public String toString() {
        return "Relation{" +
                "id=" + id +
                ", roleId=" + roleId +
                ", menuId=" + menuId +
                ", url='" + url + '\'' +
                ", pId=" + pId +
                ", menuName='" + menuName + '\'' +
                ", quanxian='" + quanxian + '\'' +
                ", ChildList=" + ChildList +
                '}';
    }
}
