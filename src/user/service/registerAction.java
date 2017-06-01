package user.service;

import java.io.File;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import user.dao.TUserDAO;
import user.mode.TUser;
import charge.dao.TChargeDAO;
import charge.mode.TCharge;

import com.opensymphony.xwork2.ActionSupport;

public class registerAction extends ActionSupport implements SessionAware {
	private TUser user;
	private Map<String, Object> session;
	private String hello;
	
	private File image; // 上传的文件
	private String imageFileName; // 文件名称
	private String imageContentType; // 文件类型
	

	public String execute() throws Exception {
		System.out.println("registMain is running");
		
		String path = ServletActionContext.getServletContext().getRealPath("/headImage");
		if (image != null) {
			File savefile = new File(new File(path), imageFileName);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(image, savefile);
			user.setUserImage(imageFileName);
		}
		user.setUserType(0);
		TUserDAO userDao = new TUserDAO();
		userDao.save(user);
		session.put("user", user); 
		System.out.println("用户信息保存成功");
		
		TCharge charge = new TCharge();
		TChargeDAO chargeDao = new TChargeDAO();
		
		charge.setTUser(user);
		charge.setChargeUserId(user.getUserId());
		charge.setChargeMoneyNow(0.0);
		charge.setChargeMoneyTotal(0.0);
		chargeDao.save(charge);
		
		System.out.println("充值业务创建完成");
		
		return "success";
	}


	public File getImage() {
		return image;
	}


	public void setImage(File image) {
		this.image = image;
	}


	public String getImageFileName() {
		return imageFileName;
	}


	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}


	public String getImageContentType() {
		return imageContentType;
	}


	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
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

	public String getHello() {
		return hello;
	}

	public void setHello(String hello) {
		this.hello = hello;
	}
}
