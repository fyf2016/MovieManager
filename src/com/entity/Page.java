package com.entity;

public class Page {
	private int pageIndex;
	private int pageSize;
	private int totalRecord;
	
	public int getTotalPage(){
		double page = Math.ceil(totalRecord/pageSize);
		return (int)page;
		
	}
	
	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}


	public Page(int pageIndex) {
		this(pageIndex,3);
	}
	
	public Page(int pageIndex, int pigeSize) {
		this.pageIndex = pageIndex;
		this.pageSize = pigeSize;
	}
	
	public int getFirstResult() {
		return (this.pageIndex)*this.pageSize;
	}
	
	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return	pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
	
}
