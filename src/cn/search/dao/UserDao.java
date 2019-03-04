package cn.search.dao;

import cn.search.pojo.Userinfo;

public interface UserDao {
	public void insert(Userinfo user);
	public Userinfo login(Userinfo userinfo);
}
