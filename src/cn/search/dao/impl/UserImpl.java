package cn.search.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

import cn.search.dao.UserDao;
import cn.search.pojo.Userinfo;

public class UserImpl implements UserDao{
	public Session session;
	void openSession(){
		StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
		SessionFactory sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
		session = sessionFactory.openSession();
		session.getTransaction().begin();
	}
	void closeSession(){
		session.getTransaction().commit();
		session.close();
	}
	@Override
	public void insert(Userinfo user) {
		openSession();
		session.save(user);
		closeSession();
		
	}
	@Override
	public Userinfo login(Userinfo userinfo) {
		openSession();
		Query query = session.createQuery("from Userinfo where userAccount=? and userPwd=?");
		query.setParameter(0, userinfo.getUserAccount());
		query.setParameter(1, userinfo.getUserPwd());
		try {
			Userinfo userinfos = (Userinfo) query.getSingleResult();
			closeSession();
			return userinfos;
		} catch (Exception e) {
			closeSession();
			return null;
		}
	}
	
}
