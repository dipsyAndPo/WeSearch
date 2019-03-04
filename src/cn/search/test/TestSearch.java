package cn.search.test;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import cn.search.pojo.Urlinfo;
import cn.search.pojo.Urlsortinfo;

public class TestSearch{

	private SessionFactory sessionFactory;
	private StandardServiceRegistry registry;
	private Transaction beginTransaction;
	private Session session;
	private Urlinfo url;

	@After
	public void After() {
		session.save(url);
		System.out.println(url);
		beginTransaction.commit();
		session.close();
	}
	@Test
	public void test() {
		url = new Urlinfo();
		url.setUrlName("aaaa");
		url.setUrlWeblink("ad");
		Urlsortinfo sort=new Urlsortinfo();
		sort.setUrlsortId(0);
		url.setUrlsortinfo(sort);
	}
	@Before
	public void Before() {
		registry = new StandardServiceRegistryBuilder().configure().build();
		sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
		session = sessionFactory.openSession();
		beginTransaction = session.beginTransaction();
	}
	
}

