package cn.search.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

import cn.search.dao.UrlSortDao;
import cn.search.pojo.Urlsortinfo;

public class UrlSortImpl implements UrlSortDao{
	public Session session;
	private Transaction beginTransaction;
	void openSession(){
		StandardServiceRegistry registry = new StandardServiceRegistryBuilder().configure().build();
		SessionFactory sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
		session = sessionFactory.openSession();
		beginTransaction = session.beginTransaction();
	}
	void closeSession(){
		beginTransaction.commit();
		session.close();
	}
	
	@Override
	public void insert(Urlsortinfo urlsort) {
		openSession();
		session.save(urlsort);
		closeSession();
	}
	
	@Override
	public void update(Urlsortinfo urlsort) {
		openSession();
		Urlsortinfo urlsortinfo = session.get(Urlsortinfo.class, urlsort.getUrlsortId());
		urlsortinfo.setUrlsortName(urlsort.getUrlsortName());
		closeSession();
	}
	
	

	@Override
	public void delete(Urlsortinfo urlsort) {
		openSession();
		Urlsortinfo urlsortinfo = session.get(Urlsortinfo.class, urlsort.getUrlsortId());
		session.delete(urlsortinfo);
		closeSession();		
	}


	@Override
	public Urlsortinfo findOne(int urlsortId) {
		openSession();
		Urlsortinfo urlsortinfo = session.get(Urlsortinfo.class, urlsortId);
		closeSession();	
		return urlsortinfo;
	}

	@Override
	public List<Urlsortinfo> findAll() {
		openSession();
		Query query = session.createQuery("from Urlsortinfo");
		List<Urlsortinfo> list = query.list();
		closeSession();	
		return list;
	}
	
}
