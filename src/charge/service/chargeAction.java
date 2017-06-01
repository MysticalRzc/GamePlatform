package charge.service;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import user.dao.TUserDAO;
import user.mode.TUser;
import charge.dao.TChargeDAO;
import charge.mode.TCharge;

import com.opensymphony.xwork2.ActionSupport;

public class chargeAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private TCharge charge;
	private TUser user;
	private int chargeMoney;
	
	public String execute() throws Exception {
		
		System.out.println("chargeActionMain is running");
		
		TChargeDAO chargeDao = new TChargeDAO();
		user = (TUser)session.get("user");
		System.out.println(user==null);
		if(user != null)
		{
			charge = chargeDao.findById(user.getUserId());
			return "success";
		}
		return "unLogin";
	}

	public String chargeAdd() throws Exception{
		System.out.println("change is running");
		
		TChargeDAO chargeDao = new TChargeDAO();
		user = (TUser)session.get("user");
		
		if(chargeMoney>100 && user.getUserType()==0)
		{
			user.setUserType(1);
			TUserDAO userDao = new TUserDAO();
			userDao.update(user);
			session.put("user", user);
		}
		
		charge = chargeDao.findById(user.getUserId());
		charge.setChargeMoneyNow(chargeMoney+charge.getChargeMoneyNow());
		charge.setChargeMoneyTotal(chargeMoney+charge.getChargeMoneyTotal());
		chargeDao.update(charge);
		
		System.out.println(charge.getChargeMoneyTotal());
		System.out.println("charge is end");
		
		return "chargeSuccess";
	}
	
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public TCharge getCharge() {
		return charge;
	}

	public void setCharge(TCharge charge) {
		this.charge = charge;
	}

	public TUser getUser() {
		return user;
	}

	public void setUser(TUser user) {
		this.user = user;
	}

	public int getChargeMoney() {
		return chargeMoney;
	}

	public void setChargeMoney(int chargeMoney) {
		this.chargeMoney = chargeMoney;
	}
}
