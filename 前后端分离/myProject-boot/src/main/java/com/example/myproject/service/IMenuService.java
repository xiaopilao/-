package com.example.myproject.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.myproject.entity.Menu;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 */
public interface IMenuService extends IService<Menu> {

    List<Menu> findMenus(String name);
}
