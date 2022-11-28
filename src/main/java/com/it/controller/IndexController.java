package com.it.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.*;
import com.it.util.Info;
import com.it.util.Savesession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

//首页
@Controller
public class IndexController {
    @Resource
    ImgadvDao imgadvDao;
    @Resource
    ProductDao productDao;
    @Resource
    CategoryDao categoryDao;
    @Resource
    CartDao cartDao;
    @Resource
    Savesession savesession;
    @Resource
    NewsDao newsDao;

    //首页
    @RequestMapping("index")
    public String index(HttpServletRequest request){
        Member member = (Member)request.getSession().getAttribute("sessionmember");
        List<Imgadv> imgadvlist = imgadvDao.selectAll();//图片
        HashMap map = new HashMap();
        map.put("istj", "yes");
        List<Product> tjproductlist = productDao.selectAll(map);
        savesession.getCategorySession(request);
        savesession.getCartSession(request);
        request.setAttribute("imgadvlist",imgadvlist);
        request.setAttribute("tjproductlist",tjproductlist);
        System.out.println(savesession.getIpAddr(request));
		return "welcome";
	}


    @RequestMapping("login")
    public String login(HttpServletRequest request){
        savesession.getCategorySession(request);
        return "login";
    }

}
