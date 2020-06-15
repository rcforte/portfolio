package com.rcforte.portfolioservice;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;

public class WebSocketHandler extends TextWebSocketHandler {

  @Override
  public void handleTextMessage(WebSocketSession session, TextMessage message) {
    try {
      session.sendMessage(message);
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }
}
