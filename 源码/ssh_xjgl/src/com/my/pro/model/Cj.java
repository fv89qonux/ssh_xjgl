package com.my.pro.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 成绩
 * @author 
 *
 */
@Entity
@Table(name="cj")
public class Cj {
	
	private Integer id;
	
	private Integer xq;//1 2 学期
	
	private Xk xk;//学科
	
	private String df;//得分
	
	private User user;//学生

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getXq() {
		return xq;
	}

	public void setXq(Integer xq) {
		this.xq = xq;
	}

	@ManyToOne
	@JoinColumn(name="xkId")
	public Xk getXk() {
		return xk;
	}

	public void setXk(Xk xk) {
		this.xk = xk;
	}

	public String getDf() {
		return df;
	}

	public void setDf(String df) {
		this.df = df;
	}

	@ManyToOne
	@JoinColumn(name="userId")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
	

}
