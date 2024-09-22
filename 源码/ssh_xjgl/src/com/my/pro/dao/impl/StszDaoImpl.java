package com.my.pro.dao.impl;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年04月22日 18时17分10秒
 */
import org.springframework.stereotype.Repository;
import com.my.pro.model.Stsz;
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
public class StszDaoImpl extends BaseDaoImpl<Stsz> implements StszDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<Stsz> findPager(Stsz stsz) {
		if(stsz.getId() !=null && !"".equals(stsz.getId() )){
	    	   String hql = "from Stsz";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +stsz.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from Stsz where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}
	
}
