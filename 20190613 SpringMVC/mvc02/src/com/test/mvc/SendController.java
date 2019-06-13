/*=================================
 	SendController.java
 	- 사용자 정의 컨트롤러 클래스
 ==================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.ModelAndView;	// jar 파일로 ModelAndView 객체 생성 가능해짐. 
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법에 통해
//    사용자 정의 컨트롤러 클래스를 구성한다. 
public class SendController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();
		
		// send.jsp 로 보낸 후, action="" 에서 receive.do 로 처리하기. 		
		/* String userName = request.getParameter("userName"); */		
		/* mav.addObject("userName", userName); */

		mav.setViewName("/WEB-INF/views/Send.jsp");
		
		return mav;

	}
	
}