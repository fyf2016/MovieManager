package com.util.rowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.Cinema;
import com.entity.Movie;

public class CinemaRowMapper implements RowMapper<Cinema> {

	@Override
	public Cinema rowMap(ResultSet rs) {
		Cinema cinema = new Cinema();
		try {
			cinema.setId(rs.getInt(1));
			cinema.setName(rs.getString(2));
			cinema.setAddress(rs.getString(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cinema;	
	}

}
