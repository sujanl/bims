public class BankDto{
	private String name;
	private String location;
	private String contact;
	private String email;

	public void setName(String name){
		this.name = name;
	}
	public void setLocation(String location){
		this.location = location;
	}
	public void setContact(String contact){
		this.contact = contact;
	}
	public void setEmail(String email){
		this.email = email;
	}

	public String getName(){
		return name;
	}
	public String getLocation(){
		return location;
	}
	public String getContact(){
		return contact;
	}
	public String getEmail(){
		return email;
	}
}