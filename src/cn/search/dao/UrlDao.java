package cn.search.dao;

import java.util.List;

import cn.search.pojo.Urlinfo;

public interface UrlDao {
	public Urlinfo insert(Urlinfo urlinfo,int sortid);
	public void delete(Urlinfo urlinfo);
	public Urlinfo findOne(int urlinfoid);
	public List<Urlinfo> findAll();
	public List<Urlinfo> findBysortId(int urlSortId);
	public boolean setname(Urlinfo url);
	public boolean seturl(Urlinfo url);

}
