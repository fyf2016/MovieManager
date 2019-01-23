package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.CinemaDao;
import com.entity.Cinema;
import com.entity.Page;
import com.util.JDBCTemplate;
import com.util.JDBCUtil;
import com.util.rowMapper.CinemaRowMapper;

public class CinemaDaoImpl implements CinemaDao {

	private static final String SELECT_CINEMA_BY_ID = "select * from cinema where cinema_id=?";
	private static final String SELECT_ALL_CINEMA = "select * from cinema";

	@Override
	public List<Cinema> queryAll() {
		JDBCTemplate<Cinema> jdbcTemplate = new JDBCTemplate<Cinema>();
		List<Cinema> AllCinemas = jdbcTemplate.queryAll(SELECT_ALL_CINEMA, new CinemaRowMapper());
		return AllCinemas;
	}

	@Override
	public List<Cinema> queryCinemaByPage(Page page) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Cinema> cinemasList = new ArrayList<Cinema>();
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select cinema_id,name,address from cinema limit ?,?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, page.getFirstResult());
			ps.setInt(2, page.getPageSize());
			rs = ps.executeQuery();
			while(rs.next()) {
				Cinema cinema = new Cinema();
				cinema.setId(rs.getInt(1));
				cinema.setName(rs.getString(2));
				cinema.setAddress(rs.getString(3));
				cinemasList.add(cinema);	
			}
			return cinemasList;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.close(rs, ps, null);
		}
	}

	@Override
	public Cinema queryCinemaById(int cinemaId) {
		JDBCTemplate<Cinema> jdbcTemplate = new JDBCTemplate<Cinema>();
		Cinema queryCinema = jdbcTemplate.queryForObject(SELECT_CINEMA_BY_ID, new CinemaRowMapper(), cinemaId);
		return queryCinema;
	
	}

}
