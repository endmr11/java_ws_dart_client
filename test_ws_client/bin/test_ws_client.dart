import 'dart:convert';

import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

void main(List<String> arguments) {
  late StompClient client;

  void onConnectCallback(StompFrame connectFrame) {
    print(">>>>> connection: ${connectFrame.command}");
    client.subscribe(
      destination: '/topic/createOrderResponse',
      headers: {},
      callback: (frame) {
        print(">>>>> gelen mesaj ${utf8.decode(frame.binaryBody!)}");
      },
    );

    client.send(
      destination: '/topic/createOrderResponse',
      body: 'Your message body',
      headers: {},
    );
  }

  client = StompClient(config: StompConfig(url: 'ws://localhost:8080/ws', onConnect: onConnectCallback));
  client.activate();
}
