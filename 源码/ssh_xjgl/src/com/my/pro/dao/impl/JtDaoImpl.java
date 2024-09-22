package com.my.pro.dao.impl;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年04月22日 18时29分45秒
 */
import org.springframework.stereotype.Repository;
import com.my.pro.model.Jt;
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
 * @date 2015年12月24日 下午1:46:33 - 2017年04月22日 18时29分45秒
 */

@Repository
public class JtDaoImpl extends BaseDaoImpl<Jt> implements JtDao{
	
 /**
  * 分页查询
  */
	@Override
	public Pager<Jt> findPager(Jt jt) {
		if(jt.getId() !=null && !"".equals(jt.getId() )){
	    	   String hql = "from Jt";
	    	   Map<String,Object> alias = new HashMap<String,Object>();
	   		   alias.put("1", "%" +jt.getId()+ "%" );
	   		  return findByAlias(hql, alias);
	       }else{
	    	   String hql = "from Jt where 1=1 order by id desc ";
				return findByAlias(hql, null);
	       }
	}
	
}
