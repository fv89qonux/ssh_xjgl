/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年04月22日 18时17分09秒
 */
package com.my.pro.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.my.pro.model.Kb;
import com.my.pro.utils.Pager;
import com.my.pro.service.KbService;
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

@Service("kbServiceImpl")
public class KbServiceImpl extends BaseServiceImpl<Kb> implements KbService{
	 
	@Autowired
	private KbDao kbDao;
	/**
	 * dao分页查询
	 * @param user
	 * @return
	 */
	@Override
	public Pager<Kb> findPager(Kb kb) {
		return kbDao.findPager(kb);
	}
	

	

}
