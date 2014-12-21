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
 * Questionnaire entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see data.Questionnaire
 * @author MyEclipse Persistence Tools
 */

public class QuestionnaireDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(QuestionnaireDAO.class);
	// property constants
	public static final String INVEST_ID = "investId";
	public static final String TITLE = "title";
	public static final String SUBJECT = "subject";
	public static final String DESCRIPTION = "description";
	public static final String CONTENT = "content";
	public static final String USERNUM = "usernum";
	public static final String IPNUM = "ipnum";
	public static final String ANONYMOUS = "anonymous";
	public static final String ISAVAILABLE = "isavailable";
	public static final String ISCREATED = "iscreated";
	public static final String ISEDITABLE = "iseditable";
	public static final String ISRELEASED = "isreleased";
	public static final String ISCLOSED = "isclosed";

	protected void initDao() {
		// do nothing
	}

	public void save(Questionnaire transientInstance) {
		
		log.debug("saving Questionnaire instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Questionnaire persistentInstance) {
		log.debug("deleting Questionnaire instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Questionnaire findById(java.lang.Long id) {
		System.out.println(id);
		log.debug("getting Questionnaire instance with id: " + id);
		try {
			Questionnaire instance = (Questionnaire) getHibernateTemplate()
					.get("data.Questionnaire", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Questionnaire instance) {
		log.debug("finding Questionnaire instance by example");
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
		log.debug("finding Questionnaire instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Questionnaire as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByInvestId(Object investId) {
		return findByProperty(INVEST_ID, investId);
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findBySubject(Object subject) {
		return findByProperty(SUBJECT, subject);
	}

	public List findByDescription(Object description) {
		return findByProperty(DESCRIPTION, description);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByUsernum(Object usernum) {
		return findByProperty(USERNUM, usernum);
	}

	public List findByIpnum(Object ipnum) {
		return findByProperty(IPNUM, ipnum);
	}

	public List findByAnonymous(Object anonymous) {
		return findByProperty(ANONYMOUS, anonymous);
	}

	public List findByIsavailable(Object isavailable) {
		return findByProperty(ISAVAILABLE, isavailable);
	}

	public List findByIscreated(Object iscreated) {
		return findByProperty(ISCREATED, iscreated);
	}

	public List findByIseditable(Object iseditable) {
		return findByProperty(ISEDITABLE, iseditable);
	}

	public List findByIsreleased(Object isreleased) {
		return findByProperty(ISRELEASED, isreleased);
	}

	public List findByIsclosed(Object isclosed) {
		return findByProperty(ISCLOSED, isclosed);
	}

	public List findAll() {
		log.debug("finding all Questionnaire instances");
		try {
			String queryString = "from Questionnaire";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Questionnaire merge(Questionnaire detachedInstance) {
		log.debug("merging Questionnaire instance");
		try {
			Questionnaire result = (Questionnaire) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Questionnaire instance) {
		log.debug("attaching dirty Questionnaire instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Questionnaire instance) {
		log.debug("attaching clean Questionnaire instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static QuestionnaireDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (QuestionnaireDAO) ctx.getBean("QuestionnaireDAO");
	}
}