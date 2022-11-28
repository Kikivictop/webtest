package com.it.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.AboutDAO;
import com.it.entity.About;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class AboutController {
    @Resource
    AboutDAO aboutDao;





    //关于我们详情
    @RequestMapping("aboutDetails")
    public String aboutDetails(HttpServletRequest request) {
        About about = aboutDao.findById(1);
        request.setAttribute("about",about);
        return "aboutdetails";
    }


	//查找about到修改页面
	@RequestMapping("admin/aboutShow")
	public String aboutShow(Integer id,HttpServletRequest request) {
		About about = aboutDao.findById(1);
		request.setAttribute("about",about);
		return "aboutedit";
	}



    //修改关于我们
	@RequestMapping("admin/aboutEdit")
	public String aboutEdit(About about, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		aboutDao.update(about);
        redirectAttributes.addFlashAttribute("message","编辑成功");
		return "redirect:aboutShow";
	}

}
