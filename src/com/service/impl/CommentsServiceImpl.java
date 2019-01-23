package com.service.impl;

import java.util.List;

import com.dao.CommentsDao;
import com.dao.impl.CommentsDaoImpl;
import com.entity.Cinema;
import com.entity.Comments;
import com.entity.CommentsUtil;
import com.service.CommentsService;
import com.util.TransactionManager;

public class CommentsServiceImpl implements CommentsService {
	private CommentsDao commentsDao = new CommentsDaoImpl();
	@Override
	public List<CommentsUtil> queryThreeTableData(int id) {
		try{
			TransactionManager.begin();
			List<CommentsUtil> queryThreeTableData = commentsDao.queryThreeTableData(id);
			TransactionManager.commit();
			return queryThreeTableData;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return null;
		}
		
	}
	@Override
	public boolean addComments(Comments comments) {
		try{
			TransactionManager.begin();
			boolean addComments = commentsDao.addComments(comments);
			TransactionManager.commit();
			return addComments;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return false;
		}
	}
	@Override
	public boolean deleteComments(int id) {
		try{
			TransactionManager.begin();
			boolean deleteComments = commentsDao.deleteComments(id);
			TransactionManager.commit();
			return deleteComments;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return false;
		}
	}
	@Override
	public boolean updateComments(int id, String content) {
		try{
			TransactionManager.begin();
			boolean updateComments = commentsDao.updateComments(id, content);
			TransactionManager.commit();
			return updateComments;
		} catch(Exception e) {
			e.printStackTrace();
			TransactionManager.rollback();
			return false;
		}
	}

}
