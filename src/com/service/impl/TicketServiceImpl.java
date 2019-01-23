package com.service.impl;

import java.util.List;

import com.dao.TicketDao;
import com.dao.impl.TicketDaoImpl;
import com.entity.SeatUtil;
import com.entity.Ticket;
import com.service.TicketService;
import com.util.TransactionManager;

public class TicketServiceImpl implements TicketService {
	private TicketDao ticketDao = new TicketDaoImpl();
	@Override
	public boolean addTicket(Ticket ticket) {
		try{
			TransactionManager.begin();
			boolean addTicket = ticketDao.addTicket(ticket);
			TransactionManager.commit();
			return addTicket;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return false;
		}
	}

}
