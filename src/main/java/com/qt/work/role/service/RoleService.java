package com.qt.work.role.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qt.work.role.mapper.RoleMapper;

@Service
public class RoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	

}
