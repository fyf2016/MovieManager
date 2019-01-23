package com.util.rowMapper;

import java.sql.ResultSet;

import com.entity.CommentsUtil;

public class CommentsUtilRowMapper implements RowMapper<CommentsUtil> {

	@Override
	public CommentsUtil rowMap(ResultSet rs) {
		CommentsUtil cu = new CommentsUtil();
		try{
			cu.setUserName(rs.getString("name"));
			cu.setComments(rs.getString("comments"));
			cu.setId(rs.getInt("comments_id"));
			cu.setUser_Id(rs.getInt("user_id"));
			cu.setHeadImg(rs.getString("headImg"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return cu;
	}

}
