package com.poly.server;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.CloseReason;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.poly.coder.MessageDecoder;
import com.poly.coder.MessageEncoder;
import com.poly.model.Message;

// Khai báo đường dẫn và đăng ký bộ Encoder/Decoder ở đây
@ServerEndpoint(value = "/json/chat/{username}", encoders = { MessageEncoder.class }, decoders = {
		MessageDecoder.class })
public class JsonChatServerEndpoint {
	// Lưu trữ các phiên kết nối (Session) của người dùng
	private static Map<String, Session> sessions = new HashMap<>();

	@OnOpen
	public void onOpen(@PathParam("username") String username, Session session) {
		if (sessions.containsKey(username)) {
			try {
				session.close(new CloseReason(CloseReason.CloseCodes.VIOLATED_POLICY, "Username already exists"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			session.getUserProperties().put("username", username);
			sessions.put(username, session);
			// Gửi thông báo có người mới vào (Type 0)
			Message message = new Message("joined the chat", 0, username, sessions.size());
			broadcast(message);
		}
	}

	@OnMessage
	public void onMessage(Message message, Session session) {
		// Khi nhận tin nhắn từ Client, server sẽ broadcast lại cho tất cả
		// Lưu ý: Cập nhật lại count (số người online)
		message.setCount(sessions.size());
		broadcast(message);
	}

	@OnClose
	public void onClose(Session session) {
		String username = (String) session.getUserProperties().get("username");
		if (username != null) {
			sessions.remove(username);
			// Gửi thông báo người dùng thoát (Type 1)
			Message message = new Message("left the chat", 1, username, sessions.size());
			broadcast(message);
		}
	}

	@OnError
	public void onError(Session session, Throwable throwable) {
		try {
			if (session.isOpen())
				session.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Error: " + throwable.getMessage());
	}

	// Hàm gửi tin nhắn cho TẤT CẢ mọi người
	private void broadcast(Message message) {
		sessions.forEach((username, session) -> {
			try {
				// sendObject sẽ tự động gọi MessageEncoder để chuyển Object -> JSON
				session.getBasicRemote().sendObject(message);
			} catch (IOException | EncodeException e) {
				e.printStackTrace();
			}
		});
	}
}