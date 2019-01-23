package com.dao;

import com.entity.User;

public interface UserDao {
	public abstract User queryByNameAndPass(User user);
	public abstract boolean register(User user);
}
