package cn.search.action;

public class UrlSortAction extends Action_Pojo{
	
	public String index(){
		urlsortinfos = urlSortDao.findAll();
		return SUCCESS;
	}

	public String list(){
		urlsortinfos = urlSortDao.findAll();
		return "urlsorts";
	}
	
	public String edit(){
		urlsortinfo = urlSortDao.findOne(urlsortinfo.getUrlsortId());
		return "update_jsp";
	}
	public String delete(){
		urlSortDao.delete(urlsortinfo);
		return "list";
	}
	public String insert(){
		urlSortDao.insert(urlsortinfo);
		return "list";
	}
	
	public String update(){
		urlSortDao.update(urlsortinfo);
		return "success";
	}
	
	
}
