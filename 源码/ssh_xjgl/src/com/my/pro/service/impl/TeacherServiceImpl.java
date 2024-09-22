/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年04月22日 18时17分10秒
 */
package com.my.pro.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.my.pro.model.Teacher;
import com.my.pro.utils.Pager;
import com.my.pro.service.TeacherService;
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

@Service("teacherServiceImpl")
public class TeacherServiceImpl extends BaseServiceImpl<Teacher> implements TeacherService{
	 
	@Autowired
	private TeacherDao teacherDao;
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	@Override
	public Pager<Teacher> findPager(Teacher teacher) {
		return teacherDao.findPager(teacher);
	}
	

	

}
