package com.example.myproject.controller.dto;

import com.example.myproject.entity.Menu;
import lombok.Data;

import java.util.List;

/**
 * 接受前端登录请求的参数
 */
@Data
public class UserDTO {
    private Integer id;
    private String username;
    private String password;
    private String token;
    private String role;
    private List<Menu> menus;
}
