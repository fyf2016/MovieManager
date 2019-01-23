package com.dao.impl;

import com.dao.UserDao;
import com.entity.User;
import com.util.JDBCTemplate;
import com.util.rowMapper.UserRowMapper;

public class UserDaoImpl implements UserDao {

	private static final String ADD_USER = "insert into user (name,password,email,role) values (?,?,?,?)";
	private static final String QUERY_NAME_PASSWORD = "select * from User where name=? and password=?";

	@Override
	public User queryByNameAndPass(User user) {
		JDBCTemplate<User> jdbcTemplate = new JDBCTemplate<User>();

		User queryUser = jdbcTemplate.queryForObject(QUERY_NAME_PASSWORD, new UserRowMapper(), user.getName(),user.getPassword());
		return queryUser;
	}

	@Override
	public boolean register(User user) {
		JDBCTemplate<User> jdbcTemplate = new JDBCTemplate<User>();
		boolean update = jdbcTemplate.update(ADD_USER, user.getName(),user.getPassword(),user.getEmail(),user.getRole());
		return update;
	}

}
