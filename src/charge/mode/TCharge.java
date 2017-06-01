package charge.mode;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import user.mode.TUser;

/**
 * TCharge entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_charge", catalog = "gameplatform")
public class TCharge implements java.io.Serializable {

	// Fields

	private Integer chargeUserId;
	private TUser TUser;
	private Double chargeMoneyTotal;
	private Double chargeMoneyNow;

	// Constructors

	/** default constructor */
	public TCharge() {
	}

	/** full constructor */
	public TCharge(Integer chargeUserId, TUser TUser, Double chargeMoneyTotal,
			Double chargeMoneyNow) {
		this.chargeUserId = chargeUserId;
		this.TUser = TUser;
		this.chargeMoneyTotal = chargeMoneyTotal;
		this.chargeMoneyNow = chargeMoneyNow;
	}

	// Property accessors
	@Id
	@Column(name = "chargeUserId", unique = true, nullable = false)
	public Integer getChargeUserId() {
		return this.chargeUserId;
	}

	public void setChargeUserId(Integer chargeUserId) {
		this.chargeUserId = chargeUserId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "chargeUserId", unique = true, nullable = false, insertable = false, updatable = false)
	public TUser getTUser() {
		return this.TUser;
	}

	public void setTUser(TUser TUser) {
		this.TUser = TUser;
	}

	@Column(name = "chargeMoneyTotal", nullable = false, precision = 10)
	public Double getChargeMoneyTotal() {
		return this.chargeMoneyTotal;
	}

	public void setChargeMoneyTotal(Double chargeMoneyTotal) {
		this.chargeMoneyTotal = chargeMoneyTotal;
	}

	@Column(name = "chargeMoneyNow", nullable = false, precision = 10)
	public Double getChargeMoneyNow() {
		return this.chargeMoneyNow;
	}

	public void setChargeMoneyNow(Double chargeMoneyNow) {
		this.chargeMoneyNow = chargeMoneyNow;
	}

}