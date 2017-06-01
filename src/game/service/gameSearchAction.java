package game.service;

import game.dao.TGameDAO;
import game.mode.TGame;

import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import relate.dao.TRelateDAO;
import relate.mode.TRelate;
import user.mode.TUser;
import charge.dao.TChargeDAO;
import charge.mode.TCharge;

import com.opensymphony.xwork2.ActionSupport;
import combat.dao.TCombatDAO;
import combat.mode.TCombat;

public class gameSearchAction extends ActionSupport implements SessionAware {
	private Map<String, Object> session;
	private List<TGame> gameList;
	private List<TRelate> relateList;
	private List<TCombat> combatList;
	private TGame gameInfor;
	private File game; // 上传的文件
	private String gameFileName; // 文件名称
	private String gameContentType; // 文件类型
	private File image; // 上传的文件
	private String imageFileName; // 文件名称
	private String imageContentType; // 文件类型
	private int gameId;
	private String mes;
	
	
	public String gameDownload() throws Exception{
		TRelateDAO relateDao = new TRelateDAO();
		TUser user = (TUser) session.get("user");
		relateList = relateDao.findByUserId(user);
		TGameDAO gameDao = new TGameDAO();
		gameInfor = gameDao.findById(gameId);
		for (TRelate item : relateList) {
			if(item.getTGame().getGameId() == gameId)
			{
				mes=gameInfor.getGamePath();
				return "canDownload";
			}
		}
		mes="you should buy it!";
		return "shouldBuy";
	}
	
	public String gameDelete() throws Exception{
		
		System.out.println("gameDelete is running!");
		
		TGameDAO gameDao = new TGameDAO();
		TGame game = new TGame();
		TRelateDAO relateDao = new TRelateDAO();
		TCombatDAO combatDao = new TCombatDAO();
				
		System.out.println(gameId);
		game.setGameId(gameId);
		relateList = relateDao.findByGameId(game);
		combatList = combatDao.findByTGame(game);
		System.out.println(relateList.size()>0);
		
		if( relateList.size()>0 )
		{
			System.out.println(">");
			for (TRelate item : relateList) {
				System.out.println(">"+item.getId());
				relateDao.delete(item);
			}
		}
		if( combatList.size()>0 )
		{
			System.out.println(">");
			for (TCombat item : combatList) {
				System.out.println(">"+item.getCombatId());
				combatDao.delete(item);
			}
		}

		gameDao.delete(game);
		
		return "deleteSuccess";
	}
	
	public String gameBuy() throws Exception{
		System.out.println("gameBuy is running!");
		TChargeDAO chargeDao = new TChargeDAO();
		TCharge charge = new TCharge();
		TGameDAO gameDao = new TGameDAO();
		TUser user = (TUser)session.get("user");
		TGame game;
		TRelateDAO relateDao = new TRelateDAO();
		TRelate relate = new TRelate();
		
		if(user==null)
			return "unLogin";
		System.out.println("gameId:"+gameId);
		
		relateList = relateDao.findByUserId(user);
		for (TRelate item : relateList) {
			if(item.getTGame().getGameId() == gameId)
			{
				mes = "You has been buy ,Please Download!";
				return "failed";
			}
		}
		
		game = gameDao.findById(gameId);
		charge = chargeDao.findById(user.getUserId());
		
		System.out.println(charge==null);
		System.out.println(game==null);
		
		if(charge.getChargeMoneyNow()<game.getGameMoney())
			return "unEnoughMoney";
		
		System.out.println("money"+(charge.getChargeMoneyNow()-game.getGameMoney()*0.8));
		
		if(user.getUserType()==1)
			charge.setChargeMoneyNow(charge.getChargeMoneyNow()-game.getGameMoney()*0.8);
		else
			charge.setChargeMoneyNow(charge.getChargeMoneyNow()-game.getGameMoney());	
		chargeDao.update(charge);
		
		relate.setTGame(game);
		relate.setTUser(user);
		
		relateDao.save(relate);
		
		return "buyGameSuccess";
	}
	
	public String gameAdd() throws Exception{
		
		System.out.println("gameAdd is runing");
		
		String realPath = ServletActionContext.getServletContext().getRealPath("/images");
		String gamePath = ServletActionContext.getServletContext().getRealPath("/game");
		
		String path = "E:/MyEclipse3/GamePlatform1.1/WebRoot/game";
		if (game != null) {
			File savefile = new File(new File(gamePath), gameFileName);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(game, savefile);
			gameInfor.setGamePath(gameFileName);
		}
		if (image != null) {
			File savefile = new File(new File(realPath), imageFileName);
			if (!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(image, savefile);
			gameInfor.setGameImage(imageFileName);
		}
		
		TGameDAO gameDao = new TGameDAO();
		gameDao.save(gameInfor);
		
		return "addSuccess";
	}
	
	public String execute() throws Exception {
		System.out.println("gameSearchMain is running!");
		TGameDAO gameDao = new TGameDAO();
		TUser user = (TUser)session.get("user");
		TRelateDAO relateDao = new TRelateDAO();
		relateList = relateDao.findByUserId(user);
		
		gameList = gameDao.findAll();
		
		return "success";
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<TGame> getGameList() {
		return gameList;
	}

	public void setGameList(List<TGame> gameList) {
		this.gameList = gameList;
	}

	public File getGame() {
		return game;
	}

	public void setGame(File game) {
		this.game = game;
	}

	public String getGameFileName() {
		return gameFileName;
	}

	public void setGameFileName(String gameFileName) {
		this.gameFileName = gameFileName;
	}

	public String getGameContentType() {
		return gameContentType;
	}

	public void setGameContentType(String gameContentType) {
		this.gameContentType = gameContentType;
	}

	public String getMes() {
		return mes;
	}

	public void setMes(String mes) {
		this.mes = mes;
	}

	public TGame getGameInfor() {
		return gameInfor;
	}

	public void setGameInfor(TGame gameInfor) {
		this.gameInfor = gameInfor;
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

	public List<TRelate> getRelateList() {
		return relateList;
	}

	public void setRelateList(List<TRelate> relateList) {
		this.relateList = relateList;
	}

	public List<TCombat> getCombatList() {
		return combatList;
	}

	public void setCombatList(List<TCombat> combatList) {
		this.combatList = combatList;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public int getGameId() {
		return gameId;
	}

	public void setGameId(int gameId) {
		this.gameId = gameId;
	}
}
