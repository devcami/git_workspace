package com.kh.web.servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @WebServlet("/ServletLifeCycle")
 *  - web.xml에서 servlet, servlet-mapping을 통해 특정 url에 특정 servlet 등록하는 일을 대신 처리
 *  - url-pattern을 작성. 반드시 /로 시작할 것(context-path)
 *  
 *  Servlet 생명주기
 *   - 생성자 호출 
 *   - @PostConstruct 메소드 호출
 *   - init(ServletConfig) 호출
 *   
 *   - 실제 요청이 들어오면 GenericServlet#service 메소드 호출 - 전송방식별 분기 (GET or POST)
 *   - doGet | doPost 호출
 *   
 *   - destroy 메소드호출
 *   - @PreDestroy 메소드호출 
 */
@WebServlet("/ServletLifeCycle")
public class ServletLifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLifeCycle() {
    	System.out.println("> ServletLifeCycle 생성자  호출");
    }

    @PostConstruct
    public void postConstruct() {
    	System.out.println("> ServletLifeCycle@PostConstruct 메소드 호출");
    }
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("> ServletLifeCycle#init 메소드 호출 : " + config); //이 때 config객체가 들어오는데 그 작업을 추가로 여기서 진행 할 수 있음
		//config = org.apache.catalina.core.StandardWrapperFacade@39bbe577
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ServletLifeCycle#doGet 메소드 호출"); 
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		//서버 끌 때 할 작업
		System.out.println("> ServletLifeCycle#destroy 메소드 호출"); 
	}

	@PreDestroy
	public void preDestroy() {
		System.out.println("> ServletLifeCycle@PreDestroy 메소드 호출"); 
	}

}
