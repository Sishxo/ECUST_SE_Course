package bean;

public class User {
	public int UserId;
	public String UserName;
	public String DialNumber;
	public String Email;
	public String Password;
	public String Gender;
	public String College;
	public String Major;
	public String Grade;
	public int IdentityID;
	public void setUserId(int id){
		this.UserId=id;
	}
	public int getUserId(){
		return UserId;
	}
	public void setUserName(String UserName){
		this.UserName=UserName;
	}
	public String getUserName(){
		return UserName;
	}
	public void setDialNumber(String DialNumber){
		this.DialNumber=DialNumber;
	}
	public String getDialNumber(){
		return DialNumber;
	}
	public void setEmail(String Email){
		this.Email=Email;
	}
	public String getEmail(){
		return Email;
	}
	public void setPassword(String Password){
		this.Password=Password;
	}
	public String getPassword(){
		return Password;
	}
	public String getCollege() {
		return College;
	}
	public void setCollege(String college) {
		this.College = college;
	}
	public String getMajor() {
		return Major;
	}
	public void setMajor(String major) {
		this.Major = major;
	}
	public String getGrade() {
		return Grade;
	}
	public void setGrade(String grade) {
		this.Grade = grade;
	}
	public int getIdentityID() {
		return IdentityID;
	}
	public void setIdentityID(int identityID) {
		this.IdentityID = identityID;
	}
	public void setGender(String Gender){
		this.Gender=Gender;
	}
	public String getGender(){
		return Gender;
	}
	
}
