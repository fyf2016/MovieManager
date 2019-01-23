package com.util.rowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.Movie;

public class MovieRowMapper implements RowMapper<Movie> {

	@Override
	public Movie rowMap(ResultSet rs) {
		Movie movie = new Movie();
		try {
			movie.setId(rs.getInt(1));
			movie.setName(rs.getString(2));
			movie.setStaring(rs.getString(3));
			movie.setDetail(rs.getString(4));
			movie.setDuration(rs.getString(5));
			movie.setType(rs.getString(6));
			movie.setScore(rs.getDouble(7));
			movie.setPicture(rs.getString(8));
			movie.setBoxOffice(rs.getDouble(9));
			movie.setCommentsCount(rs.getInt(10));
			movie.setReleaseDate(rs.getDate(11));
			movie.setBoxOfficeUnit(rs.getInt(12));
			movie.setForeignName(rs.getString(13));
			movie.setReleasePoint(rs.getString(14));
			movie.setCommentsUnit(rs.getInt(15));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return movie;	
	}

}
