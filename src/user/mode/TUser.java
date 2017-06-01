package user.mode;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * TUser entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_user", catalog = "gameplatform")
public class TUser implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userName;
	private String userPassword;
	private Integer userType;
	private String userEmail;
	private String userPhone;
	private String userImage;
	private Date userBirth;
	private String userInfor;

	// Constructors

	/** default constructor */
	public TUser() {
	}

	/** minimal constructor */
	public TUser(String userName, String userPassword, Integer userType) {
		this.userName = userName;
		this.userPassword = userPassword;
		this.userType = userType;
	}

	/** full constructor */
	public TUser(String userName, String userPassword, Integer userType,
			String userEmail, String userPhone, String userImage,
			Date userBirth, String userInfor) {
		this.userName = userName;
		this.userPassword = userPassword;
		this.userType = userType;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userImage = userImage;
		this.userBirth = userBirth;
		this.userInfor = userInfor;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "userId", unique = true, nullable = false)
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "userName", nullable = false, length = 100)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "userPassword", nullable = false, length = 100)
	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	@Column(name = "userType", nullable = false)
	public Integer getUserType() {
		return this.userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	@Column(name = "userEmail", length = 100)
	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	@Column(name = "userPhone", length = 100)
	public String getUserPhone() {
		return this.userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	@Column(name = "userImage", length = 100)
	public String getUserImage() {
		return this.userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "userBirth", length = 0)
	public Date getUserBirth() {
		return this.userBirth;
	}

	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}

	@Column(name = "userInfor", length = 100)
	public String getUserInfor() {
		return this.userInfor;
	}

	public void setUserInfor(String userInfor) {
		this.userInfor = userInfor;
	}

}