package combat.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import combat.mode.TCombat;
import friend.mode.TFriend;

import user.dao.BaseHibernateDAO;

/**
 * A data access object (DAO) providing persistence and search support for
 * TCombat entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see combat.mode.TCombat
 * @author MyEclipse Persistence Tools
 */

public class TCombatDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(TCombatDAO.class);
	// property constants
	public static final String COMBATE_RESULT = "combateResult";
	public static final String COMBATE_SCORE = "combateScore";

	public void save(TCombat transientInstance) {
		log.debug("saving TCombat instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TCombat persistentInstance) {
		log.debug("deleting TCombat instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
		getSession().beginTransaction().commit();
	}

	public TCombat findById(java.lang.Integer id) {
		log.debug("getting TCombat instance with id: " + id);
		try {
			TCombat instance = (TCombat) getSession().get(
					"combat.mode.TCombat", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<TCombat> findByExample(TCombat instance) {
		log.debug("finding TCombat instance by example");
		try {
			List<TCombat> results = (List<TCombat>) getSession()
					.createCriteria("combat.mode.TCombat")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public List<TCombat> findAllPage(int pageNum) {
		String queryString = "from TCombat";
		Query queryObject = getSession().createQuery(queryString);

		queryObject.setFirstResult(pageNum);
		queryObject.setMaxResults(7);

		return queryObject.list();
	}
	public List<TCombat> findByTUserPage(Object userId, int pageNum) {
		String queryString = "from TCombat as model where model.TUser = ?";
		Query queryObject = getSession().createQuery(queryString);

		queryObject.setParameter(0, userId);
		queryObject.setFirstResult(pageNum);
		queryObject.setMaxResults(7);

		return queryObject.list();
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TCombat instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TCombat as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<TCombat> findByTGame(Object game) {
		return findByProperty("TGame", game);
	}

	public List<TCombat> findByTUser(Object user) {
		return findByProperty("TUser", user);
	}

	public List<TCombat> findByCombateResult(Object combateResult) {
		return findByProperty(COMBATE_RESULT, combateResult);
	}

	public List<TCombat> findByCombateScore(Object combateScore) {
		return findByProperty(COMBATE_SCORE, combateScore);
	}

	public List findAll() {
		log.debug("finding all TCombat instances");
		try {
			String queryString = "from TCombat";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TCombat merge(TCombat detachedInstance) {
		log.debug("merging TCombat instance");
		try {
			TCombat result = (TCombat) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TCombat instance) {
		log.debug("attaching dirty TCombat instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TCombat instance) {
		log.debug("attaching clean TCombat instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}