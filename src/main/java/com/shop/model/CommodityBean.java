package com.shop.model;

public class CommodityBean {
    private Integer parentId;
    private String kind;
    private String category;
    private String price;
    private String clear;

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getKind() {
        return kind;
    }

    public Integer newGetKind() {

        if (kind == null) {
            return null;
        } else if (kind.equals("饮料")) {
            return 2;
        } else if (kind.equals("零食")) {
            return 3;
        } else if (kind.equals("甜食")) {
            return 4;
        } else if (kind.equals("坚果")) {
            return 1;
        }
        return null;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getClear() {
        return clear;
    }

    public void setClear(String clear) {
        this.clear = clear;
    }
}
