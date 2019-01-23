package com.service.impl;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.entity.User;
import com.service.UserService;
import com.util.TransactionManager;

public class UserServiceImpl implements UserService {
	private UserDao userDao = new UserDaoImpl();
	@Override
	public User login(User user) {
		try {
			TransactionManager.begin();
			User queryUser = userDao.queryByNameAndPass(user);
			TransactionManager.commit();
			return queryUser;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return null;
		}
	}
	
	@Override
	public boolean register(User user) {
		try {
			TransactionManager.begin();
			boolean register = userDao.register(user);
			TransactionManager.commit();
			return register;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return false;
		}
	}

}
