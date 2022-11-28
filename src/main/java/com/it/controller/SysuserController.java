package com.it.controller;

import java.util.HashMap;
import java.util.List;

import com.it.dao.SysuserDao;
import com.it.entity.Sysuser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class SysuserController {
    @Resource
    SysuserDao sysuserDao;

	//后台登录
	@RequestMapping("admin/welcome")
	public String welcome(Sysuser sysuser,HttpServletRequest request){
			return "login";
	}


	//后台登录
	@RequestMapping("admin/login")
	public String adminLogin(Sysuser sysuser,HttpServletRequest request){
		HashMap map = new HashMap();
		map.put("uname",sysuser.getUname());
		map.put("upass",sysuser.getUpass());
		List<Sysuser> list = sysuserDao.selectAll(map);
		if(list.size()==0){
			request.setAttribute("suc","用户名或密码错误");
			return "login";
		}else{
			request.getSession().setAttribute("admin",list.get(0));

			return "redirect:/admin/index.jsp";
		}
		}

	//后台退出
	@RequestMapping("admin/adminExit")
	public String adminExit(HttpServletRequest request){
		request.getSession().removeAttribute("admin");
		return "login";
	}

	//后台刷新首页
	@RequestMapping("admin/index")
	public String adminIndex(){
		return "index";
	}

	//跳转到修改个人信息页面
	@RequestMapping("admin/skipToUserInfomation")
	public String skipToUserInfomation(HttpServletRequest request){
		Sysuser admin = (Sysuser)request.getSession().getAttribute("admin");
		Sysuser sysuser = (Sysuser)sysuserDao.findById(admin.getId());
		request.setAttribute("sysuser",sysuser);
		return "userinfomation";
	}

	//修改密码
	@RequestMapping("admin/userpasswordEdit")
	public String userpasswordEdit(HttpServletRequest request){
		Sysuser admin = (Sysuser)request.getSession().getAttribute("admin");
		Sysuser sysuser = (Sysuser)sysuserDao.findById(admin.getId());
		String oldpassword = request.getParameter("oldpassword");
		String newspassword = request.getParameter("newspassword");
		if(oldpassword.equals(sysuser.getUpass())){
			sysuser.setUpass(newspassword);
			sysuserDao.update(sysuser);
			request.setAttribute("suc","操作成功");
			return "userpassword";
		}else{
			request.setAttribute("suc","原密码错误");
			return "userpassword";
		}


	}

}
