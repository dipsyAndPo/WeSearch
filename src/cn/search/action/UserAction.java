package cn.search.action;

public class UserAction extends Action_Pojo{
	
	public String login(){
		userinfo = userDao.login(userinfo);
		return SUCCESS;
	}
	
	public String metaSearch(){
		System.out.println("jinlaile"+sou_flag);
		return SUCCESS;
	}
}
