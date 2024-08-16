package com.project.controller;



import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.project.entity.ChatEntity;
import com.project.repository.ChatRepository;
import com.project.repository.DealRepository;


// 사용자들이 연결할 Socket 클래스! (이 클래스에 메세지를 보내고, 이 클래스에서 다시 메세지를 보내는)
//@ServerEndpoint("/chat")  // Socket에 연결하기 위한 URL Mapping 지정
//@Controller
public class ChatController {
	
	
	private static List<Session> userList = new ArrayList<Session>();




	@Autowired
	private DealRepository dealRepo;
	
	@Autowired
	private ChatRepository chatRepo;
	

	// 아래 onOpen의 session에서 받은 내용을 저장할 수 있는 변수
	// static은 전역변수로 사용하겠다는 뜻
	
	

	
	// 웹소켓의 3가지 이벤트
	// 1. 사용자가 웹소켓과 연결됐을 때 // 웹소켓과 연결됐을 때 아래의 기능을 하겠다
	// 반드시 웹소켓 session 을 자료형으로 하는 변수가 필요하다.
	@OnOpen
	public void onOpen(Session session) { 
		// Session session : 접속한 사용자의 정보를 저장
		System.out.println("사용자 접속함");
		
		userList.add(session);
	}
	
	// 2. 사용자가 웹소켓과 연결을 해제했을 때
	@OnClose
	public void onClose(Session session) {
		System.out.println("사용자 접속 해제");
		
		userList.remove(session);
	}
	
	// 3. 메세지를 받았을 때
	@OnMessage
	public void onMessage(Session session, String payload) {
		// payload : 사용자가 보낸 메세지
		System.out.println("받은 메시지 : " + payload);
		
		// 1) 메시지 처리, 기능 실행
		// JSON --> Java Object
		Gson gson = new Gson();
		ChatEntity entity = gson.fromJson(payload, ChatEntity.class);
		// dto안의 데이터를 저장
		
		// 2) (채팅기준) 메세지를 채팅방 내 사용자들에게 전달
		for(Session sess : userList) { // for-each문  userList에서 하나씩 뽑아서 Session 자료형의 sess 변수에 담을 것입니다. 
			
			if(!sess.equals(session)) {
				// 메세지 전달
				// sess.getBasicRemote().sendText("보낼 문자열")
				try {
					sess.getBasicRemote().sendText(payload);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	@RequestMapping("/chat")
    public String chatPage(Model model, Principal principal) {
        // 로그인된 사용자의 아이디를 Principal로부터 가져오기
        String username = principal.getName();

        // 모델에 사용자 이름 추가
        model.addAttribute("nick", username);
        
        return "chat";  // chat.jsp로 이동
    }
	
}
