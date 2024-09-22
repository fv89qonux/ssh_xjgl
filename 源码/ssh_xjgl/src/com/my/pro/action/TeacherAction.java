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
import com.opensymphony.xwork2.ModelDriven;
import java.util.*;

import com.my.pro.model.*;
import com.my.pro.dao.*;
import com.my.pro.dto.ClassRoomDto;
import com.my.pro.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2017年04月22日 18时17分10秒
 */

@Controller("teacherAction")
@Scope("prototype")
public class TeacherAction extends BaseAction implements ModelDriven<Teacher>{
	
	private static final long serialVersionUID = 1L;


	
	//==========model==============
	  private Teacher teacher;
		@Override
		public Teacher getModel() {
			if(teacher==null) teacher = new Teacher();
			return teacher;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
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
	
	private Integer [] bjs;
	//============自定义参数end=============

	
	//-------------------------华丽分割线---------------------------------------------
	
	//============文件上传start=======================================================
	
	
	private File file;
	public Integer[] getBjs() {
		return bjs;
	}
	public void setBjs(Integer[] bjs) {
		this.bjs = bjs;
	}
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
	public String teacher(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Teacher where 1=1 and isDelete = 0 ");
		if(teacher!=null && teacher.getRealName() !=null && !"".equals(teacher.getRealName())){
			sb.append("  and realName like :realName ");
			alias.put("realName", "%" +teacher.getRealName()+ "%" );
		}
		sb = sb.append("order by id desc");
		Pager<Teacher> pagers = teacherService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("Obj", teacher);
		return SUCCESS;
    }
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	public String add(){
		List<Xk> xkList = xkService.listByAlias("from Xk ", null);
		List<ClassRoom> classList = classRoomService.listByAlias("from ClassRoom where isDelete = 0", null);
		getActionContext().put("xkList", xkList);
		getActionContext().put("classList", classList);
		return SUCCESS;
	}
	
	/**
	 * 执行添加
	 * @return
	 */
	public String exAdd(){
		teacher.setIsDelete(0);
		teacher.setPassWrd("111111");
		teacherService.save(teacher);
		if(!isEmpty(bjs)){
			for(Integer bj: bjs){
				TeacherClass t = new TeacherClass();
				ClassRoom c= new ClassRoom();
				c.setId(bj);
				t.setClassroom(c);
				t.setTeacher(teacher);
				teacherClassService.save(t);
			}
		}
		ActionContext.getContext().put("url", "/teacher_teacher.do");
		return "redirect";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		Teacher n = teacherService.getById(teacher.getId());
		ActionContext.getContext().put("Obj", n);
		return SUCCESS;
	}
	
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		List<Xk> xkList = xkService.listByAlias("from Xk ", null);
		List<ClassRoom> classList = classRoomService.listByAlias("from ClassRoom where isDelete = 0", null);
		List<TeacherClass> checkList = teacherClassService.listByAlias("from TeacherClass where teacher.id="+teacher.getId(), null);
		List<Integer> ids = new ArrayList<Integer>();
		List<ClassRoomDto> ls = new ArrayList<ClassRoomDto>();
		if(!isEmpty(checkList)){
			for(TeacherClass t : checkList){
				ids.add(t.getClassroom().getId());
			}
		}
		if(!isEmpty(classList)){
			for(ClassRoom c : classList){
				ClassRoomDto cd = new ClassRoomDto();
				if(!isEmpty(ids)){
					if(ids.contains(c.getId())){
						cd.setIsCheck(1);
					}
				}
				cd.setClassRoom(c);
				ls.add(cd);
			}
			
		}
		getActionContext().put("xkList", xkList);
		getActionContext().put("ls", ls);
		Teacher n = teacherService.getById(teacher.getId());
		ActionContext.getContext().put("Obj", n);
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 */
	public String exUpdate(){
		Teacher n = teacherService.getById(teacher.getId());
		n.setRealName(teacher.getRealName());
		n.setUserName(teacher.getUserName());
		n.setXk(teacher.getXk());
		//删除教师和课程关系
		List<TeacherClass> checkList = teacherClassService.listByAlias("from TeacherClass where teacher.id="+teacher.getId(), null);
		if(!isEmpty(checkList)){
			for(TeacherClass t : checkList){
				teacherClassService.delete(t.getId());
			}
		}
		//新增新的
		if(!isEmpty(bjs)){
			for(Integer bj: bjs){
				TeacherClass t = new TeacherClass();
				ClassRoom c= new ClassRoom();
				c.setId(bj);
				t.setClassroom(c);
				t.setTeacher(teacher);
				teacherClassService.save(t);
			}
		}
		teacherService.update(n);
		ActionContext.getContext().put("url", "/teacher_teacher.do");
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		Teacher n = teacherService.getById(teacher.getId());
		n.setIsDelete(1);
		teacherService.update(n);
		ActionContext.getContext().put("url", "/teacher_teacher.do");
		return "redirect";
	}
	
	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
