package game.mode;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import relate.mode.TRelate;

import combat.mode.TCombat;

/**
 * TGame entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_game", catalog = "gameplatform")
public class TGame implements java.io.Serializable {

	// Fields

	private Integer gameId;
	private String gameImage;
	private String gameIntroduc;
	private String gameName;
	private String gamePath;
	private String gameTitle;
	private Double gameVersion;
	private Double gameMoney;
	private Set<TRelate> TRelates = new HashSet<TRelate>(0);
	private Set<TCombat> TCombats = new HashSet<TCombat>(0);

	// Constructors

	/** default constructor */
	public TGame() {
	}

	/** full constructor */
	public TGame(String gameImage, String gameIntroduc, String gameName,
			String gamePath, String gameTitle, Double gameVersion,
			Double gameMoney, Set<TRelate> TRelates, Set<TCombat> TCombats) {
		this.gameImage = gameImage;
		this.gameIntroduc = gameIntroduc;
		this.gameName = gameName;
		this.gamePath = gamePath;
		this.gameTitle = gameTitle;
		this.gameVersion = gameVersion;
		this.gameMoney = gameMoney;
		this.TRelates = TRelates;
		this.TCombats = TCombats;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "gameId", unique = true, nullable = false)
	public Integer getGameId() {
		return this.gameId;
	}

	public void setGameId(Integer gameId) {
		this.gameId = gameId;
	}

	@Column(name = "gameImage", length = 50)
	public String getGameImage() {
		return this.gameImage;
	}

	public void setGameImage(String gameImage) {
		this.gameImage = gameImage;
	}

	@Column(name = "gameIntroduc", length = 100)
	public String getGameIntroduc() {
		return this.gameIntroduc;
	}

	public void setGameIntroduc(String gameIntroduc) {
		this.gameIntroduc = gameIntroduc;
	}

	@Column(name = "gameName", length = 30)
	public String getGameName() {
		return this.gameName;
	}

	public void setGameName(String gameName) {
		this.gameName = gameName;
	}

	@Column(name = "gamePath", length = 50)
	public String getGamePath() {
		return this.gamePath;
	}

	public void setGamePath(String gamePath) {
		this.gamePath = gamePath;
	}

	@Column(name = "gameTitle", length = 100)
	public String getGameTitle() {
		return this.gameTitle;
	}

	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}

	@Column(name = "gameVersion", precision = 2, scale = 0)
	public Double getGameVersion() {
		return this.gameVersion;
	}

	public void setGameVersion(Double gameVersion) {
		this.gameVersion = gameVersion;
	}

	@Column(name = "gameMoney", precision = 2, scale = 0)
	public Double getGameMoney() {
		return this.gameMoney;
	}

	public void setGameMoney(Double gameMoney) {
		this.gameMoney = gameMoney;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "TGame")
	public Set<TRelate> getTRelates() {
		return this.TRelates;
	}

	public void setTRelates(Set<TRelate> TRelates) {
		this.TRelates = TRelates;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "TGame")
	public Set<TCombat> getTCombats() {
		return this.TCombats;
	}

	public void setTCombats(Set<TCombat> TCombats) {
		this.TCombats = TCombats;
	}
}