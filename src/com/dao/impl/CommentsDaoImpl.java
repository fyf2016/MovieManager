 package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.CommentsDao;
import com.entity.Cinema;
import com.entity.Comments;
import com.entity.CommentsUtil;
import com.util.JDBCTemplate;
import com.util.JDBCUtil;
import com.util.rowMapper.CommentsUtilRowMapper;

public class CommentsDaoImpl implements CommentsDao {

	private static final String SELECT_COMMENTS_AND_USER = "select `user`.`name`,comments.comments,comments.comments_id,user.user_id,user.headImg FROM `user`,comments where comments.movie_id = ? and comments.user_id = `user`.user_id";
	private static final String DELETE_COMMENTS = "delete from comments where comments_id=?";
	private static final String ADD_COMMENTS = "insert into comments (user_id,comments,movie_id) values(?,?,?)";

	@Override
	public List<CommentsUtil> queryThreeTableData(int id) {
		JDBCTemplate<CommentsUtil> jdbcTemplate = new JDBCTemplate<CommentsUtil>();
		List<CommentsUtil> allComments = jdbcTemplate.queryAll(SELECT_COMMENTS_AND_USER, new CommentsUtilRowMapper(), id);
		return allComments;
		
	}

	@Override
	public boolean addComments(Comments comments) {
		JDBCTemplate<Comments> jdbcTemplate = new JDBCTemplate<Comments>();
		boolean addComments = jdbcTemplate.update(ADD_COMMENTS, comments.getUser_id(),comments.getComments(),comments.getMovie_id());
		return addComments;
	}

	@Override
	public boolean deleteComments(int id) {
		JDBCTemplate<Comments> jdbcTemplate = new JDBCTemplate<Comments>();
		boolean deleteComments = jdbcTemplate.update(DELETE_COMMENTS, id);
		return deleteComments;
	}

	@Override
	public boolean updateComments(int id,String content) {
		JDBCTemplate<Comments> jdbcTemplate = new JDBCTemplate<Comments>();
		boolean updateComments = jdbcTemplate.update("update comments set comments=? where comments_id=?", content,id);
		return updateComments;
	}

}
