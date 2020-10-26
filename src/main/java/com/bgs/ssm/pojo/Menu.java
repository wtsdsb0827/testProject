package com.bgs.ssm.pojo;
/*
    菜单表
 */
public class Menu {
    private Integer id;
    private String menuName;
    private Integer pid;
    private String url;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }


    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }



    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", menuName='" + menuName + '\'' +
                ", pid=" + pid +
                ", url='" + url + '\'' +
                '}';
    }
}
