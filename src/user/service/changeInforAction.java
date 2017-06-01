package user.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import user.dao.TUserDAO;
import user.mode.TUser;

import com.opensymphony.xwork2.ActionSupport;

public class changeInforAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private TUser user;
	private String birth;
	
	private File image; // 上传的文件
	private String imageFileName; // 文件名称
	private String imageContentType; // 文件类型
	
	public String execute() throws Exception {
		TUserDAO userDao = new TUserDAO();
		TUser u = (TUser) session.get("user");
		String path = ServletActionContext.getServletContext().getRealPath("/headImage");;
		System.out.println(path);
		if (image != null) {
			File f = new File(path+u.getUserImage());
			System.out.println(path+"\\"+u.getUserImage());
//			if(f.delete())
//				System.out.println("file delete successful");
//			else
//				System.out.println("file delete failed");	
			imageFileName = u.getUserName() + imageFileName;
			System.out.println(imageFileName);
			File savefile = new File(new File(path), imageFileName);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(image, savefile);
			u.setUserImage(imageFileName);
		}
		user.setUserId(u.getUserId());
		user.setUserName(u.getUserName());
		user.setUserType(u.getUserType());
		user.setUserPassword(u.getUserPassword());
		user.setUserImage(u.getUserImage());
		userDao.update(user);
		session.put("user", user);

		return "success";
	}


//	public String execute() throws Exception {
//		TUserDAO userDao = new TUserDAO();
//		TUser u = (TUser) session.get("user");
////		String path = ServletActionContext.getServletContext().getRealPath("/headImage");;
//		if (image != null) {
//			File f = new File("E:/MyEclipse/GamePlatform1.1/WebRoot/headImage/"+u.getUserImage());
//			if(f.delete())
//				System.out.println("file delete successful");
//			else
//				System.out.println("file delete failed");
//			
//			imageFileName = u.getUserName() + imageFileName;
//			System.out.println(imageFileName);
//			File savefile = new File(new File("E:/MyEclipse/GamePlatform1.1/WebRoot/headImage"), imageFileName);
////			File savefile = new File(new File(path), imageFileName);
//			if (!savefile.getParentFile().exists())
//				savefile.getParentFile().mkdirs();
//			FileUtils.copyFile(image, savefile);
//			u.setUserImage(imageFileName);
//		}
//		user.setUserId(u.getUserId());
//		user.setUserName(u.getUserName());
//		user.setUserType(u.getUserType());
//		user.setUserPassword(u.getUserPassword());
//		user.setUserImage(u.getUserImage());
//		userDao.update(user);
//		session.put("user", user);
//
//		return "success";
//	}

	public String show() throws Exception {
		user = (TUser) session.get("user");
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			birth = formatter.format(user.getUserBirth());
		} catch (Exception e) {
			birth = "2000-01-01";
		}
		return "show";
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	// =================图片上传=====================

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
}
