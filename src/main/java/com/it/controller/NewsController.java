package com.it.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.NewsDao;
import com.it.dao.SysuserDao;
import com.it.entity.News;
import com.it.entity.Sysuser;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class NewsController {
    @Resource
	NewsDao newsDao;


    //后台资讯列表
	@RequestMapping("admin/newsList")
	public String newsList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		map.put("key", key);
        PageHelper.startPage(pageNum,10);
		List<News> list = newsDao.selectAll(map);
		PageInfo<News> pageInfo = new PageInfo<News>(list);
		request.setAttribute("key", key);
		request.setAttribute("pageInfo", pageInfo);
		return "newslist";
	}

    //前台资讯列表
    @RequestMapping("newsLb")
    public String newsLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
	    String flag = request.getParameter("flag");
	    HashMap map = new HashMap();
	    map.put("flag", flag);
        PageHelper.startPage(pageNum,10);
        List<News> list = newsDao.selectAll(map);
        for(News news:list){
            String content = Info.delHTMLTag(news.getContent());
            news.setContent(content);
        }
        PageInfo<News> pageInfo = new PageInfo<News>(list);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("flag", flag);
        return "newslb";
    }


    //资讯详情
    @RequestMapping("newsDetails")
    public String newsDetails(Integer id,HttpServletRequest request) {
        News news = newsDao.findById(id);
        request.setAttribute("news",news);
        return "newsdetails";
    }

	//添加资讯
	@RequestMapping("admin/newsAdd")
	public String newsAdd(News news,HttpServletRequest request) {
		news.setSavetime(Info.getDateStr());
		newsDao.add(news);
		return "redirect:newsList";
	}

	//删除资讯
	@RequestMapping("admin/newsDel")
	public String newsDel(Integer id,HttpServletRequest request) {
		newsDao.delete(id);
		return "redirect:newsList";
	}

	//查找news到修改页面
	@RequestMapping("admin/newsShow")
	public String newsShow(Integer id,HttpServletRequest request) {
		News news = newsDao.findById(id);
		request.setAttribute("news",news);
		return "newsedit";
	}

	//修改资讯
	@RequestMapping("admin/newsEdit")
	public String newsEdit(News news,HttpServletRequest request) {
		newsDao.update(news);
		return "redirect:newsList";
	}

}
