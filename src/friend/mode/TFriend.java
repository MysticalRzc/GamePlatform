package friend.mode;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import user.mode.TUser;

/**
 * TFriend entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_friend", catalog = "gameplatform")
public class TFriend implements java.io.Serializable {

	// Fields

	private Integer friendId;
	private TUser TUserByUserFriendId;
	private TUser TUserByUserId;

	// Constructors

	/** default constructor */
	public TFriend() {
	}

	/** full constructor */
	public TFriend(TUser TUserByUserFriendId, TUser TUserByUserId) {
		this.TUserByUserFriendId = TUserByUserFriendId;
		this.TUserByUserId = TUserByUserId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "friendId", unique = true, nullable = false)
	public Integer getFriendId() {
		return this.friendId;
	}

	public void setFriendId(Integer friendId) {
		this.friendId = friendId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userFriendId", nullable = false)
	public TUser getTUserByUserFriendId() {
		return this.TUserByUserFriendId;
	}

	public void setTUserByUserFriendId(TUser TUserByUserFriendId) {
		this.TUserByUserFriendId = TUserByUserFriendId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	public TUser getTUserByUserId() {
		return this.TUserByUserId;
	}

	public void setTUserByUserId(TUser TUserByUserId) {
		this.TUserByUserId = TUserByUserId;
	}

}