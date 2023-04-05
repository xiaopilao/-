package com.example.myproject.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.myproject.entity.Role;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 */
public interface IRoleService extends IService<Role> {

    void setRoleMenu(Integer roleId, List<Integer> menuIds);

    List<Integer> getRoleMenu(Integer roleId);
}
