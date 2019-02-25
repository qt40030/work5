package com.qt.work.util;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.qt.work.*.controller,com.qt.work.*.service"})
@MapperScan(value="com.qt.work.*.mapper")
public class Work5Application {
	
	public static void main(String[] args) {
		SpringApplication.run(Work5Application.class, args);
	}
}