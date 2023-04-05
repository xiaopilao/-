package com.example.myproject.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.myproject.entity.Comment;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 */
public interface ICommentService extends IService<Comment> {

    List<Comment> findCommentDetail(Integer articleId);
}
