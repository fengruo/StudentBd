package com.tom.pojo;

public class Major {
	private int m_id;
	private String m_name;
	private int d_id;
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int d_id) {
		this.d_id = d_id;
	}
	private String training_level;
	
	public String getTraining_level() {
		return training_level;
	}
	public void setTraining_level(String training_level) {
		this.training_level = training_level;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
}
