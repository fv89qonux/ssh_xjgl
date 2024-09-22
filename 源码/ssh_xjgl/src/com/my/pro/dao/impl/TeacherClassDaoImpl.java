package com.my.pro.dao.impl;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年04月22日 18时17分10秒
 */
import org.springframework.stereotype.Repository;
import com.my.pro.model.TeacherClass;
import com.my.pro.utils.Pager;
import com.my.pro.base.impl.BaseDaoImpl;
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

@Repository
public class TeacherClassDaoImpl extends BaseDaoImpl<TeacherClass> implements TeacherClassDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<TeacherClass> findPager(TeacherClass teacherClass) {
		if(teacherClass.getId() !=null && !"".equals(teacherClass.getId() )){
	    	   String hql = "from TeacherClass";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +teacherClass.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from TeacherClass where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}
	
}
