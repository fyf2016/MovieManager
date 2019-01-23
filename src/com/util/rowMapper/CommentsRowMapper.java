package com.util.rowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.Comments;

public class CommentsRowMapper implements RowMapper<Comments> {

	@Override
	public Comments rowMap(ResultSet rs) {
		Comments comments = new Comments();
		try {
			comments.setId(rs.getInt(1));
			comments.setComments(rs.getString(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return comments;	
	}

}
