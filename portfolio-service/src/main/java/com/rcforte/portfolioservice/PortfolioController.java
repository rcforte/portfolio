package com.rcforte.portfolioservice;

import lombok.extern.java.Log;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
@Log
public class PortfolioController {
  private final KafkaTemplate kafka;
  private final SimpMessagingTemplate broker;

  public PortfolioController(KafkaTemplate kafka, SimpMessagingTemplate broker) {
    this.kafka = kafka;
    this.broker = broker;
  }

  @MessageMapping("/portfolio")
  public Portfolio handle(Portfolio portfolio) {
    kafka.send("portfolio-analytics-input", portfolio);
    return portfolio;
  }

  @KafkaListener(topics = "portfolio-analytics-output")
  public void onReceived(Portfolio portfolio) {
    log.info("received from pyspark via kafka: " + portfolio);
    broker.convertAndSend("/topic/portfolio-analytics", portfolio);
  }
}
