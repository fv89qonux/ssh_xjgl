package com.my.pro.service;

import com.my.pro.model.TeacherClass;
import com.my.pro.utils.Pager;
import java.util.*;

import com.my.pro.model.*;
import com.my.pro.dao.*;
import com.my.pro.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2017年04月22日 18时17分10秒
 */
public interface TeacherClassService extends BaseService<TeacherClass>{

	/**
	 * dao层分页查询
	 */
	Pager<TeacherClass> findPager(TeacherClass teacherClass);
}
