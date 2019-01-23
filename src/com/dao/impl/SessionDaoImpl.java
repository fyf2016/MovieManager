package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.dao.SessionDao;
import com.entity.SeatUtil;
import com.util.JDBCUtil;

public class SessionDaoImpl implements SessionDao {

	@Override
	public List<SeatUtil> queryMovieSession(SeatUtil seatUtil) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<SeatUtil> resultList = new ArrayList();
		try{
			conn = JDBCUtil.getConnection();
			String sql = "select session.session_id,hall.hall_id,`session`.date,`session`.startTime,`session`.price,hall.`name`"+" "+
					"from cinema,`session`,hall WHERE cinema.cinema_id = ? and `session`.movie_id = ? and cinema.cinema_id = `session`.cinema_id"
					+" "+"and cinema.cinema_id = hall.cinema_id and `session`.hall_id = hall.hall_id";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, seatUtil.getCinema_Id());
			ps.setInt(2, seatUtil.getMovie_Id());
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				SeatUtil s = new SeatUtil();
				s.setSession_Id(rs.getInt("session_id"));
				s.setHall_Id(rs.getInt("hall_id"));
				s.setDate(rs.getDate("date"));
				s.setTime(rs.getTime("startTime"));
				s.setPrice(rs.getDouble("price"));
				s.setHallName(rs.getString("name"));
				resultList.add(s);
			}
			return resultList;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.close(rs, ps, null);
		}
		
	}
	

}
