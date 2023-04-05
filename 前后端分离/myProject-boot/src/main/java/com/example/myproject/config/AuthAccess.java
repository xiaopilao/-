package com.example.myproject.config;

import java.lang.annotation.*;

@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
//自定义注解，当接口看到该注解拦截器放行
public @interface AuthAccess {

}
