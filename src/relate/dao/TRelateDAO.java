package relate.dao;

import static org.hibernate.criterion.Example.create;
import game.mode.TGame;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import relate.mode.TRelate;
import user.dao.BaseHibernateDAO;
import user.mode.TUser;

/**
 * A data access object (DAO) providing persistence and search support for
 * TRelate entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see relate.mode.TRelate
 * @author MyEclipse Persistence Tools
 */

public class TRelateDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(TRelateDAO.class);

	// property constants

	public void save(TRelate transientInstance) {
		log.debug("saving TRelate instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		getSession().beginTransaction().commit();
	}

	public void delete(TRelate persistentInstance) {
		log.debug("deleting TRelate instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
		getSession().beginTransaction().commit();
	}

	public TRelate findById(java.lang.Integer id) {
		log.debug("getting TRelate instance with id: " + id);
		try {
			TRelate instance = (TRelate) getSession().get(
					"relate.mode.TRelate", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<TRelate> findByExample(TRelate instance) {
		log.debug("finding TRelate instance by example");
		try {
			List<TRelate> results = (List<TRelate>) getSession()
					.createCriteria("relate.mode.TRelate")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TRelate instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TRelate as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<TRelate> findByUserId(TUser user) {
		return findByProperty("TUser", user);
	}

	public List<TRelate> findByGameId(TGame game) {
		return findByProperty("TGame", game);
	}

	public List findAll() {
		log.debug("finding all TRelate instances");
		try {
			String queryString = "from TRelate";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TRelate merge(TRelate detachedInstance) {
		log.debug("merging TRelate instance");
		try {
			TRelate result = (TRelate) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TRelate instance) {
		log.debug("attaching dirty TRelate instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TRelate instance) {
		log.debug("attaching clean TRelate instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}