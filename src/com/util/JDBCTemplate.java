package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.rowMapper.RowMapper;




public class JDBCTemplate <T>{
	public boolean update(String sql, Object...args) {
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = JDBCUtil.getConnection();
			ps = conn.prepareStatement(sql);
			if(hasUpdateParams(args)) {
				for(int i=0;i<args.length;i++) {
					ps.setObject(i+1, args[i]);
				}
			}
			ps.executeUpdate();
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			JDBCUtil.close(null, ps, null);
		}
	}
	
	public T queryForObject(String sql, RowMapper<T> rowMapper, Object...args) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		T ret = null;
		try {
			conn = JDBCUtil.getConnection();
			ps = conn.prepareStatement(sql);
			if(hasUpdateParams(args)) {
				for(int i = 0; i < args.length; i++) {
					ps.setObject(i+1, args[i]);
				}
			}
			rs = ps.executeQuery();
			while(rs.next()) {
				ret = rowMapper.rowMap(rs);
			}
			return ret;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.close(rs, ps, null);
		}
	}
	
	
	public List<T> queryAll(String sql, RowMapper<T> rowMapper, Object...args) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<T> lists = new ArrayList<T>();
		try{
			conn = JDBCUtil.getConnection();
			ps = conn.prepareStatement(sql);
			if(hasUpdateParams(args)) {
				for(int i=0;i<args.length;i++) {
					ps.setObject(i+1, args[i]);
				}
			}
			rs = ps.executeQuery();
			while(rs.next()) {
				T ret = rowMapper.rowMap(rs);
				lists.add(ret);
			}
			return lists;
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			JDBCUtil.close(rs, ps, null);
		}	
	}
	
	private boolean hasUpdateParams(Object... args) {
		return args.length!=0;
	}
	
}
