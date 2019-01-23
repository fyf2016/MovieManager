package com.service;

import com.entity.User;

public interface UserService {
	public abstract User login(User user);
	public abstract boolean register(User user);
}
