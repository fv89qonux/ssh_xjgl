package com.my.pro.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 教师
 * @author 
 *
 */
@Entity
@Table(name="teacher")
public class Teacher {
	
	private Integer id;
	
	private String userName;
	
	private String passWrd;
	
	private String realName;
	
	private Xk xk;
	
	private Integer isDelete;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWrd() {
		return passWrd;
	}

	public void setPassWrd(String passWrd) {
		this.passWrd = passWrd;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	@ManyToOne
	@JoinColumn(name="xkId")
	public Xk getXk() {
		return xk;
	}

	public void setXk(Xk xk) {
		this.xk = xk;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	} 

}
