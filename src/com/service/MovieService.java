package com.service;

import java.util.List;

import com.entity.Movie;

public interface MovieService {
	public abstract List<Movie> queryAllMovies();
	public abstract Movie findMovieById(int id);
	public abstract List<Movie> queryMoviesByOrder(String order);
	public abstract boolean modifyMovie(Movie movie);
	public abstract boolean deleteMovie(int id);
	public abstract boolean addMovie(Movie movie);
	public abstract List<Movie> queryMovieByType(String type,String order);
}
