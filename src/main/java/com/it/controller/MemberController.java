package com.it.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.LoginipDao;
import com.it.dao.MemberDao;
import com.it.dao.SysuserDao;
import com.it.entity.Loginip;
import com.it.entity.Member;
import com.it.entity.Sysuser;
import com.it.util.Info;
import com.it.util.Savesession;
import com.sun.org.apache.bcel.internal.generic.NEW;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

@Controller
public class MemberController {
    @Resource
	MemberDao memberDao;
    @Resource
    Savesession savesession;
    @Resource
    LoginipDao loginipDao;



	//检查用户名的唯一性
	@RequestMapping("checkUname")
	public void checkUname(String uname, HttpServletRequest request, HttpServletResponse response){
		PrintWriter out = null;
		try {
			out = response.getWriter();
			HashMap map = new HashMap();
			map.put("uname", uname);
			List<Member> list = memberDao.selectAll(map);
			if(list.size()==0){
				out.print(0);
			}else{
				out.print(1);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//注册
	@RequestMapping("registerMember")
	public String registerMember(Member member,HttpServletRequest request){
		member.setDelstatus("0");
		member.setYue(0);
        member.setStatus("正常");
		memberDao.add(member);
		request.getSession().setAttribute("suc","注册成功");
		return "redirect:login";
	}

	//登录
	@RequestMapping("loginMember")
	public String loginMember(Member member,HttpServletRequest request,RedirectAttributes redirectAttributes){
		HashMap map = new HashMap();
		map.put("uname",member.getUname());
		map.put("upass",member.getUpass());
		List<Member> list = memberDao.selectAll(map);
		if(list.size()==0){
			request.getSession().setAttribute("login","登录失败");
			return "redirect:login";
		}else {
		    if(list.get(0).getStatus().equals("冻结")){
                redirectAttributes.addFlashAttribute("message","帐号冻结");
                return "redirect:login";
            }else{
                String ipaddr = savesession.getIpAddr(request);
                Loginip loginip = new Loginip();
                loginip.setIpaddr(ipaddr);
                loginip.setSavetime(Info.getDateStr());
                loginip.setUname(member.getUname());
                loginipDao.add(loginip);
                request.getSession().setAttribute("sessionmember",list.get(0));
            }
			return "redirect:index";
		}
	}

	//退出
	@RequestMapping("memberExit")
	public String memberExit(HttpServletRequest request){
		request.getSession().removeAttribute("sessionmember");
		return "redirect:index";
	}

	//个人信息
	@RequestMapping("accountMsg")
	public String accountMsg(HttpServletRequest request){
		Member sessionmember = (Member)request.getSession().getAttribute("sessionmember");
		String suc = request.getParameter("suc")==null?"":request.getParameter("suc");
		String error = request.getParameter("error")==null?"":request.getParameter("error");
		if(sessionmember!=null) {
			Member member = memberDao.findById(sessionmember.getId());
			request.setAttribute("member",member);
			if(!suc.equals("")){
				request.setAttribute("suc","修改成功");
			}
			if(!error.equals("")){
				request.setAttribute("error","原密码输入有误");
			}
			return "accountmsg";
		}else{
			return "redirect:login";
		}
	}

	//修改个人信息
	@RequestMapping("memberEdit")
	public String memberEdit(Member member,HttpServletRequest request){
			memberDao.update(member);
			return "redirect:accountMsg?suc=suc";
	}

	//修改密码
	@RequestMapping("upassEdit")
	public String upassEdit(HttpServletRequest request){
		Member sessionmember = (Member)request.getSession().getAttribute("sessionmember");
		String oldupass = request.getParameter("oldupass");
		String newsupass = request.getParameter("newsupass");
		if(sessionmember!=null) {
			Member member = memberDao.findById(sessionmember.getId());
			if(member.getUpass().equals(oldupass)) {
				member.setUpass(newsupass);
				memberDao.update(member);
				return "redirect:accountMsg?suc=suc";
			}else{
				return "redirect:accountMsg?error=error";
			}
		}else{
			return "redirect:login";
		}
	}


    //会员列表
    @RequestMapping("admin/memberList")
    public String memberList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, HttpServletRequest request) {
        String key = request.getParameter("key");
        HashMap map = new HashMap();
        map.put("key", key);
        PageHelper.startPage(pageNum,10);
        List<Member> list = memberDao.selectAll(map);
        PageInfo<Member> pageInfo = new PageInfo<Member>(list);
        request.setAttribute("key", key);
        request.setAttribute("pageInfo", pageInfo);
        return "memberlist";
    }

    //删除
    @RequestMapping("admin/memberDel")
    public String memberDel(int id,HttpServletRequest request){
	    Member member = memberDao.findById(id);
        member.setDelstatus("1");
        memberDao.update(member);
        return "redirect:memberList";
    }

    //重置密码
    @RequestMapping("admin/resetupass")
    public String resetupass(int id, HttpServletRequest request, RedirectAttributes redirectAttributes){
        Member member = memberDao.findById(id);
        member.setUpass("123");
        memberDao.update(member);
        redirectAttributes.addFlashAttribute("message","操作成功");
        return "redirect:memberList";
    }

    //帐号状态
    @RequestMapping("admin/editstatus")
    public String editstatus(int id, HttpServletRequest request, RedirectAttributes redirectAttributes){
        Member member = memberDao.findById(id);
        if(member.getStatus().equals("正常")){
            member.setStatus("冻结");
        }else{
            member.setStatus("正常");
        }
        memberDao.update(member);
        redirectAttributes.addFlashAttribute("message","操作成功");
        return "redirect:memberList";
    }
}
