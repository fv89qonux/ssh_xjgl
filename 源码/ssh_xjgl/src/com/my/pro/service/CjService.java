package com.my.pro.service;

import com.my.pro.model.Cj;
import com.my.pro.utils.Pager;
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
public interface CjService extends BaseService<Cj>{

	/**
	 * dao层分页查询
	 */
	Pager<Cj> findPager(Cj cj);
}
