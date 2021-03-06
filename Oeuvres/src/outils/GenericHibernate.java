package outils;

// Generated 19 f�vr. 2013 14:16:59 by Hibernate Tools 4.0.0

import java.util.List;

import metier.ReservationId;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;

/**
 * Home object for domain model class T.
 * @see metier.T
 * @author Hibernate Tools
 */
public class GenericHibernate<T> {

	private Log log;
	
	public GenericHibernate(T t) {	
		log = LogFactory.getLog(t.getClass());
	}

	private final SessionFactory sessionFactory = hibernateUtil.getSessionFactory();

	public void persist(T transientInstance) {
		log.debug("persisting "+transientInstance.getClass().toString()+" instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(T instance) {
		log.debug("attaching dirty "+instance.getClass().toString()+" instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(T instance) {
		log.debug("attaching clean "+instance.getClass().toString()+" instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(T persistentInstance) {
		log.debug("deleting "+persistentInstance.getClass().toString()+" instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public T merge(T detachedInstance) {
		log.debug("merging "+detachedInstance.getClass().toString()+" instance");
		try {
			T result = (T) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public T findById(T t,int id) {
		log.debug("getting "+t.getClass().toString()+" instance with id: " + id);
		try {
			T instance = (T) sessionFactory
					.getCurrentSession().get(t.getClass(),id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public T findById(T t,ReservationId id) {
		log.debug("getting "+t.getClass().toString()+" instance with id: " + id);
		try {
			T instance = (T) sessionFactory
					.getCurrentSession().get(t.getClass(),id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<T> findAll(T t) {
		List<T> results = null;
		log.debug("finding all "+t.getClass().toString()+" instance ");
		try {
			results = (List<T>)sessionFactory.getCurrentSession().createCriteria(t.getClass()).list();
			log.debug("find all successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("get all failled", re);
			throw re;
		}
	}
}
