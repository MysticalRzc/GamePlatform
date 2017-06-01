package combat.service;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import user.mode.TUser;

import com.opensymphony.xwork2.ActionSupport;
import combat.dao.TCombatDAO;
import combat.mode.TCombat;

public class combatAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private List<TCombat> combatList;
	private TUser user;
	private int firstPage;
	
	public String execute() throws Exception {
		System.out.println("combatActionMain is running!");

		TCombatDAO combatDao = new TCombatDAO();
		user =  (TUser)session.get("user");
		System.out.println("firstPage"+firstPage);
		if(user!=null)
		{
			if(user.getUserType()==2)
				combatList = combatDao.findAllPage(firstPage);
			else
				combatList = combatDao.findByTUserPage(user,firstPage);
			System.out.println(combatList.size());
			return "success";
		}
		return "unLogin";
	}
	
	
	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}


	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<TCombat> getCombatList() {
		return combatList;
	}

	public void setCombatList(List<TCombat> combatList) {
		this.combatList = combatList;
	}

	public TUser getUser() {
		return user;
	}

	public void setUser(TUser user) {
		this.user = user;
	}
	
}
