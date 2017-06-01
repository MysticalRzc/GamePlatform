package friend.dao;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import user.dao.BaseHibernateDAO;
import friend.mode.TFriend;

/**
 * A data access object (DAO) providing persistence and search support for
 * TFriend entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see friend.dao.TFriend
 * @author MyEclipse Persistence Tools
 */

public class TFriendDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(TFriendDAO.class);

	// property constants

	public void save(TFriend transientInstance) {
		log.debug("saving TFriend instance");
		Transaction tran = getSession().beginTransaction();
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
		tran.commit();
	}

	public void delete(TFriend persistentInstance) {
		log.debug("deleting TFriend instance");
		Transaction tran = getSession().beginTransaction();
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
		tran.commit();
	}

	public TFriend findById(java.lang.Integer id) {
		log.debug("getting TFriend instance with id: " + id);
		try {
			TFriend instance = (TFriend) getSession().get("friend.mode.TFriend",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<TFriend> findByExample(TFriend instance) {
		log.debug("finding TFriend instance by example");
		try {
			List<TFriend> results = (List<TFriend>) getSession()
					.createCriteria("friend.dao.TFriend").add(create(instance))
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
		log.debug("finding TFriend instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from TFriend as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List<TFriend> findByUserName(Object userId) {
		return findByProperty("TUserByUserId", userId);
	}

	public List findAll() {
		log.debug("finding all TFriend instances");
		try {
			String queryString = "from TFriend";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public TFriend merge(TFriend detachedInstance) {
		log.debug("merging TFriend instance");
		try {
			TFriend result = (TFriend) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TFriend instance) {
		log.debug("attaching dirty TFriend instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TFriend instance) {
		log.debug("attaching clean TFriend instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}