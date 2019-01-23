package com.entity;

import java.sql.Time;
import java.util.Date;

public class SeatUtil {
	private int movie_Id;
	private int cinema_Id;
	private int session_Id;
	private int hall_Id;
	private double price;
	private Date date;
	private Time time;
	private String hallName;
	private String sessionPrice;
	
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getMovie_Id() {
		return movie_Id;
	}
	public void setMovie_Id(int movie_Id) {
		this.movie_Id = movie_Id;
	}
	public int getCinema_Id() {
		return cinema_Id;
	}
	public void setCinema_Id(int cinema_Id) {
		this.cinema_Id = cinema_Id;
	}
	public int getSession_Id() {
		return session_Id;
	}
	public void setSession_Id(int sessionId) {
		this.session_Id = sessionId;
	}
	public int getHall_Id() {
		return hall_Id;
	}
	public void setHall_Id(int hall_Id) {
		this.hall_Id = hall_Id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	public String getHallName() {
		return hallName;
	}
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}
	public String getSessionPrice() {
		return sessionPrice;
	}
	public void setSessionPrice(String sessionPrice) {
		this.sessionPrice = sessionPrice;
	}
	
	
	
}
