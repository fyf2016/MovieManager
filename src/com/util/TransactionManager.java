package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TransactionManager {
	public static void begin()
	{
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public static void commit()
	{
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCUtil.close(null, ps, conn);
		}
	}
	
	public static void rollback()
	{
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = JDBCUtil.getConnection();
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			JDBCUtil.close(null, ps, conn);
		}
	}
	
	
}
