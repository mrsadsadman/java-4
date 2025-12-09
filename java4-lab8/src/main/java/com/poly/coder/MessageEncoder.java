package com.poly.coder;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.poly.model.Message;

public class MessageEncoder implements Encoder.Text<Message> {
	private static ObjectMapper mapper = new ObjectMapper();

	@Override
	public String encode(Message message) throws EncodeException {
		try {
			return mapper.writeValueAsString(message);
		} catch (JsonProcessingException e) {
			throw new EncodeException(message, "Unable to encode", e);
		}
	}

	@Override
	public void init(EndpointConfig config) {
	}

	@Override
	public void destroy() {
	}
}