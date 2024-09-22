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
 * @date 2015年12月24日 下午1:46:33 - 2017年04月22日 18时17分09秒
 */

@Controller("kbAction")
@Scope("prototype")
public class KbAction extends BaseAction implements ModelDriven<Kb>{
	
	private static final long serialVersionUID = 1L;


	
	//==========model==============
	  private Kb kb;
		@Override
		public Kb getModel() {
			if(kb==null) kb = new Kb();
			return kb;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
		@Autowired
		private UserService userService;
	@Autowired
	private KbService kbService;
	@Autowired
	private ClassRoomService classRoomService;
	@Autowired
	private XkService xkService;
	//依赖注入 end  dao/service/===
	@Autowired
	private TeacherClassService teacherClassService;
	//-------------------------华丽分割线---------------------------------------------
	
	//============自定义参数start=============
	
	private Integer cid;
	
	//============自定义参数end=============

	
	//-------------------------华丽分割线---------------------------------------------
	
	//============文件上传start=======================================================
	
	
	public Integer getCid() {
		return cid;
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
	public String kb(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Kb where 1=1 ");
		sb = sb.append("order by id desc");
		Pager<Kb> pagers = kbService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ClassRoom byId = classRoomService.getById(cid);
		ActionContext.getContext().put("Obj", byId);
		return SUCCESS;
    }
	public String kb2(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Kb where 1=1 ");
		sb = sb.append("order by id desc");
		Pager<Kb> pagers = kbService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ClassRoom byId = classRoomService.getById(cid);
		ActionContext.getContext().put("Obj", byId);
		return SUCCESS;
    }
	public String kb3(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Kb where 1=1 ");
		sb = sb.append("order by id desc");
		Pager<Kb> pagers = kbService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		User u =userService.getById(UserUtils.getLoginId());
		ClassRoom byId = classRoomService.getById(u.getClassroom().getId());
		ActionContext.getContext().put("Obj", byId);
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
		kbService.save(kb);
		ActionContext.getContext().put("url", "/kb_kb.do");
		return "redirect";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		//根据传来的 xq以及cid查询
		Map<Integer,String> map = new HashMap<Integer,String>();
		List<Integer> xkIds = new ArrayList<Integer>();
		List<Kb> listByAlias = kbService.listByAlias("from Kb where classRoom.id="+cid+" and xq="+kb.getXq(), null);
		if(!isEmpty(listByAlias)){
			Kb kb2 = listByAlias.get(0);
			ActionContext.getContext().put("Obj", kb2);
			//将所有xk分类
			if(!xkIds.contains(Integer.valueOf(kb2.getName1()))){xkIds.add(Integer.valueOf(kb2.getName1()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName2()))){xkIds.add(Integer.valueOf(kb2.getName2()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName3()))){xkIds.add(Integer.valueOf(kb2.getName3()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName4()))){xkIds.add(Integer.valueOf(kb2.getName4()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName5()))){xkIds.add(Integer.valueOf(kb2.getName5()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName6()))){xkIds.add(Integer.valueOf(kb2.getName6()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName7()))){xkIds.add(Integer.valueOf(kb2.getName7()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName8()))){xkIds.add(Integer.valueOf(kb2.getName8()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName9()))){xkIds.add(Integer.valueOf(kb2.getName9()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName10()))){xkIds.add(Integer.valueOf(kb2.getName10()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName11()))){xkIds.add(Integer.valueOf(kb2.getName11()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName12()))){xkIds.add(Integer.valueOf(kb2.getName12()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName13()))){xkIds.add(Integer.valueOf(kb2.getName13()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName14()))){xkIds.add(Integer.valueOf(kb2.getName14()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName15()))){xkIds.add(Integer.valueOf(kb2.getName15()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName16()))){xkIds.add(Integer.valueOf(kb2.getName16()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName17()))){xkIds.add(Integer.valueOf(kb2.getName17()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName18()))){xkIds.add(Integer.valueOf(kb2.getName18()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName19()))){xkIds.add(Integer.valueOf(kb2.getName19()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName20()))){xkIds.add(Integer.valueOf(kb2.getName20()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName21()))){xkIds.add(Integer.valueOf(kb2.getName21()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName22()))){xkIds.add(Integer.valueOf(kb2.getName22()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName23()))){xkIds.add(Integer.valueOf(kb2.getName23()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName24()))){xkIds.add(Integer.valueOf(kb2.getName24()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName25()))){xkIds.add(Integer.valueOf(kb2.getName25()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName26()))){xkIds.add(Integer.valueOf(kb2.getName26()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName27()))){xkIds.add(Integer.valueOf(kb2.getName27()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName28()))){xkIds.add(Integer.valueOf(kb2.getName28()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName29()))){xkIds.add(Integer.valueOf(kb2.getName29()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName30()))){xkIds.add(Integer.valueOf(kb2.getName30()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName31()))){xkIds.add(Integer.valueOf(kb2.getName31()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName32()))){xkIds.add(Integer.valueOf(kb2.getName32()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName33()))){xkIds.add(Integer.valueOf(kb2.getName33()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName34()))){xkIds.add(Integer.valueOf(kb2.getName34()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName35()))){xkIds.add(Integer.valueOf(kb2.getName35()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName36()))){xkIds.add(Integer.valueOf(kb2.getName36()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName37()))){xkIds.add(Integer.valueOf(kb2.getName37()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName38()))){xkIds.add(Integer.valueOf(kb2.getName38()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName39()))){xkIds.add(Integer.valueOf(kb2.getName39()));}
			if(!xkIds.contains(Integer.valueOf(kb2.getName40()))){xkIds.add(Integer.valueOf(kb2.getName40()));}
			//[6, 7, 5, 8, 9, 10, 11, 12]
			//查询每一门课程 对应的老师
			
			if(!isEmpty(xkIds)){
				for(Integer xkId:xkIds){
					//根据班级id和学科id查询老师
					List<TeacherClass> listByAlias2 = teacherClassService.listByAlias(" from TeacherClass where classroom.id="+cid+" and teacher.xk.id="+xkId, null);
					if(!isEmpty(listByAlias2)){
						map.put(xkId, listByAlias2.get(0).getTeacher().getRealName());
					}
				}
			}
		}else{
			ActionContext.getContext().put("Obj", null);
		}
		ActionContext.getContext().put("map", map);
		List<Xk> xkList = xkService.listByAlias("from Xk ", null);
		ActionContext.getContext().put("xkList", xkList);
		return SUCCESS;
	}
	
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		List<Xk> xkList = xkService.listByAlias("from Xk ", null);
		getActionContext().put("xkList", xkList);
		//根据传来的 xq以及cid查询
		List<Kb> listByAlias = kbService.listByAlias("from Kb where classRoom.id="+cid+" and xq="+kb.getXq(), null);
		if(!isEmpty(listByAlias)){
			ActionContext.getContext().put("Obj", listByAlias.get(0));
		}else{
			ActionContext.getContext().put("Obj", null);
		}
		ActionContext.getContext().put("cid", null);
		ActionContext.getContext().put("xq", kb.getXq());
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 */
	public String exUpdate(){
		List<Kb> listByAlias = kbService.listByAlias("from Kb where classRoom.id="+cid+" and xq="+kb.getXq(), null);
		if(!isEmpty(listByAlias)){
			Kb kb2 = listByAlias.get(0);
			kb2.setName1(kb.getName1());
			kb2.setName2(kb.getName2());
			kb2.setName3(kb.getName3());
			kb2.setName4(kb.getName4());
			kb2.setName5(kb.getName5());
			kb2.setName6(kb.getName6());
			kb2.setName7(kb.getName7());
			kb2.setName8(kb.getName8());
			kb2.setName9(kb.getName9());
			kb2.setName10(kb.getName10());
			kb2.setName11(kb.getName11());
			kb2.setName12(kb.getName12());
			kb2.setName13(kb.getName13());
			kb2.setName14(kb.getName14());
			kb2.setName15(kb.getName15());
			kb2.setName16(kb.getName16());
			kb2.setName17(kb.getName17());
			kb2.setName18(kb.getName18());
			kb2.setName19(kb.getName19());
			kb2.setName20(kb.getName20());
			kb2.setName21(kb.getName21());
			kb2.setName22(kb.getName22());
			kb2.setName23(kb.getName23());
			kb2.setName24(kb.getName24());
			kb2.setName25(kb.getName25());
			kb2.setName26(kb.getName26());
			kb2.setName27(kb.getName27());
			kb2.setName28(kb.getName28());
			kb2.setName29(kb.getName29());
			kb2.setName30(kb.getName30());
			kb2.setName31(kb.getName31());
			kb2.setName32(kb.getName32());
			kb2.setName33(kb.getName33());
			kb2.setName34(kb.getName34());
			kb2.setName35(kb.getName35());
			kb2.setName36(kb.getName36());
			kb2.setName37(kb.getName37());
			kb2.setName38(kb.getName38());
			kb2.setName39(kb.getName39());
			kb2.setName40(kb.getName40());
			kbService.update(kb2);
			
		}else{
			//新增
			ClassRoom c = new ClassRoom();
			c.setId(cid);
			kb.setClassRoom(c);
			kb.setXq(kb.getXq());
			kbService.save(kb);
		}
		ActionContext.getContext().put("url", "/kb_kb.do?cid="+cid);
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		kbService.delete(kb.getId());
		ActionContext.getContext().put("url", "/kb_kb.do");
		return "redirect";
	}
	
	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
