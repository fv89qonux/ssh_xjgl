package com.my.pro.dto;

import com.my.pro.model.Cj;
import com.my.pro.model.User;

public class CjDto {

	private User user;
	
	private Cj cj;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Cj getCj() {
		return cj;
	}

	public void setCj(Cj cj) {
		this.cj = cj;
	}
	
}
