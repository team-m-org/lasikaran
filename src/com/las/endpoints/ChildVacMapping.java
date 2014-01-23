package com.las.endpoints;

import java.util.Date;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class ChildVacMapping {
	@PrimaryKey
	private long mapId;
	private String childId;
	private String vaccinationId;
	private Date startDate;
	private Date endDate;
	
	public String getChildId() {
		return childId;
	}
	public void setChildId(String childId) {
		this.childId = childId;
	}
	public String getVaccinationId() {
		return vaccinationId;
	}
	public void setVaccinationId(String vaccinationId) {
		this.vaccinationId = vaccinationId;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public long getMapId() {
		return mapId;
	}
	public void setMapId(long mapId) {
		this.mapId = mapId;
	}
	
}
