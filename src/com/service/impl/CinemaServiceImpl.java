package com.service.impl;

import java.util.List;

import com.dao.CinemaDao;
import com.dao.impl.CinemaDaoImpl;
import com.entity.Cinema;
import com.entity.Page;
import com.service.CinemaService;
import com.util.TransactionManager;



public class CinemaServiceImpl implements CinemaService {
	private CinemaDao cinemaDao = new CinemaDaoImpl();
	@Override
	public List<Cinema> queryAllCinemas() {
		try{
			TransactionManager.begin();
			List<Cinema> AllCinemas = cinemaDao.queryAll();
			TransactionManager.commit();
			return AllCinemas;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return null;
		}
		
	}
	@Override
	public List<Cinema> findCinemaByPage(Page page) {
		try{
			TransactionManager.begin();
			List<Cinema> PageCinemas = cinemaDao.queryCinemaByPage(page);

			TransactionManager.commit();
			return PageCinemas;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return null;
		}
	}
	@Override
	public Cinema queryCinemaById(int cinemaId) {
		try{
			TransactionManager.begin();
			Cinema queryCinemaById = cinemaDao.queryCinemaById(cinemaId);
			TransactionManager.commit();
			return queryCinemaById;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return null;
		}
	}
	
	
}
