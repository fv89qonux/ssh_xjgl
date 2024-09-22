package com.my.pro.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.my.pro.utils.MapUtils;
import com.my.pro.utils.Pager;
import com.my.pro.utils.UUIDUtils;
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
 * @date 2015年12月24日 下午1:46:33 - 2017年04月14日 21时44分17秒
 */

@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction implements ModelDriven<User>{
	
	private static final long serialVersionUID = 1L;


	
	//==========model==============
	  private User user;
		@Override
		public User getModel() {
			if(user==null) user = new User();
			return user;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
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
	 * 列表分页查询private String userName;//登陆
	private String passWord;//密码
	private String phone;//手机
	private String realName;//真实
	private Date createTime;
	 */
	public String user(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from User where 1=1 and isDelete = 0");
		if(user!=null && user.getRealName() !=null && !"".equals(user.getRealName())){
			sb.append("  and realName like :realName ");
			alias.put("realName", "%" +user.getRealName()+ "%" );
		}
		sb = sb.append("order by id desc");
		Pager<User> pagers = userService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("Obj", user);
		return SUCCESS;
    }
	
	  public void export() throws IOException {
		  Map<String,Object> alias = new HashMap<String,Object>();
			StringBuffer sb = new StringBuffer();
			sb = sb.append("from User where 1=1 and isDelete = 0");
			if(user!=null && user.getRealName() !=null && !"".equals(user.getRealName())){
				sb.append("  and realName like :realName ");
				alias.put("realName", "%" +user.getRealName()+ "%" );
			}
			sb = sb.append("order by id desc");
			List<User> list = userService.listByAlias(sb.toString(),alias);
	        // 生成Workbook
	        HSSFWorkbook wb = new HSSFWorkbook();
	        // 追加Sheet
	        Sheet sheet = wb.createSheet("Sheet");
	        // 总列数
	        Integer CountColumnNum = 5;
	        Cell[] firstCell = new Cell[CountColumnNum];
	        String[] firstCellNames = new String[CountColumnNum];
	        firstCellNames[0] = "年级";
	        firstCellNames[1] = "班级名称";
	        firstCellNames[2] = "姓名";
	        firstCellNames[3] = "登录名";
	        // 插入行
	        Row firstRow = sheet.createRow(0);
	        for (int j = 0; j < CountColumnNum; j++) {
	            firstCell[j] = firstRow.createCell(j);
	            firstCell[j].setCellValue(new HSSFRichTextString(firstCellNames[j]));
	        }
	        BigDecimal bd;
	        for (int i = 0; i < list.size(); i++) {
	            // 创建一行
	            Row row = sheet.createRow(i + 1);
	            Cell id = row.createCell(0);
	            id.setCellValue(list.get(i).getNj().toString());

	            Cell zzs = row.createCell(1);
	            zzs.setCellValue(list.get(i).getClassroom().getName().toString());

	            Cell xh = row.createCell(2);
	            xh.setCellValue(list.get(i).getRealName().toString());
	            Cell gh = row.createCell(3);
	            gh.setCellValue(list.get(i).getUserName().toString());
	        }
	        // 创建文件输出流，准备输出电子表格
	        HttpServletResponse response = ServletActionContext.getResponse();
	        response.setContentType("application/vnd.ms-excel");//response.setContentType("application/vnd.ms-excel");
	        response.setHeader("Content-disposition", "attachment;filename=export.xls");
	        OutputStream out = response.getOutputStream();
	        wb.write(out);
	        out.flush();
	        out.close();
	    }
	/**
	 * 跳转到添加页面
	 * @return
	 */
	public String add(){
		List<ClassRoom> classList = classRoomService.listByAlias("from ClassRoom where isDelete = 0", null);
		getActionContext().put("classList", classList);
		return SUCCESS;
	}
	
	/**
	 * 执行添加
	 * @return
	 * @throws IOException 
	 */
	public String exAdd() throws IOException{
		if(file != null){
			 String root  = Thread.currentThread().getContextClassLoader().getResource("").getPath().substring(0,Thread.currentThread().getContextClassLoader().getResource("").getPath().length()-16)
			 +"/upload";
			   //宣传图片
		        InputStream is = new FileInputStream(file);
		        fileFileName = UUIDUtils.create()+fileFileName;
		        OutputStream os = new FileOutputStream(new File(root, fileFileName));
		        System.out.println("fileFileName: " + fileFileName);
		        System.out.println("file: " + file.getName());
		        System.out.println("file: " + file.getPath());
		        byte[] buffer = new byte[500];
		        int length = 0;
		        user.setPhotoUrl("\\upload\\"+fileFileName);
     	        while(-1 != (length = is.read(buffer, 0, buffer.length)))
		        {
		            os.write(buffer);
		        }
		        os.close();
		        is.close();
		}
		 
		user.setCreateTime(new Date());
		user.setIsDelete(0);
		userService.save(user);
		ActionContext.getContext().put("url", "/user_user.do");
		return "redirect";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		List<ClassRoom> classList = classRoomService.listByAlias("from ClassRoom where isDelete = 0", null);
		getActionContext().put("classList", classList);
		User n = userService.getById(user.getId());
		ActionContext.getContext().put("Obj", n);
		return SUCCESS;
	}
	
	public String view2(){
		List<ClassRoom> classList = classRoomService.listByAlias("from ClassRoom where isDelete = 0", null);
		getActionContext().put("classList", classList);
		User n = userService.getById(UserUtils.getLoginId());
		ActionContext.getContext().put("Obj", n);
		return SUCCESS;
	}
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		List<ClassRoom> classList = classRoomService.listByAlias("from ClassRoom where isDelete = 0", null);
		getActionContext().put("classList", classList);
		User n = userService.getById(user.getId());
		ActionContext.getContext().put("Obj", n);
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 * @throws IOException 
	 */
	public String exUpdate() throws IOException{
		User n = userService.getById(user.getId());
		if(file != null){
			String root  = Thread.currentThread().getContextClassLoader().getResource("").getPath().substring(0,Thread.currentThread().getContextClassLoader().getResource("").getPath().length()-16)
			+"/upload";
			   //宣传图片
		        InputStream is = new FileInputStream(file);
		        fileFileName = UUIDUtils.create()+fileFileName;
		        OutputStream os = new FileOutputStream(new File(root, fileFileName));
		        System.out.println("fileFileName: " + fileFileName);
		        System.out.println("file: " + file.getName());
		        System.out.println("file: " + file.getPath());
		        byte[] buffer = new byte[500];
		        int length = 0;
		        n.setPhotoUrl("\\upload\\"+fileFileName);
    	        while(-1 != (length = is.read(buffer, 0, buffer.length)))
		        {
		            os.write(buffer);
		        }
		        os.close();
		        is.close();
		}
		 n.setBirth(user.getBirth());
		 n.setBj(user.getBj());
		 n.setCf(user.getCf());
		 n.setClassroom(user.getClassroom());
		 n.setJage1(user.getJage1());
		 n.setJage2(user.getJage2());
		 n.setJage3(user.getJage3());
		 n.setJdw1(user.getJdw1());
		 n.setJdw2(user.getJdw2());
		 n.setJdw3(user.getJdw3());
		 n.setJg(user.getJg());
		 n.setJgx1(user.getJgx1());
		 n.setJgx2(user.getJgx2());
		 n.setJgx3(user.getJgx3());
		 n.setJl(user.getJl());
		 n.setJlx1(user.getJlx1());
		 
		 n.setJlx2(user.getJlx2());
		 n.setJlx3(user.getJlx3());
		 n.setJname1(user.getJname1());
		 n.setJname2(user.getJname2());
		 n.setJname3(user.getJname3());
		 n.setJsex1(user.getJsex1());
		 n.setJsex2(user.getJsex2());
		 n.setJsex3(user.getJsex3());
		 n.setMz(user.getMz());
		 n.setNj(user.getNj());
		 n.setPassWord(user.getPassWord());
		 n.setPhone(user.getPhone());
		 n.setRealName(user.getRealName());
		 n.setUserName(user.getUserName());
		 n.setXb(user.getXb());
		 n.setXx(user.getXx());
		userService.update(n);
		ActionContext.getContext().put("url", "/user_user.do");
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		User n = userService.getById(user.getId());
		n.setIsDelete(1);
		userService.update(n);
		ActionContext.getContext().put("url", "/user_user.do");
		return "redirect";
	}
	
	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	public String classUser(){
		   Map<String,Object> alias = new HashMap<String,Object>();
			StringBuffer sb = new StringBuffer();
			sb = sb.append("from User where 1=1 and isDelete = 0 and classroom.id="+cid);
			if(user!=null && user.getRealName() !=null && !"".equals(user.getRealName())){
				sb.append("  and realName like :realName ");
				alias.put("realName", "%" +user.getRealName()+ "%" );
			}
			sb = sb.append("order by id desc");
			Pager<User> pagers = userService.findByAlias(sb.toString(),alias);
			ActionContext.getContext().put("pagers", pagers);
			ActionContext.getContext().put("Obj", user);
			ActionContext.getContext().put("cid", cid);
			return SUCCESS;
	}
	
	public String xkUser(){
		   Map<String,Object> alias = new HashMap<String,Object>();
			StringBuffer sb = new StringBuffer();
			sb = sb.append("from User where 1=1 and isDelete = 0 and classroom.id="+cid);
			if(user!=null && user.getRealName() !=null && !"".equals(user.getRealName())){
				sb.append("  and realName like :realName ");
				alias.put("realName", "%" +user.getRealName()+ "%" );
			}
			sb = sb.append("order by id desc");
			Pager<User> pagers = userService.findByAlias(sb.toString(),alias);
			ActionContext.getContext().put("pagers", pagers);
			ActionContext.getContext().put("Obj", user);
			ActionContext.getContext().put("cid", cid);
			return SUCCESS;
	}
	
	public String stszUser(){
		   Map<String,Object> alias = new HashMap<String,Object>();
			StringBuffer sb = new StringBuffer();
			sb = sb.append("from User where 1=1 and isDelete = 0 ");
			if(user!=null && user.getRealName() !=null && !"".equals(user.getRealName())){
				sb.append("  and realName like :realName ");
				alias.put("realName", "%" +user.getRealName()+ "%" );
			}
			sb = sb.append("order by id desc");
			Pager<User> pagers = userService.findByAlias(sb.toString(),alias);
			ActionContext.getContext().put("pagers", pagers);
			ActionContext.getContext().put("Obj", user);
			ActionContext.getContext().put("cid", cid);
			return SUCCESS;
	}
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
