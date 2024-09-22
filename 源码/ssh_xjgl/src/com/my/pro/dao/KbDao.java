package com.my.pro.dao;
/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年04月22日 18时17分09秒
 */
import com.my.pro.utils.Pager;
import com.my.pro.base.BaseDao;
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


public interface KbDao extends BaseDao<Kb>{
	
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	Pager<Kb> findPager(Kb kb);
}
