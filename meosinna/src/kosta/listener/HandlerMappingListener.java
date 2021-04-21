package kosta.listener;

import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import kosta.controller.Controller;

/**
 * 서버가 start될 때 생성해야할 객체들을 미리 생성해서 Map에 저장한 후
 * application영역에 저장한다.
 * */
@WebListener
public class HandlerMappingListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce)  { 
    	//외부의 ~.properties파일을 로딩해서 key와 value를 분리한다.
    	ServletContext application = sce.getServletContext();
    	String fileName = application.getInitParameter("fileName");
    	
    	Map<String, Controller> map = new HashMap<String, Controller>();
    	Map<String, Class<?>> clzMap = new HashMap<String, Class<?>>();
    	
    	ResourceBundle rb = ResourceBundle.getBundle(fileName);
    	try {
    		for(String key : rb.keySet()) {
    			String value = rb.getString(key);
    			
    			Class<?> className = Class.forName(value);
    			Controller controller = (Controller)className.getDeclaredConstructor().newInstance();
    			
    			//Controller controller = (Controller)(Class.forName(value).getDeclaredConstructor().newInstance());
    			System.out.println(key+", "+value+", "+controller);
    			
    			map.put(key, controller);
    			clzMap.put(key, className);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	//webApplication영역에서 어디서든지 사용할 수 있도록 map을 저장한다.
    	application.setAttribute("map", map);
    	application.setAttribute("clzMap", clzMap);
    }
	
}
