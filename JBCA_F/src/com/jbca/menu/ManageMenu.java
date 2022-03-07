package com.jbca.menu;

import com.sdb.bean.MenuBean;

public class ManageMenu 
{
	private MenuBean menuBean;
	
	private String baseMenuLocal = "<nav class=''navbar navbar-expand-sm bg-dark navbar-dark''><a class=''navbar-brand'' href=''/JBCA_B/admin/yonetim.jsp''>JBCA</a><ul class=''navbar-nav''><li class=''nav-item dropdown''><a class=''nav-link dropdown-toggle'' data-toggle=''dropdown'' href=''/JBCA_B/#''>Sayfalar</a><div class=''dropdown-menu''><a class=''dropdown-item'' href=''/JBCA_B/page/sayfa.jsp''>Sayfa</a><a class=''dropdown-item'' href=''/JBCA_B/page/tema.jsp''>Tema</a><a class=''dropdown-item'' href=''/JBCA_B/page/sayfalink.jsp''>Sayfa Link</a><a class=''dropdown-item'' href=''/JBCA_B/page/sayfamap.jsp''>Sayfa Map</a></div></li><li class=''nav-item dropdown''><a class=''nav-link dropdown-toggle'' data-toggle=''dropdown'' href=''/JBCA_B/#''>Kodlar</a><div class=''dropdown-menu''><a class=''dropdown-item'' href=''/JBCA_B/code/javascript-tr.jsp''>JavaScript</a><a class=''dropdown-item'' href=''/JBCA_B/code/css-tr.jsp''>CSS</a><a class=''dropdown-item'' href=''/JBCA_B/code/diger.jsp''>Diğer</a><a class=''dropdown-item'' href=''/JBCA_B/code/kodmap.jsp''>Kod Map</a></div></li><li class=''nav-item''><a class=''nav-link'' href=''/JBCA_B/menu/menu-tr.jsp''>Menüler</a></li><li class=''nav-item dropdown''><a class=''nav-link dropdown-toggle'' data-toggle=''dropdown'' href=''/JBCA_B/#''>Dosyalar</a><div class=''dropdown-menu''><a class=''dropdown-item'' href=''/JBCA_B/file/gorsel.jsp''>Görsel</a><a class=''dropdown-item'' href=''/JBCA_B/file/pdf-tr.jsp''>PDF</a><a class=''dropdown-item'' href=''/JBCA_B/file/word-tr.jsp''>Word</a><a class=''dropdown-item'' href=''/JBCA_B/file/excel-tr.jsp''>Excell</a><a class=''dropdown-item'' href=''/JBCA_B/file/diger.jsp''>Diğer</a></div></li><li class=''nav-item dropdown''><a class=''nav-link dropdown-toggle'' data-toggle=''dropdown'' href=''/JBCA_B/#''>Kullanıcı</a><div class=''dropdown-menu''><a class=''dropdown-item'' href=''/JBCA_B/admin/yonetim.jsp''>Yönetim</a><a class=''dropdown-item'' href=''/JBCA_B/admin/grup.jsp''>Grup</a><a class=''dropdown-item'' href=''/JBCA_B/user/mesaj.jsp''>Mesaj</a><a class=''dropdown-item'' href=''/JBCA_B/user/sifre.jsp''>Şifre</a><a class=''dropdown-item'' href=''/JBCA_B/start/giris.jsp''>Giriş</a></div></li></ul><ul class=''navbar-nav ml-auto''><li><a href=''/JBCA_B/admin/admin.jsp''>EN</a></li><li><span style=''color:#33ccff''>/</span></li><li><a href=''/JBCA_B/admin/yonetim.jsp''>TR</a></li></ul></nav>";
	private String baseMenu = "<nav class=''navbar navbar-expand-sm bg-dark navbar-dark''><a class=''navbar-brand'' href=''/JBCA_B/admin/yonetim.jsp''>JBCA</a><ul class=''navbar-nav''><li class=''nav-item dropdown''><a class=''nav-link dropdown-toggle'' data-toggle=''dropdown'' href=''/JBCA_B/#''>Sayfalar</a><div class=''dropdown-menu''><a class=''dropdown-item'' href=''/JBCA_B/page/sayfa.jsp''>Sayfa</a><a class=''dropdown-item'' href=''/JBCA_B/page/tema.jsp''>Tema</a><a class=''dropdown-item'' href=''/JBCA_B/page/sayfalink.jsp''>Sayfa Link</a><a class=''dropdown-item'' href=''/JBCA_B/page/sayfamap.jsp''>Sayfa Map</a></div></li><li class=''nav-item dropdown''><a class=''nav-link dropdown-toggle'' data-toggle=''dropdown'' href=''/JBCA_B/#''>Kodlar</a><div class=''dropdown-menu''><a class=''dropdown-item'' href=''/JBCA_B/code/javascript-tr.jsp''>JavaScript</a><a class=''dropdown-item'' href=''/JBCA_B/code/css-tr.jsp''>CSS</a><a class=''dropdown-item'' href=''/JBCA_B/code/diger.jsp''>Diğer</a><a class=''dropdown-item'' href=''/JBCA_B/code/kodmap.jsp''>Kod Map</a></div></li><li class=''nav-item''><a class=''nav-link'' href=''/JBCA_B/menu/menu-tr.jsp''>Menüler</a></li><li class=''nav-item dropdown''><a class=''nav-link dropdown-toggle'' data-toggle=''dropdown'' href=''/JBCA_B/#''>Dosyalar</a><div class=''dropdown-menu''><a class=''dropdown-item'' href=''/JBCA_B/file/gorsel.jsp''>Görsel</a><a class=''dropdown-item'' href=''/JBCA_B/file/pdf-tr.jsp''>PDF</a><a class=''dropdown-item'' href=''/JBCA_B/file/word-tr.jsp''>Word</a><a class=''dropdown-item'' href=''/JBCA_B/file/excel-tr.jsp''>Excell</a><a class=''dropdown-item'' href=''/JBCA_B/file/diger.jsp''>Diğer</a></div></li><li class=''nav-item dropdown''><a class=''nav-link dropdown-toggle'' data-toggle=''dropdown'' href=''/JBCA_B/#''>Kullanıcı</a><div class=''dropdown-menu''><a class=''dropdown-item'' href=''/JBCA_B/admin/yonetim.jsp''>Yönetim</a><a class=''dropdown-item'' href=''/JBCA_B/admin/grup.jsp''>Grup</a><a class=''dropdown-item'' href=''/JBCA_B/user/mesaj.jsp''>Mesaj</a><a class=''dropdown-item'' href=''/JBCA_B/user/sifre.jsp''>Şifre</a><a class=''dropdown-item'' href=''/JBCA_B/start/giris.jsp''>Giriş</a></div></li></ul><ul class=''navbar-nav ml-auto''><li><a href=''/JBCA_B/admin/admin.jsp''>EN</a></li><li><span style=''color:#33ccff''>/</span></li><li><a href=''/JBCA_B/admin/yonetim.jsp''>TR</a></li></ul></nav>";
	
	private String errorString = "null errorString"; 

	public ManageMenu(MenuBean menuBean)
	{
		this.menuBean = menuBean;
	}
	
	public boolean setMenu(String keyData, boolean isLocal)
	{
		try
		{
			if(isLocal)
				menuBean.setMenu(keyData, true, null, baseMenuLocal);
			else
				menuBean.setMenu(keyData, true, null, baseMenu);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
			if(!menuBean.getErrorString().equals("null errorString"))
				
				errorString = menuBean.getErrorString();
			return false;
		}
		return true;
	}
	
	public String getErrorString() {
		return errorString;
	}

	public String getBaseMenuLocal() {
		return baseMenuLocal;
	}

	public void setBaseMenuLocal(String baseMenuLocal) {
		this.baseMenuLocal = baseMenuLocal;
	}

	public String getBaseMenu() {
		return baseMenu;
	}

	public void setBaseMenu(String baseMenu) {
		this.baseMenu = baseMenu;
	}
}
