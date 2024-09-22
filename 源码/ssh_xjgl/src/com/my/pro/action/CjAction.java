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
import com.my.pro.dto.CjDto;
import com.my.pro.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2017年04月22日 18时17分09秒
 */

@Controller("cjAction")
@Scope("prototype")
public class CjAction extends BaseAction implements ModelDriven<Cj>{
	
	private static final long serialVersionUID = 1L;


	
	//==========model==============
	  private Cj cj;
		@Override
		public Cj getModel() {
			if(cj==null) cj = new Cj();
			return cj;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private CjService cjService;
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
	private Integer cid;
	private Integer uid;
	//============自定义参数end=============

	
	//-------------------------华丽分割线---------------------------------------------
	
	//============文件上传start=======================================================
	
	
	public Integer getCid() {
		return cid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
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
	public String cj(){
		Integer loginId = UserUtils.getLoginId();
		Teacher t = teacherService.getById(loginId);
		List<CjDto> cjs = new ArrayList<CjDto>();
		 Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from User where 1=1 and isDelete = 0 and classroom.id="+cid);
		sb = sb.append("order by id desc");
		List<User> pagers = userService.listByAlias(sb.toString(),alias);
		if(!isEmpty(pagers)){
			for(User u : pagers ){
				CjDto jd = new CjDto();
				jd.setUser(u);
				//查询这个学生是否在这学科 这学期有成绩
//				private Integer id;
//				
//				private Integer xq;//1 2 学期
//				
//				private Xk xk;//学科
//				
//				private String df;//得分
//				
//				private User user;//学生
				List<Cj> listByAlias = cjService.listByAlias("from Cj where xq="+cj.getXq()+" and xk.id = "+t.getXk().getId()+" and user.id="+u.getId(), null);
				if(!isEmpty(listByAlias)){
					jd.setCj(listByAlias.get(0));	
				}else{
					Cj cj = new Cj();
					cj.setDf(0+"");
				}
				cjs.add(jd);
			}
		}
		
		ActionContext.getContext().put("pagers", cjs);
		ActionContext.getContext().put("Obj", cj);
		ActionContext.getContext().put("teacher", t);
		return SUCCESS;
    }
	
	/**
	 * 学生成绩
	 * @return
	 */
	public String userCj(){
		Integer loginId = UserUtils.getLoginId();
		User user = userService.getById(loginId);
		 Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Cj where 1=1 and  user.id="+user.getId());
		if(cj!=null && cj.getXq() !=null && !"".equals(cj.getXq())){
			sb.append("  and xq = "+cj.getXq());
		}
		sb = sb.append("order by id desc");
		List<Cj> listByAlias = cjService.listByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", listByAlias);
		ActionContext.getContext().put("Obj", cj);
		ActionContext.getContext().put("user", user);
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
		cjService.save(cj);
		ActionContext.getContext().put("url", "/cj_cj.do");
		return "redirect";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		Cj n = cjService.getById(cj.getId());
		ActionContext.getContext().put("Obj", n);
		return SUCCESS;
	}
	
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		Integer loginId = UserUtils.getLoginId();
		Teacher t = teacherService.getById(loginId);
		User u = userService.getById(uid);
		ActionContext.getContext().put("user", u);
		ActionContext.getContext().put("xq", cj.getXq());
		ActionContext.getContext().put("uid", uid);
		List<Cj> listByAlias = cjService.listByAlias("from Cj where xq="+cj.getXq()+" and xk.id = "+t.getXk().getId()+" and user.id="+u.getId(), null);
		if(!isEmpty(listByAlias)){
			Cj cj2 = listByAlias.get(0);
			ActionContext.getContext().put("cj", cj2);
		}else{
		}
		
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 */
	public String exUpdate(){
		Integer loginId = UserUtils.getLoginId();
		Teacher t = teacherService.getById(loginId);
		User u = userService.getById(cj.getUser().getId());
		ActionContext.getContext().put("user", u);
		ActionContext.getContext().put("xq", cj.getXq());
		ActionContext.getContext().put("uid", uid);
		List<Cj> listByAlias = cjService.listByAlias("from Cj where xq="+cj.getXq()+" and xk.id = "+t.getXk().getId()+" and user.id="+u.getId(), null);
		if(!isEmpty(listByAlias)){
			Cj cj2 = listByAlias.get(0);
			cj2.setDf(cj.getDf());
			cjService.update(cj2);
		}else{
			cj.setXk(t.getXk());
			cjService.save(cj);
		}
		
		ActionContext.getContext().put("url", "/cj_cj.do?cid="+u.getClassroom().getId()+"&xq="+cj.getXq());
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		cjService.delete(cj.getId());
		ActionContext.getContext().put("url", "/cj_cj.do");
		return "redirect";
	}
	
	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
