package com.service;

import java.util.List;

import com.entity.Cinema;
import com.entity.Page;

public interface CinemaService {
	public abstract List<Cinema> queryAllCinemas();
	public abstract List<Cinema> findCinemaByPage(Page page);
	public abstract Cinema queryCinemaById(int cinemaId);
}
