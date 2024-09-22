package com.my.pro.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 身体素质
 * @author 
 *姓名、性别、年龄、身高、体重、血压、血型、肺活量、家族史、有无疾病、
        校医院联系方式。
 */
@Entity
@Table(name="stsz")
public class Stsz {
	
	private Integer id;
	
	private User user;
	
	private String sg;//身高
	private String tz ;//体重
	private String xy;//血压
	private String xx;//血型
	private String fhl;//肺活量
	private String jzbs;//家族史
	private String ywjb;//有无疾病
	private String phone;// 校医院联系方式
	
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@ManyToOne
	@JoinColumn(name="userId")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getSg() {
		return sg;
	}
	public void setSg(String sg) {
		this.sg = sg;
	}
	public String getTz() {
		return tz;
	}
	public void setTz(String tz) {
		this.tz = tz;
	}
	public String getXy() {
		return xy;
	}
	public void setXy(String xy) {
		this.xy = xy;
	}
	public String getXx() {
		return xx;
	}
	public void setXx(String xx) {
		this.xx = xx;
	}
	public String getFhl() {
		return fhl;
	}
	public void setFhl(String fhl) {
		this.fhl = fhl;
	}
	public String getJzbs() {
		return jzbs;
	}
	public void setJzbs(String jzbs) {
		this.jzbs = jzbs;
	}
	public String getYwjb() {
		return ywjb;
	}
	public void setYwjb(String ywjb) {
		this.ywjb = ywjb;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	

}
