package com.poly.websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 * Định nghĩa endpoint cho WebSocket tại URL: /text/chat
 */
@ServerEndpoint("/text/chat")
public class TextChatServerEndpoint {

	// Danh sách lưu trữ các session của client đang kết nối.
	// Dùng static để tất cả các instance của class này đều dùng chung 1 danh sách.
	// Dùng Collections.synchronizedMap để đảm bảo an toàn khi nhiều luồng truy cập
	// (thread-safe).
	private static Map<String, Session> sessions = Collections.synchronizedMap(new HashMap<String, Session>());

	/**
	 * Phương thức gửi tin nhắn đến tất cả mọi người
	 */
	private void broadcast(String message) {
		sessions.forEach((id, session) -> {
			try {
				if (session.isOpen()) {
					session.getBasicRemote().sendText(message);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
	}

	/**
	 * Sự kiện khi có kết nối mới mở ra
	 */
	@OnOpen
	public void onOpen(Session session) {
		// 1. Lưu session vào map
		sessions.put(session.getId(), session);

		// 2. Thông báo cho mọi người biết có người mới vào
		// Theo yêu cầu: "Someone joined the chat!"
		this.broadcast("Someone joined the chat!");
	}

	/**
	 * Sự kiện khi nhận được tin nhắn từ Client
	 */
	@OnMessage
	public void onMessage(String message, Session session) {
		// Theo yêu cầu: Chuyển tiếp tin nhắn đó đến tất cả mọi người
		this.broadcast(message);
	}

	/**
	 * Sự kiện khi kết nối bị đóng (người dùng thoát)
	 */
	@OnClose
	public void onClose(Session session) {
		// 1. Xóa session khỏi map
		sessions.remove(session.getId());

		// 2. Thông báo cho mọi người biết
		// Theo yêu cầu: "Someone left the chat!"
		this.broadcast("Someone left the chat!");
	}

	/**
	 * Xử lý lỗi
	 */
	@OnError
	public void onError(Session session, Throwable throwable) {
		try {
			if (session.isOpen()) {
				session.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		// In lỗi ra console server để debug
		throwable.printStackTrace();
	}
}
