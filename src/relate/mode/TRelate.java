package relate.mode;

import static javax.persistence.GenerationType.IDENTITY;
import game.mode.TGame;

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
 * TRelate entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_relate", catalog = "gameplatform")
public class TRelate implements java.io.Serializable {

	// Fields

	private Integer id;
	private TUser TUser;
	private TGame TGame;

	// Constructors

	/** default constructor */
	public TRelate() {
	}

	/** full constructor */
	public TRelate(TUser TUser, TGame TGame) {
		this.TUser = TUser;
		this.TGame = TGame;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	public TUser getTUser() {
		return this.TUser;
	}

	public void setTUser(TUser TUser) {
		this.TUser = TUser;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "gameId")
	public TGame getTGame() {
		return this.TGame;
	}

	public void setTGame(TGame TGame) {
		this.TGame = TGame;
	}

}