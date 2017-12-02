public class UserDto{
	private String fullName;
	private String bloodGroup;
	private String sex;
	private String dob;
	private String address;
	private String phone;
	private String email;
	private String userName;
	private String password;

	public void setFullName(String fullName){
		this.fullName = fullName;
	}
	public void setBloodGroup(String bloodGroup){
		this.bloodGroup = bloodGroup;
	}
	public void setSex(String sex){
		this.sex = sex;
	}
	public void setDob(String dob){
		this.dob = dob ;
	}
	public void setAddress(String address ){
		this.address = address;
	}
	public void setPhone(String phone){
		this.phone = phone;
	}
	public void setEmail(String email){
		this.email = email;
	}
	public void setUserName(String userName){
		this.userName = userName;
	}
	public void setPassword(String password){
		this.password = password;
	}

	
	public String getFullName(){
		return fullName;
	}
	public String getBloodGroup(){
		return bloodGroup;
	}
	public String getSex(){
		return sex;
	}
	public String getDob(){
		return dob;
	}
	public String getAddress(){
		return address ;
	}
	public String getPhone(){
		return phone;
	}
	public String getEmail(){
		return email;
	}
	public String getUserName(){
		return userName;
	}
	public String getPassword(){
		return password;
	}
}