package friend.service;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import relate.dao.TRelateDAO;
import relate.mode.TRelate;
import user.dao.TUserDAO;
import user.mode.TUser;

import com.opensymphony.xwork2.ActionSupport;

import friend.dao.TFriendDAO;
import friend.mode.TFriend;

public class friendSearch extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private String name;
	private List<TFriend> friendList;
	private List<TRelate> relateList;
	private List<TUser> userList;
	private TUser user;
	private int friendId;
	private int relateId;
	private int userId;
	private String userName;
	private String mes;

	public String friendInfor() throws Exception {
		TRelateDAO relateDao = new TRelateDAO();
		TUserDAO userDao = new TUserDAO();
		user = userDao.findById(friendId);
		relateList = relateDao.findByUserId(user);
		System.out.println(relateList.size());
		return "successToFriend";
	}

	public String deleteFriend() throws Exception {
		System.out.println("deleteFriend is running");
		TFriendDAO friendDao = new TFriendDAO();
		TFriend fri = new TFriend();
		fri = friendDao.findById(friendId);
		friendDao.delete(fri);
		return "deleteSuccess";
	}
	public String addFriend()throws Exception{
		TFriendDAO friendDao = new TFriendDAO();
		TUserDAO userDao = new TUserDAO();
		TFriend friend = new TFriend();
		user = (TUser)session.get("user");
		friend.setTUserByUserId(user);
		user = userDao.findById(userId);
		friend.setTUserByUserFriendId(user);
		friendDao.save(friend);
		return "successAddFriend";
	}
	
	public String toAddFriend() throws Exception {
		mes="";
		if(userName!=null)
		{
			TUserDAO userDao = new TUserDAO();
			userList = userDao.findByUserName(userName);
			if(userList.size()<1)
				mes="Î´ÕÒµ½ÓÃ»§";
			else
				mes="";
		}
		System.out.println("toAddFriend is running!");
		if(userList != null)
			System.out.println(userList.size());		
		System.out.println(mes);
		return "addFriend";
	}

	public String execute() throws Exception {
		TUser user = (TUser) session.get("user");
		if (user == null) {
			return "unLogin";
		}
		TFriendDAO friendDao = new TFriendDAO();
		friendList = friendDao.findByUserName(user);
		System.out.println(friendList.size());

		System.out.println("friendSearch main is running!");
		return "success";
	}

	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getMes() {
		return mes;
	}

	public void setMes(String mes) {
		this.mes = mes;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<TUser> getUserList() {
		return userList;
	}

	public void setUserList(List<TUser> userList) {
		this.userList = userList;
	}

	public TUser getUser() {
		return user;
	}

	public void setUser(TUser user) {
		this.user = user;
	}

	public int getFriendId() {
		return friendId;
	}

	public void setFriendId(int friendId) {
		this.friendId = friendId;
	}

	public List<TFriend> getFriendList() {
		return friendList;
	}

	public void setFriendList(List<TFriend> friendList) {
		this.friendList = friendList;
	}

	public List<TRelate> getRelateList() {
		return relateList;
	}

	public void setRelateList(List<TRelate> relateList) {
		this.relateList = relateList;
	}

	public int getRelateId() {
		return relateId;
	}

	public void setRelateId(int relateId) {
		this.relateId = relateId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
