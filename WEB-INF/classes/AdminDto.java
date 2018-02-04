public class AdminDto{
	private String fullName;
	private String address;
	private String phone;
	private String email;
	private String userName;
	private String password;

	public void setFullName(String fullName){
		this.fullName = fullName;
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