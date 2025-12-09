
package com.poly.coder;

import java.io.IOException;

import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.model.Message;

public class MessageDecoder implements Decoder.Text<Message> {
	private static ObjectMapper mapper = new ObjectMapper();

	@Override
	public Message decode(String s) throws DecodeException {
		try {
			return mapper.readValue(s, Message.class);
		} catch (IOException e) {
			throw new DecodeException(s, "Unable to decode", e);
		}
	}

	@Override
	public boolean willDecode(String s) {
		return s != null && !s.trim().isEmpty();
	}

	@Override
	public void init(EndpointConfig config) {
	}

	@Override
	public void destroy() {
	}
}