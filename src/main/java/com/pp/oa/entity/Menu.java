package com.pp.oa.entity;

public class Menu {
    private Long mid;

    private Long pid;

    private String name;

    private Boolean isparent;

    private String icon;

    private String url;

    private String target;

    private Boolean checked;

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Boolean getIsparent() {
        return isparent;
    }

    public void setIsparent(Boolean isparent) {
        this.isparent = isparent;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    @Override
    public String toString() {
        return "Menu{" +
                "mid=" + mid +
                ", pid=" + pid +
                ", name='" + name + '\'' +
                ", isparent=" + isparent +
                ", icon='" + icon + '\'' +
                ", url='" + url + '\'' +
                ", target='" + target + '\'' +
                ", checked=" + checked +
                '}';
    }
}