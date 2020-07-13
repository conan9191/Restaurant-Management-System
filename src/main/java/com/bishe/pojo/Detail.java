package com.bishe.pojo;

import java.util.Date;




public class Detail {
    private Integer id;

    private Integer operation;

    private Float money;

    private Integer uid;

    private Integer seatOrderId;

    private Integer itemOrderId;

    private Date time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOperation() {
        return operation;
    }

    public void setOperation(Integer operation) {
        this.operation = operation;
    }

    public Float getMoney() {
        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getSeatOrderId() {
        return seatOrderId;
    }

    public void setSeatOrderId(Integer seatOrderId) {
        this.seatOrderId = seatOrderId;
    }

    public Integer getItemOrderId() {
        return itemOrderId;
    }

    public void setItemOrderId(Integer itemOrderId) {
        this.itemOrderId = itemOrderId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

}