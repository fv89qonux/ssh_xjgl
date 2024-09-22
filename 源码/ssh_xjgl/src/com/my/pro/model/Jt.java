package com.my.pro.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 家庭信息
 * @author 
 *显示家庭成员信息，姓名、性别、与本人关系、年龄、工作单位、联系方式
 */
@Entity
@Table(name="jt")
public class Jt {
	
	private Integer id;
	
	private User user;
	
	private String name;
	
	private Integer xb;//1男 2女
	
	private String brgx;//本人关系
	
	private String age;
	
	private String dw;//工作单位
	
	private String phone;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getXb() {
		return xb;
	}

	public void setXb(Integer xb) {
		this.xb = xb;
	}

	public String getBrgx() {
		return brgx;
	}

	public void setBrgx(String brgx) {
		this.brgx = brgx;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getDw() {
		return dw;
	}

	public void setDw(String dw) {
		this.dw = dw;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	

}
