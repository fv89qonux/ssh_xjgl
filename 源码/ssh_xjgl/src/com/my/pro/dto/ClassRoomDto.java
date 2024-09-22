package com.my.pro.dto;

import com.my.pro.model.ClassRoom;

public class ClassRoomDto {

	private ClassRoom classRoom;
	
	private Integer isCheck;

	public ClassRoom getClassRoom() {
		return classRoom;
	}

	public void setClassRoom(ClassRoom classRoom) {
		this.classRoom = classRoom;
	}

	public Integer getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(Integer isCheck) {
		this.isCheck = isCheck;
	}
}
