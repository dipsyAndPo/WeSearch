package cn.search.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.query.Query;

import cn.search.dao.UrlDao;
import cn.search.pojo.Urlinfo;
import cn.search.pojo.Urlsortinfo;

public class UrlDaoImpl implements UrlDao{
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
	public Urlinfo insert(Urlinfo urlinfo,int sortid) {
		openSession();
		Urlsortinfo urlsortinfo = session.get(Urlsortinfo.class, sortid);
		urlinfo.setUrlsortinfo(urlsortinfo);
		session.save(urlinfo);
		System.out.println(urlinfo);
		closeSession();
		return urlinfo;
	}

	@Override
	public void delete(Urlinfo urlinfo) {
		openSession();
		System.out.println("删除一个网址------");
		session.delete(session.get(Urlinfo.class, urlinfo.getUid()));
		closeSession();	
	}



	@Override
	public Urlinfo findOne(int urlinfoid) {
		openSession();
		Urlinfo urlinfo = session.get(Urlinfo.class, urlinfoid);
		closeSession();	
		return urlinfo;
	}

	@Override
	public List<Urlinfo> findAll() {
		openSession();
		Query query = session.createQuery("from Urlinfo");
		List<Urlinfo> list = query.list();
		closeSession();	
		return list;
	}
	@Override
	public List<Urlinfo> findBysortId(int urlSortId) {
		openSession();
		Query query = session.createQuery("from Urlinfo u where u.urlsortinfo.urlsortId=?");
		query.setInteger(0, urlSortId);
		List<Urlinfo> list = query.list();
		closeSession();	
		return list;
	}
	@Override
	public boolean setname(Urlinfo url) {
		openSession();
		Urlinfo urlinfo = session.get(Urlinfo.class, url.getUid());
		urlinfo.setUrlName(url.getUrlName());
		closeSession();	
		return true;
	}
	@Override
	public boolean seturl(Urlinfo url) {
		openSession();
		Urlinfo urlinfo = session.get(Urlinfo.class, url.getUid());
		urlinfo.setUrlWeblink(url.getUrlWeblink());
		closeSession();	
		return true;
	}

}
