package data;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * A data access object (DAO) providing persistence and search support for
 * Result entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see data.Result
 * @author MyEclipse Persistence Tools
 */

public class ResultDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ResultDAO.class);
	// property constants
	public static final String QID = "qid";
	public static final String RESULT = "result";
	public static final String UID = "uid";
	public static final String IP = "ip";

	protected void initDao() {
		// do nothing
	}

	public void save(Result transientInstance) {
		log.debug("saving Result instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Result persistentInstance) {
		log.debug("deleting Result instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Result findById(java.lang.Integer id) {
		log.debug("getting Result instance with id: " + id);
		try {
			Result instance = (Result) getHibernateTemplate().get(
					"data.Result", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Result instance) {
		log.debug("finding Result instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Result instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Result as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByQid(Object qid) {
		return findByProperty(QID, qid);
	}

	public List findByResult(Object result) {
		return findByProperty(RESULT, result);
	}

	public List findByUid(Object uid) {
		return findByProperty(UID, uid);
	}

	public List findByIp(Object ip) {
		return findByProperty(IP, ip);
	}

	public List findAll() {
		log.debug("finding all Result instances");
		try {
			String queryString = "from Result";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Result merge(Result detachedInstance) {
		log.debug("merging Result instance");
		try {
			Result result = (Result) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Result instance) {
		log.debug("attaching dirty Result instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Result instance) {
		log.debug("attaching clean Result instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ResultDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ResultDAO) ctx.getBean("ResultDAO");
	}
}