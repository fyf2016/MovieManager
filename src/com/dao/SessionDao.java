package com.dao;

import java.util.List;

import com.entity.SeatUtil;

public interface SessionDao {
	public abstract List<SeatUtil> queryMovieSession(SeatUtil seatUtil);
}
