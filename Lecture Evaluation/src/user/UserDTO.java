package user;

public class UserDTO {
	
	private String userID;
	private String userPassword;
	private String userEmail;
	private String userEmailHash;
	private boolean userEmailChecked;
	/**
	 * @return userID
	 */
	public String getUserID() {
		return userID;
	}
	/**
	 * @param userID セットする userID
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}
	/**
	 * @return userPassword
	 */
	public String getUserPassword() {
		return userPassword;
	}
	/**
	 * @param userPassword セットする userPassword
	 */
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	/**
	 * @return userEmail
	 */
	public String getUserEmail() {
		return userEmail;
	}
	/**
	 * @param userEmail セットする userEmail
	 */
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	/**
	 * @return userEmailHash
	 */
	public String getUserEmailHash() {
		return userEmailHash;
	}
	/**
	 * @param userEmailHash セットする userEmailHash
	 */
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}
	/**
	 * @return userEmailChecked
	 */
	public boolean isUserEmailChecked() {
		return userEmailChecked;
	}
	/**
	 * @param userEmailChecked セットする userEmailChecked
	 */
	public void setUserEmailChecked(boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	
	
	public UserDTO() {
		
	}
	
	
	/**
	 * @param userID
	 * @param userPassword
	 * @param userEmail
	 * @param userEmailHash
	 * @param userEmailChecked
	 */
	public UserDTO(String userID, String userPassword, String userEmail, String userEmailHash,
			boolean userEmailChecked) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		this.userEmailChecked = userEmailChecked;
	}
	
	
}
