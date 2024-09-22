package com.my.pro.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 课表
 * @author 
 *
 */
@Entity
@Table(name="kb")
public class Kb {
	
	private Integer id;
	
	private Integer xq;//1 2 学期
	
	private ClassRoom classRoom;//班级
	
	
	private String  name1;//课程名称1
	private String  name2;//课程名称2
	private String  name3;//课程名称3
	private String  name4;//课程名称4
	private String  name5;//课程名称5
	private String  name6;//课程名称6
	private String  name7;//课程名称7
	private String  name8;//课程名称8
	private String  name9;//课程名称9
	private String  name10;//课程名称10
	private String  name11;//课程名称11
	private String  name12;//课程名称12
	private String  name13;//课程名称13
	private String  name14;//课程名称14
	private String  name15;//课程名称15
	private String  name16;//课程名称16
	private String  name17;//课程名称17
	private String  name18;//课程名称18
	private String  name19;//课程名称19
	private String  name20;//课程名称20
	private String  name21;//课程名称21
	private String  name22;//课程名称22
	private String  name23;//课程名称23
	private String  name24;//课程名称24
	private String  name25;//课程名称25
	private String  name26;//课程名称26
	private String  name27;//课程名称27
	private String  name28;//课程名称28
	private String  name29;//课程名称29
	private String  name30;//课程名称30
	private String  name31;//课程名称31
	private String  name32;//课程名称32
	private String  name33;//课程名称33
	private String  name34;//课程名称34
	private String  name35;//课程名称35
	private String  name36;//课程名称36
	private String  name37;//课程名称37
	private String  name38;//课程名称38
	private String  name39;//课程名称39
	private String  name40;//课程名称40
	
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
	@JoinColumn(name="classroomId")
	public ClassRoom getClassRoom() {
		return classRoom;
	}
	public void setClassRoom(ClassRoom classRoom) {
		this.classRoom = classRoom;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getName3() {
		return name3;
	}
	public void setName3(String name3) {
		this.name3 = name3;
	}
	public String getName4() {
		return name4;
	}
	public void setName4(String name4) {
		this.name4 = name4;
	}
	public String getName5() {
		return name5;
	}
	public void setName5(String name5) {
		this.name5 = name5;
	}
	public String getName6() {
		return name6;
	}
	public void setName6(String name6) {
		this.name6 = name6;
	}
	public String getName7() {
		return name7;
	}
	public void setName7(String name7) {
		this.name7 = name7;
	}
	public String getName8() {
		return name8;
	}
	public void setName8(String name8) {
		this.name8 = name8;
	}
	public String getName9() {
		return name9;
	}
	public void setName9(String name9) {
		this.name9 = name9;
	}
	public String getName10() {
		return name10;
	}
	public void setName10(String name10) {
		this.name10 = name10;
	}
	public String getName11() {
		return name11;
	}
	public void setName11(String name11) {
		this.name11 = name11;
	}
	public String getName12() {
		return name12;
	}
	public void setName12(String name12) {
		this.name12 = name12;
	}
	public String getName13() {
		return name13;
	}
	public void setName13(String name13) {
		this.name13 = name13;
	}
	public String getName14() {
		return name14;
	}
	public void setName14(String name14) {
		this.name14 = name14;
	}
	public String getName15() {
		return name15;
	}
	public void setName15(String name15) {
		this.name15 = name15;
	}
	public String getName16() {
		return name16;
	}
	public void setName16(String name16) {
		this.name16 = name16;
	}
	public String getName17() {
		return name17;
	}
	public void setName17(String name17) {
		this.name17 = name17;
	}
	public String getName18() {
		return name18;
	}
	public void setName18(String name18) {
		this.name18 = name18;
	}
	public String getName19() {
		return name19;
	}
	public void setName19(String name19) {
		this.name19 = name19;
	}
	public String getName20() {
		return name20;
	}
	public void setName20(String name20) {
		this.name20 = name20;
	}
	public String getName21() {
		return name21;
	}
	public void setName21(String name21) {
		this.name21 = name21;
	}
	public String getName22() {
		return name22;
	}
	public void setName22(String name22) {
		this.name22 = name22;
	}
	public String getName23() {
		return name23;
	}
	public void setName23(String name23) {
		this.name23 = name23;
	}
	public String getName24() {
		return name24;
	}
	public void setName24(String name24) {
		this.name24 = name24;
	}
	public String getName25() {
		return name25;
	}
	public void setName25(String name25) {
		this.name25 = name25;
	}
	public String getName26() {
		return name26;
	}
	public void setName26(String name26) {
		this.name26 = name26;
	}
	public String getName27() {
		return name27;
	}
	public void setName27(String name27) {
		this.name27 = name27;
	}
	public String getName28() {
		return name28;
	}
	public void setName28(String name28) {
		this.name28 = name28;
	}
	public String getName29() {
		return name29;
	}
	public void setName29(String name29) {
		this.name29 = name29;
	}
	public String getName30() {
		return name30;
	}
	public void setName30(String name30) {
		this.name30 = name30;
	}
	public String getName31() {
		return name31;
	}
	public void setName31(String name31) {
		this.name31 = name31;
	}
	public String getName32() {
		return name32;
	}
	public void setName32(String name32) {
		this.name32 = name32;
	}
	public String getName33() {
		return name33;
	}
	public void setName33(String name33) {
		this.name33 = name33;
	}
	public String getName34() {
		return name34;
	}
	public void setName34(String name34) {
		this.name34 = name34;
	}
	public String getName35() {
		return name35;
	}
	public void setName35(String name35) {
		this.name35 = name35;
	}
	public String getName36() {
		return name36;
	}
	public void setName36(String name36) {
		this.name36 = name36;
	}
	public String getName37() {
		return name37;
	}
	public void setName37(String name37) {
		this.name37 = name37;
	}
	public String getName38() {
		return name38;
	}
	public void setName38(String name38) {
		this.name38 = name38;
	}
	public String getName39() {
		return name39;
	}
	public void setName39(String name39) {
		this.name39 = name39;
	}
	public String getName40() {
		return name40;
	}
	public void setName40(String name40) {
		this.name40 = name40;
	}
	

	

}
