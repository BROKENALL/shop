package com.shop.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
public class Vip {
    private String id;
    private String name;
    private String password;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthday;

    private String photo;

    private String sex;

    private String email;

    private String phone;

    private String nickName;

}
