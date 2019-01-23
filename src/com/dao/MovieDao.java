package com.dao;

import java.util.List;

import com.entity.Movie;

public interface MovieDao {
	public abstract List<Movie> queryAll();
	public abstract Movie queryById(int id);
	public abstract List<Movie> queryByOrder(String order);
	public abstract boolean modifyMovie(Movie movie);
	public abstract boolean deleteMovie(int id);
	public abstract boolean addMovie(Movie movie);
	public abstract List<Movie> queryMovieByType(String type,String order);
}
