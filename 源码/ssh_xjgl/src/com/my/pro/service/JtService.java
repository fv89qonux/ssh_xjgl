package com.my.pro.service;

import com.my.pro.model.Jt;
import com.my.pro.utils.Pager;
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
public interface JtService extends BaseService<Jt>{

	/**
	 * dao层分页查询
	 */
	Pager<Jt> findPager(Jt jt);
}
