package cn.search.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import cn.search.util.ImageUtil;


public class UrlAction extends Action_Pojo implements SessionAware{
	public String index(){
		 urlinfos = urldao.findAll();
		return SUCCESS;
	}

	public String list(){
		urlinfos = urldao.findAll();
		return "urls";
	}
	public String edit(){
		urlinfo = urldao.findOne(urlinfo.getUid());
		return "urls";
	}
	public String delete(){
		urldao.delete(urlinfo);
		return "list";
	}
	public String insert(){
		urldao.insert(urlinfo, urlsortinfo.getUrlsortId());
		
	        File  imageFolder= new File(ServletActionContext.getServletContext().getRealPath("img/ico"));
	        File file = new File(imageFolder,urlinfo.getUid()+".jpg");
	        try {
	            FileUtils.copyFile(img, file);
	            BufferedImage img = ImageUtil.change2jpg(file);
	            ImageIO.write(img, "jpg", file); 
	            return "list";
	        } catch (IOException e) {
	            e.printStackTrace();
	            return "list";
	        }
	}
	public String insert1(){
		urldao.insert(urlinfo, urlsortinfo.getUrlsortId());
		
        File  imageFolder= new File(ServletActionContext.getServletContext().getRealPath("img/ico"));
        File file = new File(imageFolder,urlinfo.getUid()+".jpg");
        try {
            FileUtils.copyFile(img, file);
            BufferedImage img = ImageUtil.change2jpg(file);
            ImageIO.write(img, "jpg", file);           
        } catch (IOException e) {
            e.printStackTrace();
        }
	
	return SUCCESS;
	}
	public String findBysortId(){
		urlinfos = urldao.findBysortId(urlsortinfo.getUrlsortId());
		return "urls";
	}
	public String update() {
		if(null!=urlinfo.getUrlName()) {
			System.out.println("�޸���ַ����");
			urldao.setname(urlinfo);
		}else if(null!=urlinfo.getUrlWeblink()) {
			System.out.println("�޸���ַ����");
			urldao.seturl(urlinfo);
		}
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		session=arg0;
	}
}
