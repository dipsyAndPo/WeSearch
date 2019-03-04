package cn.search.action;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

import cn.search.dao.UrlDao;
import cn.search.dao.UrlSortDao;
import cn.search.dao.UserDao;
import cn.search.dao.impl.UrlDaoImpl;
import cn.search.dao.impl.UrlSortImpl;
import cn.search.dao.impl.UserImpl;
import cn.search.pojo.Urlinfo;
import cn.search.pojo.Urlsortinfo;
import cn.search.pojo.Userinfo;

public class Action_Pojo extends ActionSupport{
	protected Userinfo userinfo = new Userinfo();
	protected Urlinfo urlinfo = new Urlinfo();
	protected Urlsortinfo urlsortinfo = new Urlsortinfo();
	
	protected Map<String, Object> session;
	
	protected List<Userinfo> userinfos;
	protected List<Urlinfo> urlinfos;
	protected List<Urlsortinfo> urlsortinfos;
	
	protected UrlDao urldao = new UrlDaoImpl();
	protected UrlSortDao urlSortDao = new UrlSortImpl();
	protected UserDao userDao = new UserImpl();
	
	protected String errorString;
	protected String Searchtext;
	protected String sou_flag;
	protected File img;
	

	public File getImg() {
		return img;
	}
	public void setImg(File img) {
		this.img = img;
	}
	
	public String getSearchtext() {
		return Searchtext;
	}
	public void setSearchtext(String searchtext) {
		Searchtext = searchtext;
	}
	public UrlDao getUrldao() {
		return urldao;
	}
	public void setUrldao(UrlDao urldao) {
		this.urldao = urldao;
	}
	public UrlSortDao getUrlSortDao() {
		return urlSortDao;
	}
	public void setUrlSortDao(UrlSortDao urlSortDao) {
		this.urlSortDao = urlSortDao;
	}
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public String getErrorString() {
		return errorString;
	}
	public void setErrorString(String errorString) {
		this.errorString = errorString;
	}
	public Userinfo getUserinfo() {
		return userinfo;
	}
	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}
	public Urlinfo getUrlinfo() {
		return urlinfo;
	}
	public void setUrlinfo(Urlinfo urlinfo) {
		this.urlinfo = urlinfo;
	}
	public Urlsortinfo getUrlsortinfo() {
		return urlsortinfo;
	}
	public void setUrlsortinfo(Urlsortinfo urlsortinfo) {
		this.urlsortinfo = urlsortinfo;
	}
	public List<Userinfo> getUserinfos() {
		return userinfos;
	}
	public void setUserinfos(List<Userinfo> userinfos) {
		this.userinfos = userinfos;
	}
	public List<Urlinfo> getUrlinfos() {
		return urlinfos;
	}
	public void setUrlinfos(List<Urlinfo> urlinfos) {
		this.urlinfos = urlinfos;
	}
	public List<Urlsortinfo> getUrlsortinfos() {
		return urlsortinfos;
	}
	public void setUrlsortinfos(List<Urlsortinfo> urlsortinfos) {
		this.urlsortinfos = urlsortinfos;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public String getSou_flag() {
		return sou_flag;
	}
	public void setSou_flag(String sou_flag) {
		this.sou_flag = sou_flag;
	}
	
}
