package com.my.pro.dao.impl;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年04月22日 18时17分09秒
 */
import org.springframework.stereotype.Repository;
import com.my.pro.model.ClassRoom;
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
 * @date 2015年12月24日 下午1:46:33 - 2017年04月22日 18时17分09秒
 */

@Repository
public class ClassRoomDaoImpl extends BaseDaoImpl<ClassRoom> implements ClassRoomDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<ClassRoom> findPager(ClassRoom classRoom) {
		if(classRoom.getId() !=null && !"".equals(classRoom.getId() )){
	    	   String hql = "from ClassRoom";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +classRoom.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from ClassRoom where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}
	
}
