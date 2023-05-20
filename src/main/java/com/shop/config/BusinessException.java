package com.shop.config;

public class BusinessException extends RuntimeException {
    private static final long serialVersionUID = 1;

    public BusinessException(String msg) {
        super(msg);
    }

    public BusinessException() {
    }
}
