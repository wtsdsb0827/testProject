package com.bgs.ssm.pojo;
/*
    小说的实体类
 */
public class XiaoShuo {

    private String name;
    private String kind;
    private String author;
    private Integer wordnumber;
    private String recommend;
    private String totalclick;
    private String weeklyRecommendation;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Integer getWordnumber() {
        return wordnumber;
    }

    public void setWordnumber(Integer wordnumber) {
        this.wordnumber = wordnumber;
    }

    public String getRecommend() {
        return recommend;
    }

    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }

    public String getTotalclick() {
        return totalclick;
    }

    public void setTotalclick(String totalclick) {
        this.totalclick = totalclick;
    }

    public String getWeeklyRecommendation() {
        return weeklyRecommendation;
    }

    public void setWeeklyRecommendation(String weeklyRecommendation) {
        this.weeklyRecommendation = weeklyRecommendation;
    }

    @Override
    public String toString() {
        return "XiaoShuo{" +
                "name='" + name + '\'' +
                ", kind='" + kind + '\'' +
                ", author='" + author + '\'' +
                ", wordnumber=" + wordnumber +
                ", recommend='" + recommend + '\'' +
                ", totalclick='" + totalclick + '\'' +
                ", weeklyRecommendation='" + weeklyRecommendation + '\'' +
                '}';
    }
}
