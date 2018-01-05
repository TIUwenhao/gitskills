package com.tiu.entity;

public class User {
	private String userName;
	private String userID;
	private int age;
	private String sex;
	private String birthdate;
	private String Address;
	
	public User(){
		
	}
	
	public User(String userName,String userID,int age,String sex,String birthdate,String Address){
		this.userID=userID;
		this.userName=userName;
		this.age = age;
		this.birthdate =  birthdate;
		this.sex = sex;
		
	}
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}

	@Override
	public String toString() {
		return "User [userName=" + userName + ", userID=" + userID + ", age=" + age + ", sex=" + sex + ", birthdate="
				+ birthdate + ", Address=" + Address + "]";
	}
	
	
	
}
