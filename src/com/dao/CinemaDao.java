package com.dao;

import java.util.List;

import com.entity.Cinema;
import com.entity.Page;

public interface CinemaDao {
	public abstract List<Cinema> queryAll();
	public abstract List<Cinema> queryCinemaByPage(Page page);
	public abstract Cinema queryCinemaById(int cinemaId);
	
}
