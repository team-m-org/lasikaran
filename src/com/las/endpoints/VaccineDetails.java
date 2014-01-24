package com.las.endpoints;

import javax.jdo.annotations.Extension;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class VaccineDetails {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	@Extension(vendorName="datanucleus", key="gae.encoded-pk", value="true")
	private long vacId;
	
	private String vacName;
	private String vacTemp;
	private String vacCompany;
	private String effctiveFor;
	private String startDay;
	private String endDay;
	
	public String getVacName() {
		return vacName;
	}
	public void setVacName(String vacName) {
		this.vacName = vacName;
	}
	public String getVacTemp() {
		return vacTemp;
	}
	public void setVacTemp(String vacTemp) {
		this.vacTemp = vacTemp;
	}
	
	public String getEffctiveFor() {
		return effctiveFor;
	}
	public void setEffctiveFor(String effctiveFor) {
		this.effctiveFor = effctiveFor;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	public String getVacCompany() {
		return vacCompany;
	}
	public void setVacCompany(String vacCompany) {
		this.vacCompany = vacCompany;
	}
	public long getVacId() {
		return vacId;
	}
	public void setVacId(long vacId) {
		this.vacId = vacId;
	}
	
}
