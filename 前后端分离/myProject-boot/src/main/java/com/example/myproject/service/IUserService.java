package com.example.myproject.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.myproject.controller.dto.UserDTO;
import com.example.myproject.controller.dto.UserPasswordDTO;
import com.example.myproject.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;


/**
 * <p>
 *  服务类
 * </p>
 */
public interface IUserService extends IService<User> {

    UserDTO login(UserDTO userDTO);

    User register(UserDTO userDTO);

    void updatePassword(UserPasswordDTO userPasswordDTO);

    Page<User> findPage(Page<User> objectPage, String username, String email, String address);

}
