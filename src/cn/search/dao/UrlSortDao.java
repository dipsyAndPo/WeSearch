package cn.search.dao;

import java.util.List;

import cn.search.pojo.Urlsortinfo;

public interface UrlSortDao {
	public void insert(Urlsortinfo urlsort);
	public void delete(Urlsortinfo urlsort);
	public void update(Urlsortinfo urlsort);
	public Urlsortinfo findOne(int urlsortId);
	public List<Urlsortinfo> findAll();
}
