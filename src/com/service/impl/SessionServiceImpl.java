package com.service.impl;

import java.util.List;

import com.dao.SessionDao;
import com.dao.impl.SessionDaoImpl;
import com.entity.SeatUtil;
import com.service.SessionService;
import com.util.TransactionManager;

public class SessionServiceImpl implements SessionService {
	private SessionDao sessionDao = new SessionDaoImpl();
	@Override
	public List<SeatUtil> queryMovieSession(SeatUtil seatUtil) {
		try{
			TransactionManager.begin();
			List<SeatUtil> queryMovieSession = sessionDao.queryMovieSession(seatUtil);
			TransactionManager.commit();
			return queryMovieSession;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return null;
		}
	}

}
