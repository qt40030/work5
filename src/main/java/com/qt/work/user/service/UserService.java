package com.qt.work.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qt.work.menu.mapper.MenuMapper;
import com.qt.work.menu.model.MenuModel;
import com.qt.work.rights.mapper.RightsMapper;
import com.qt.work.rights.model.RightsModel;
import com.qt.work.role.mapper.RoleMapper;
import com.qt.work.role.model.RoleModel;
import com.qt.work.user.mapper.UserMapper;
import com.qt.work.user.model.UserModel;
import com.qt.work.util.FormatEmpty;



@Service
public class UserService {
	@Autowired
	private UserMapper usermapper;
	
	@Autowired
	private MenuMapper menumapper;
	
	@Autowired
	private RoleMapper rolemapper;
	
	@Autowired
	private RightsMapper rightsmapper;

	public String sel(UserModel userModel) {
		List<UserModel>list=usermapper.select(userModel);
		if(!FormatEmpty.isEmpty(list)) {
			return "1";
		}else {
			return "0";
		}
	}

	public List<UserModel>select(UserModel userModel){
		List<UserModel>list=usermapper.select(userModel);
		if(!FormatEmpty.isEmpty(list)) {
			return list;
		}else {
			return null;
		}
	}
	public List<MenuModel>select2(MenuModel menuModel){
		return menumapper.selectList(menuModel);
	}
	
	public String selectUser(UserModel userModel) {
		Map<String, Object>map=new HashMap<String,Object>();
		map.put("user",usermapper.select(userModel));
		map.put("count", usermapper.selectCount(userModel));
		return new JSONObject(map).toString();
	}
   //添加
	public String reg(UserModel userModel) {
		UserModel um=new UserModel();
		um.setUser_code(userModel.getUser_code());
		List<UserModel>list=usermapper.select(um);
		RoleModel rm1=new RoleModel();
		rm1.setRole_code(userModel.getRole_code());
		List<RoleModel>list2=rolemapper.select(rm1);
		if(!FormatEmpty.isEmpty(list)) {
			return "0";
		}else if(!FormatEmpty.isEmpty(list2)){
			return "0";
		}else {
			RoleModel rm=new RoleModel();
			rm.setRole_code(userModel.getRole_code());
			rm.setRole_name(userModel.getRole_name());
			usermapper.insert(userModel);
			rolemapper.insert(rm);
			return "1";
		}
	}
	
	public String update(UserModel userModel,HttpSession session) {
		if(userModel.getUser_code().equals("admin")&&!userModel.getUser_code().equals(session.getAttribute("usercode"))) {
			return "2";
		}else{
			usermapper.updateActive(userModel);
			return "1";	
		}
	}
	
	public String del(UserModel userModel) {
		usermapper.delete(userModel);
		RightsModel rm=new RightsModel();
		rm.setRole_code(userModel.getUser_code());
		rightsmapper.delete(rm);
		return "1";
	}
	

	public String update2(UserModel us,HttpSession session) {
		if(session.getAttribute("code").equals("1175")) {
			us.setUser_code(session.getAttribute("user").toString());
			usermapper.updateActive(us);
			return "1";
		}else {
			return "0";
		}
	}
}
