package com.my.pro.dao.impl;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年04月22日 18时17分10秒
 */
import org.springframework.stereotype.Repository;
import com.my.pro.model.Teacher;
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
public class TeacherDaoImpl extends BaseDaoImpl<Teacher> implements TeacherDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<Teacher> findPager(Teacher teacher) {
		if(teacher.getId() !=null && !"".equals(teacher.getId() )){
	    	   String hql = "from Teacher";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +teacher.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from Teacher where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}
	
}
