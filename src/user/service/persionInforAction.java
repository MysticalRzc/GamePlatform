package user.service;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import user.dao.TUserDAO;
import user.mode.TUser;

import com.opensymphony.xwork2.ActionSupport;

public class persionInforAction extends ActionSupport implements SessionAware{
	private Map<String,Object> session;
	private TUser user;
	
	
	public String execute() throws Exception {
		user = (TUser) session.get("user");
		if(user == null)
			return "unLogin";
		System.out.println(user.getUserName());
		System.out.println(user.getUserType());
		return "success";
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public TUser getUser() {
		return user;
	}

	public void setUser(TUser user) {
		this.user = user;
	}
}
