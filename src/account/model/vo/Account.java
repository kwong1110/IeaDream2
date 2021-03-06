package account.model.vo;

import java.sql.Date;

public class Account { 
	private int userNo;
	private int grade;
	private String id;
	private String password;
	private String gender;
	private String userName;
	private String phone;
	private String email;
	private Date birth;
	private String deleted;
	
	public Account() {}

	public Account(int userNo, int grade, String id, String password, String gender, String userName, String phone,
			String email, Date birth, String deleted) {
		this.userNo = userNo;
		this.grade = grade;
		this.id = id;
		this.password = password;
		this.gender = gender;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
		this.deleted = deleted;
	}

	public Account(int userNo, int grade, String id, String gender, String userName, String phone, String deleted) {
		this.userNo = userNo;
		this.grade = grade;
		this.id = id;
		this.gender = gender;
		this.userName = userName;
		this.phone = phone;
		this.deleted = deleted;
	}

	public Account(String id, String password, String userName, String phone, String email) {
		super();
		this.id = id;
		this.password = password;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
	}
	
	public Account(String id, String password, String gender, String userName, String phone, String email, Date birth) {
		super();
		this.id = id;
		this.password = password;
		this.gender = gender;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
	}
	
	public Account(String id, String password) {
		this.id = id;
		this.password = password;
	}

	public Account(int grade, String id, String password, String gender, String userName, String phone, String email,
			Date birth) {
		super();
		this.grade = grade;
		this.id = id;
		this.password = password;
		this.gender = gender;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
	}
	
//	public Account(String userName, String email) {
//		super();
//		this.userName = userName;
//		this.email = email;
//	}
	
	public Account(String id, String userName, String email) {
		super();
		this.id = id;
		this.userName = userName;
		this.email = email;
	}
/* 회원정보 수정(비밀번호 없이)*/
	public Account(String id, int grade, String email, String phone) {
		super();
		this.id = id;
		this.grade = grade;
		this.email = email;
		this.phone = phone;
	}
	

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	@Override
	public String toString() {
		return "Account [userNo=" + userNo + ", grade=" + grade + ", id=" + id + ", password=" + password + ", gender="
				+ gender + ", userName=" + userName + ", phone=" + phone + ", email=" + email + ", birth=" + birth
				+ ", deleted=" + deleted + "]";
	}
	
	
}
