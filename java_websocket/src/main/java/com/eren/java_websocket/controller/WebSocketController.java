package com.eren.java_websocket.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class WebSocketController {

    @MessageMapping("/createOrderSend")
    @SendTo("/topic/createOrderResponse")
    public String createOrder(String orderDetails) {
        return orderDetails;
    }

    @MessageMapping("/updateOrderSend")
    @SendTo("/topic/updateOrderResponse")
    public String updateOrder(String orderDetails) {
        return orderDetails;
    }

    @MessageMapping("/deleteOrderSend")
    @SendTo("/topic/deleteOrderResponse")
    public String deleteOrder(String orderDetails) {
        return orderDetails;
    }
}
