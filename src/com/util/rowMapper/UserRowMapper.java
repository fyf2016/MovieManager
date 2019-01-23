package com.util.rowMapper;



import java.sql.ResultSet;

import com.entity.User;


public class UserRowMapper implements RowMapper<User> {
	
	@Override
	public User rowMap(ResultSet rs) {
		User user = new User();
		try {
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setPassword(rs.getString(3));
			user.setEmail(rs.getString(4));
			user.setRole(rs.getInt(5));
			user.setHeadImg(rs.getString(6));
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return user;
	}

	
}
