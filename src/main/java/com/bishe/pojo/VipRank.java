package com.bishe.pojo;

public class VipRank {
    private Integer id;

    private String name;

    private Float discount;

    private Integer rate;

    private Integer equal;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Float getDiscount() {
        return discount;
    }

    public void setDiscount(Float discount) {
        this.discount = discount;
    }

    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }

    public Integer getEqual() {
        return equal;
    }

    public void setEqual(Integer equal) {
        this.equal = equal;
    }
}