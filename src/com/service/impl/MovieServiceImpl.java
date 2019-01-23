package com.service.impl;

import java.util.List;

import com.dao.MovieDao;
import com.dao.impl.MovieDaoImpl;
import com.entity.Movie;
import com.service.MovieService;
import com.util.TransactionManager;

public class MovieServiceImpl implements MovieService {
	private MovieDao movieDao = new MovieDaoImpl();
	@Override
	public List<Movie> queryAllMovies() {
		try {
			TransactionManager.begin();
			List<Movie> movies = movieDao.queryAll();
			TransactionManager.commit();
			return movies;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return null;
		}
		
	}
	@Override
	public Movie findMovieById(int id) {
		
		try {
			TransactionManager.begin();
			Movie queryMovie = movieDao.queryById(id);
			TransactionManager.commit();
			return queryMovie;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return null;
		} 
		
	}
	@Override
	public List<Movie> queryMoviesByOrder(String order) {
		try {
			TransactionManager.begin();
			List<Movie> movies = movieDao.queryByOrder(order);
			TransactionManager.commit();
			return movies;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return null;
		}
	}
	@Override
	public boolean modifyMovie(Movie movie) {
		try {
			TransactionManager.begin();
			boolean modifyMovie = movieDao.modifyMovie(movie);
			TransactionManager.commit();
			return modifyMovie;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return false;
		}
	}
	@Override
	public boolean deleteMovie(int id) {
		try {
			TransactionManager.begin();
			boolean deleteMovie = movieDao.deleteMovie(id);
			TransactionManager.commit();
			return deleteMovie;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return false;
		}
		
	}
	@Override
	public boolean addMovie(Movie movie) {
		try {
			TransactionManager.begin();
			boolean addMovie = movieDao.addMovie(movie);
			TransactionManager.commit();
			return addMovie;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return false;
		}
	}
	@Override
	public List<Movie> queryMovieByType(String type, String order) {
		try {
			TransactionManager.begin();
			List<Movie> queryMovieByType = movieDao.queryMovieByType(type, order);
			TransactionManager.commit();
			return queryMovieByType;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return null;
		}
	}
	
	

}
