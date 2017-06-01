package user.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import user.dao.TUserDAO;
import user.mode.TUser;

import com.opensymphony.xwork2.ActionSupport;
public class loginAction extends ActionSupport implements SessionAware{
	private Map<String,Object> session;
	private TUser user;
	private String mes;
	private List<TUser> userSearch;
	private TUserDAO userDao = new TUserDAO();
	public String execute() throws Exception {
		
		System.out.println(user.getUserName());
		System.out.println(user.getUserPassword());
		
		userSearch = userDao.findByUserName(user.getUserName());
		for (TUser item : userSearch) {
			System.out.println(item.getUserName()+" " + item.getUserPassword()+" "+ user.getUserPassword());
			if(item.getUserPassword().equals(user.getUserPassword()))
			{
				session.put("user", item);
				return "success";
			}
		}
		return "failed";
	}
	
	public String logout(){
		session.remove("user");
		System.out.println("logOutSuccess");
		return "success";
	}
	
	public String getMes() {
		return mes;
	}

	public void setMes(String mes) {
		this.mes = mes;
	}

	public TUser getUser() {
		return user;
	}

	public void setUser(TUser user) {
		this.user = user;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}