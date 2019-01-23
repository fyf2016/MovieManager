package com.service;

import java.util.List;

import com.entity.SeatUtil;

public interface SessionService {
	public abstract List<SeatUtil> queryMovieSession(SeatUtil seatUtil);
}
