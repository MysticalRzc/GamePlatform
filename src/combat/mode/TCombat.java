package combat.mode;

import static javax.persistence.GenerationType.IDENTITY;
import game.mode.TGame;

import java.sql.Timestamp;

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
 * TCombat entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_combat", catalog = "gameplatform")
public class TCombat implements java.io.Serializable {

	// Fields

	private Integer combatId;
	private TUser TUser;
	private TGame TGame;
	private String combateResult;
	private Timestamp combateTime;
	private String combateScore;

	// Constructors

	/** default constructor */
	public TCombat() {
	}

	/** minimal constructor */
	public TCombat(TUser TUser, TGame TGame, String combateResult) {
		this.TUser = TUser;
		this.TGame = TGame;
		this.combateResult = combateResult;
	}

	/** full constructor */
	public TCombat(TUser TUser, TGame TGame, String combateResult,
			Timestamp combateTime, String combateScore) {
		this.TUser = TUser;
		this.TGame = TGame;
		this.combateResult = combateResult;
		this.combateTime = combateTime;
		this.combateScore = combateScore;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "combatId", unique = true, nullable = false)
	public Integer getCombatId() {
		return this.combatId;
	}

	public void setCombatId(Integer combatId) {
		this.combatId = combatId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "combateUserId", nullable = false)
	public TUser getTUser() {
		return this.TUser;
	}

	public void setTUser(TUser TUser) {
		this.TUser = TUser;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "combatGameId", nullable = false)
	public TGame getTGame() {
		return this.TGame;
	}

	public void setTGame(TGame TGame) {
		this.TGame = TGame;
	}

	@Column(name = "combateResult", nullable = false, length = 10)
	public String getCombateResult() {
		return this.combateResult;
	}

	public void setCombateResult(String combateResult) {
		this.combateResult = combateResult;
	}

	@Column(name = "combateTime", length = 0)
	public Timestamp getCombateTime() {
		return this.combateTime;
	}

	public void setCombateTime(Timestamp combateTime) {
		this.combateTime = combateTime;
	}

	@Column(name = "combateScore", length = 10)
	public String getCombateScore() {
		return this.combateScore;
	}

	public void setCombateScore(String combateScore) {
		this.combateScore = combateScore;
	}

}