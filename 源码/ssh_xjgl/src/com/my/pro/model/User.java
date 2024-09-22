package com.my.pro.model;


import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.transaction.annotation.Transactional;

/*以表格的形式显示学生具体信息，表格上方有学校、年级、班级、姓名信息。
表格中以从左到下从上到下顺序显示学生信息，分别为姓名、性别、民族、照片（4-5行）
出生日期、籍贯、联系方式、家庭住址。
显示家庭成员信息，姓名、性别、与本人关系、年龄、工作单位、联系方式
接下来分别有两张表格，奖励情况（何时受奖、何地受奖、何故受奖、受何等奖）和
处分情况（何时受处、何地受处、何故受处、受何处分）。 */
@Entity
@Table(name="user")
public class User implements Serializable{
	private int id;
	private String userName;//登陆学号
	private String passWord;//密码
	private String realName;//真实
	private Date createTime;
	
	private String nj;//年级
	
	private String bj;//班级
	
	private String xx;//学校
	
	private Integer xb;//1男 2 女
	
	public String getNj() {
		return nj;
	}
	public void setNj(String nj) {
		this.nj = nj;
	}
	public String getBj() {
		return bj;
	}
	public void setBj(String bj) {
		this.bj = bj;
	}
	public String getXx() {
		return xx;
	}
	public void setXx(String xx) {
		this.xx = xx;
	}
	private String mz;//民族
	
	private String photoUrl;
	
	private String birth;//出生日期
	
	private String  jg;//籍贯
	
	private String phone;//联系方式
	
	private String address;//地址
	
	private String jl;//奖励
	
	private String cf;//处分
	
	private ClassRoom classroom;
	
	//=================家庭关系
	/*<th width="90">姓名</th>
    <th width="90">性别</th>
     <th width="110">与本人关系</th>
    <th>年龄</th>
    <th width="90">工作单位</th>
     <th width="130">联系方式</th>*/
	
	private String jname1;//名字
	
	private Integer jsex1;//性别
	
	private String jgx1;//与本人关系
	
	private String jage1;//年龄
	
	private String jdw1;//工作单位
	
	private String jlx1;//联系方式
	
	
private String jname2;//名字
	
	private Integer jsex2;//性别
	
	private String jgx2;//与本人关系
	
	private String jage2;//年龄
	
	private String jdw2;//工作单位
	
	private String jlx2;//联系方式
	
    private String jname3;//名字
	
	private Integer jsex3;//性别
	
	private String jgx3;//与本人关系
	
	private String jage3;//年龄
	
	private String jdw3;//工作单位
	
	private String jlx3;//联系方式
	
	public String getJname1() {
		return jname1;
	}
	public void setJname1(String jname1) {
		this.jname1 = jname1;
	}
	public Integer getJsex1() {
		return jsex1;
	}
	public void setJsex1(Integer jsex1) {
		this.jsex1 = jsex1;
	}
	public String getJgx1() {
		return jgx1;
	}
	public void setJgx1(String jgx1) {
		this.jgx1 = jgx1;
	}
	public String getJage1() {
		return jage1;
	}
	public void setJage1(String jage1) {
		this.jage1 = jage1;
	}
	public String getJdw1() {
		return jdw1;
	}
	public void setJdw1(String jdw1) {
		this.jdw1 = jdw1;
	}
	public String getJlx1() {
		return jlx1;
	}
	public void setJlx1(String jlx1) {
		this.jlx1 = jlx1;
	}
	public String getJname2() {
		return jname2;
	}
	public void setJname2(String jname2) {
		this.jname2 = jname2;
	}
	public Integer getJsex2() {
		return jsex2;
	}
	public void setJsex2(Integer jsex2) {
		this.jsex2 = jsex2;
	}
	public String getJgx2() {
		return jgx2;
	}
	public void setJgx2(String jgx2) {
		this.jgx2 = jgx2;
	}
	public String getJage2() {
		return jage2;
	}
	public void setJage2(String jage2) {
		this.jage2 = jage2;
	}
	public String getJdw2() {
		return jdw2;
	}
	public void setJdw2(String jdw2) {
		this.jdw2 = jdw2;
	}
	public String getJlx2() {
		return jlx2;
	}
	public void setJlx2(String jlx2) {
		this.jlx2 = jlx2;
	}
	public String getJname3() {
		return jname3;
	}
	public void setJname3(String jname3) {
		this.jname3 = jname3;
	}
	public Integer getJsex3() {
		return jsex3;
	}
	public void setJsex3(Integer jsex3) {
		this.jsex3 = jsex3;
	}
	public String getJgx3() {
		return jgx3;
	}
	public void setJgx3(String jgx3) {
		this.jgx3 = jgx3;
	}
	public String getJage3() {
		return jage3;
	}
	public void setJage3(String jage3) {
		this.jage3 = jage3;
	}
	public String getJdw3() {
		return jdw3;
	}
	public void setJdw3(String jdw3) {
		this.jdw3 = jdw3;
	}
	public String getJlx3() {
		return jlx3;
	}
	public void setJlx3(String jlx3) {
		this.jlx3 = jlx3;
	}
	public Integer getXb() {
		return xb;
	}
	public void setXb(Integer xb) {
		this.xb = xb;
	}
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getPhotoUrl() {
		return photoUrl;
	}
	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getJg() {
		return jg;
	}
	public void setJg(String jg) {
		this.jg = jg;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJl() {
		return jl;
	}
	public void setJl(String jl) {
		this.jl = jl;
	}
	public String getCf() {
		return cf;
	}
	public void setCf(String cf) {
		this.cf = cf;
	}
	@ManyToOne
	@JoinColumn(name="classroomId")
	public ClassRoom getClassroom() {
		return classroom;
	}
	public void setClassroom(ClassRoom classroom) {
		this.classroom = classroom;
	}
	private Integer isDelete;//
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
