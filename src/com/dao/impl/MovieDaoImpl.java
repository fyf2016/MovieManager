package com.dao.impl;

import java.util.List;

import com.dao.MovieDao;
import com.entity.Movie;
import com.util.JDBCTemplate;
import com.util.rowMapper.MovieRowMapper;

public class MovieDaoImpl implements MovieDao {

	
	private static final String ADD_MOVIE = "insert into movie (name,picture,type,detail) values (?,?,?,?)";
	private static final String DELETE_MOVIE_BY_MOVIE_ID = "delete from movie where movie_id= ?";
	private static final String MODIFY_MOVIE = "update movie set name=?,picture=?,type=?,detail=? where movie_id=?";
	private static final String SELECT_BY_MOVIEID = "select * from movie where movie_id=?";
	private static final String SELECT_ALL_MOVIE = "select * from movie";

	@Override
	public List<Movie> queryAll() {
		JDBCTemplate<Movie> jdbcTemplate = new JDBCTemplate<Movie>();
		List<Movie> AllMovies = jdbcTemplate.queryAll(SELECT_ALL_MOVIE, new MovieRowMapper());
		return AllMovies;
	}

	@Override
	public Movie queryById(int id) {
		JDBCTemplate<Movie> jdbcTemplate = new JDBCTemplate<Movie>();
		Movie queryMovie = jdbcTemplate.queryForObject(SELECT_BY_MOVIEID, new MovieRowMapper(), id);
		return queryMovie;
	}

	@Override
	public List<Movie> queryByOrder(String order) {
		JDBCTemplate<Movie> jdbcTemplate = new JDBCTemplate<Movie>();
	
		String sql = "select * from movie order by "+order+" desc";
		List<Movie> AllMovies = jdbcTemplate.queryAll(sql, new MovieRowMapper());
		return AllMovies;
	}

	@Override
	public boolean modifyMovie(Movie movie) {
		JDBCTemplate<Movie> jdbcTemplate = new JDBCTemplate<Movie>();
		boolean modify = jdbcTemplate.update(MODIFY_MOVIE, movie.getName(),movie.getPicture(),movie.getType(),
				movie.getDetail(),movie.getId());
		return modify;
	}

	@Override
	public boolean deleteMovie(int id) {
		JDBCTemplate<Movie> jdbcTemplate = new JDBCTemplate<Movie>();
		boolean delete = jdbcTemplate.update(DELETE_MOVIE_BY_MOVIE_ID, id);
		return delete;
	}

	@Override
	public boolean addMovie(Movie movie) {
		JDBCTemplate<Movie> jdbcTemplate = new JDBCTemplate<Movie>();
		boolean add = jdbcTemplate.update(ADD_MOVIE, movie.getName(),movie.getPicture(),movie.getType(),movie.getDetail());
		return add;
	}

	@Override
	public List<Movie> queryMovieByType(String type, String order) {
		JDBCTemplate<Movie> jdbcTemplate = new JDBCTemplate<Movie>();
	
		String sql = "select * from movie where type like \"%"+type+"%\" order by "+order+" desc";
	
		List<Movie> AllMovies = jdbcTemplate.queryAll(sql, new MovieRowMapper());
		return AllMovies;
	}
	
	

}
