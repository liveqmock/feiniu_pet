package com.lvmama.businessreply.utils;

import org.zkoss.zul.Messagebox;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Event;

public class ZkMessage {
	 /**
	  * 显示提示信息
	  * 
	  * @param value
	  */
	 public static void showInfo(String value) {
	  try {
	   Messagebox.show(value, "提示", Messagebox.OK, Messagebox.INFORMATION);
	  } catch (InterruptedException e) {
	   e.printStackTrace();
	  }
	 }

	 /**
	  * 显示询问信息
	  * 
	  * @param value
	  * @return
	  */
	 public static int showQuestion(String value) {
	  try {
	   return Messagebox.show(value, "询问", Messagebox.YES | Messagebox.NO,
	     Messagebox.QUESTION);
	  } catch (InterruptedException e) {
	   e.printStackTrace();
	  }
	  return Messagebox.NO;
	 }

	 /**
	  * 显示询问信息
	  * 
	  * @param value
	  * @return
	  */
	 public static void showQuestion(String value,final ZkMsgCallBack yes,final ZkMsgCallBack no) {
	  try {
		  Messagebox.show(value, "询问信息", Messagebox.YES | Messagebox.NO, Messagebox.ERROR, new EventListener() {
				public void onEvent(Event evt) {
					switch (((Integer) evt.getData()).intValue()) {
					case Messagebox.YES:
						yes.execute();
						break; // the Yes button is pressed
					case Messagebox.NO:
						no.execute();
						break; // the No button is pressed
					}
				}
			});
	   
	  } catch (InterruptedException e) {
	   e.printStackTrace();
	  }
	 }
	 /**
	  * 显示警告
	  * 
	  * @param value
	  */
	 public static void showWarning(String value) {
	  try {
	   Messagebox.show(value, "警告", Messagebox.OK, Messagebox.EXCLAMATION);
	  } catch (InterruptedException e) {
	   e.printStackTrace();
	  }
	 }

	 /**
	  * 显示错误
	  * 
	  * @param value
	  */
	 public static void showError(String value) {
	  try {
	   Messagebox.show(value, "错误", Messagebox.OK, Messagebox.ERROR);
	  } catch (InterruptedException e) {
	   e.printStackTrace();
	  }
	 }
	}
