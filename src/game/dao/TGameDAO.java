package game.dao;

import game.mode.TGame;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.hibernate.Query;
import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import user.dao.BaseHibernateDAO;

/**
 * A data access object (DAO) providing persistence and search support for TGame
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see game.mode.TGame
 * @author MyEclipse Persistence Tools
 */

public class TGameDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(TGameDAO.class);
	// property constants
	public static final String GAME_NAME = "gameName";
	public static final String GAME_IMAGE = "gameImage";
	public static final String GAME_INTRODUC = "gameIntroduc";
	public static final String GAME_PATH = "gamePath";

	public void save(TGame transientInstance) {
		log.debug("saving TGame instance");
		
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		getSession().beginTransaction().commit();
	}

	public void delete(TGame persistentInstance) {
		log.debug("deleting TGame instance");
		try {
			getSession().clear();
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
		getSession().beginTransaction().commit();
	}

	public TGame findById(java.lang.Integer id) {
		log.debug("getting TGame instance with id: " + id);
		try {
			TGame instance = (TGame) getSession().get("game.mode.TGame", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<TGame> findByExample(TGame instance) {
		log.debug("finding TGame instance by example");
		try {
			List<TGame> results = (List<TGame>) getSession()
					.createCriteria("game.mode.TGame").add(create(instance))
					.list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TGame instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TGame as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<TGame> findByGameName(Object gameName) {
		return findByProperty(GAME_NAME, gameName);
	}

	public List<TGame> findByGameImage(Object gameImage) {
		return findByProperty(GAME_IMAGE, gameImage);
	}

	public List<TGame> findByGameIntroduc(Object gameIntroduc) {
		return findByProperty(GAME_INTRODUC, gameIntroduc);
	}

	public List<TGame> findByGamePath(Object gamePath) {
		return findByProperty(GAME_PATH, gamePath);
	}

	public List findAll() {
		log.debug("finding all TGame instances");
		try {
			String queryString = "from TGame";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TGame merge(TGame detachedInstance) {
		log.debug("merging TGame instance");
		try {
			TGame result = (TGame) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TGame instance) {
		log.debug("attaching dirty TGame instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TGame instance) {
		log.debug("attaching clean TGame instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}