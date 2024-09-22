package com.my.pro.action;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.my.pro.utils.Pager;
import com.my.pro.utils.UserUtils;
import com.opensymphony.xwork2.ModelDriven;
import java.util.*;

import com.my.pro.model.*;
import com.my.pro.dao.*;
import com.my.pro.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2017年04月22日 18时17分10秒
 */

@Controller("stszAction")
@Scope("prototype")
public class StszAction extends BaseAction implements ModelDriven<Stsz>{
	
	private static final long serialVersionUID = 1L;


	
	//==========model==============
	  private Stsz stsz;
		@Override
		public Stsz getModel() {
			if(stsz==null) stsz = new Stsz();
			return stsz;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private StszService stszService;
	@Autowired
	private UserService userService;
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private XkService xkService;
	
	@Autowired
	private TeacherClassService teacherClassService;
	
	@Autowired
	private ClassRoomService classRoomService;
	//依赖注入 end  dao/service/===
	
	//-------------------------华丽分割线---------------------------------------------
	
	//============自定义参数start=============
	private Integer uid;
	//============自定义参数end=============

	
	//-------------------------华丽分割线---------------------------------------------
	
	//============文件上传start=======================================================
	
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	private File file;
	//提交过来的file的名字
    private String fileFileName;
    //提交过来的file的MIME类型
    private String fileContentType;
    public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	 //============文件上传end=========================================================
	public String jsonAction() {
		  // dataMap中的数据将会被Struts2转换成JSON字符串，所以这里要先清空其中的数据
		  jsonMap.clear();
		  jsonMap.put("success", true);
		  return JSON_TYPE;
	}
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============公=======共=======方=======法==========区=========start============//
	/**
	 * 列表分页查询
	 */
	public String stsz(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Stsz where 1=1 ");
		sb = sb.append("order by id desc");
		Pager<Stsz> pagers = stszService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("Obj", stsz);
		return SUCCESS;
    }
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	public String add(){
		return SUCCESS;
	}
	
	/**
	 * 执行添加
	 * @return
	 */
	public String exAdd(){
		stszService.save(stsz);
		ActionContext.getContext().put("url", "/stsz_stsz.do");
		return "redirect";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		User byId = userService.getById(UserUtils.getLoginId());
		ActionContext.getContext().put("user", byId);
		List<Stsz> listByAlias = stszService.listByAlias("from Stsz where user.id="+byId.getId(), null);
		if(!isEmpty(listByAlias)){
			ActionContext.getContext().put("Obj",listByAlias.get(0));
		}else{
			ActionContext.getContext().put("Obj", null);
		}
		return SUCCESS;
	}
	
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		User byId = userService.getById(uid);
		ActionContext.getContext().put("user", byId);
		List<Stsz> listByAlias = stszService.listByAlias("from Stsz where user.id="+uid, null);
		if(!isEmpty(listByAlias)){
			ActionContext.getContext().put("Obj",listByAlias.get(0));
		}else{
			ActionContext.getContext().put("Obj", null);
		}
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 */
	public String exUpdate(){
		//根据uid查询
		List<Stsz> listByAlias = stszService.listByAlias("from Stsz where user.id="+uid, null);
		if(!isEmpty(listByAlias)){
			Stsz stsz2 = listByAlias.get(0);
			stsz2.setFhl(stsz.getFhl());
			stsz2.setJzbs(stsz.getJzbs());
			stsz2.setPhone(stsz.getPhone());
			stsz2.setSg(stsz.getSg());
			stsz2.setTz(stsz.getTz());
			stsz2.setXx(stsz.getXx());
			stsz2.setXy(stsz.getXy());
			stsz2.setYwjb(stsz.getYwjb());
			stszService.update(stsz2);
		}else{
			User u = new User();
			u.setId(uid);
			stsz.setUser(u);
			stszService.save(stsz);
		}
		
		ActionContext.getContext().put("url", "/user_stszUser.do");
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		stszService.delete(stsz.getId());
		ActionContext.getContext().put("url", "/stsz_stsz.do");
		return "redirect";
	}
	
	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
