package com.pp.oa.entity;

public class UserMenu {
    private Long uid;

    private Long mid;

    public UserMenu(Long uid, Long mid) {
        this.uid = uid;
        this.mid = mid;
    }

    public UserMenu() {
    }

    @Override
    public String toString() {
        return "UserMenu{" +
                "uid=" + uid +
                ", mid=" + mid +
                '}';
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }
}