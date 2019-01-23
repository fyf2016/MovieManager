package com.entity;

import java.sql.Date;

public class Movie {
	private int id;
	private String name;
	private String staring;
	private String detail;
	private String duration;
	private String type;
	private double score;
	private String picture;
	private double boxOffice;
	private int commentsCount;
	private Date releaseDate;
	private int boxOfficeUnit;
	private String foreignName;
	private String releasePoint;
	private int commentsUnit;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStaring() {
		return staring;
	}
	public void setStaring(String staring) {
		this.staring = staring;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public double getBoxOffice() {
		return boxOffice;
	}
	public void setBoxOffice(double boxOffice) {
		this.boxOffice = boxOffice;
	}
	public int getCommentsCount() {
		return commentsCount;
	}
	public void setCommentsCount(int commentsCount) {
		this.commentsCount = commentsCount;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public int getBoxOfficeUnit() {
		return boxOfficeUnit;
	}
	public void setBoxOfficeUnit(int boxOfficeUnit) {
		this.boxOfficeUnit = boxOfficeUnit;
	}
	public String getForeignName() {
		return foreignName;
	}
	public void setForeignName(String foreignName) {
		this.foreignName = foreignName;
	}
	public String getReleasePoint() {
		return releasePoint;
	}
	public void setReleasePoint(String releasePoint) {
		this.releasePoint = releasePoint;
	}
	public int getCommentsUnit() {
		return commentsUnit;
	}
	public void setCommentsUnit(int commentsUnit) {
		this.commentsUnit = commentsUnit;
	}
	
	
		
	
}
