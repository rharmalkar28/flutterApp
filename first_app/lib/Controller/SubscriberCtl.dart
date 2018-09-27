import 'dart:async';
import 'package:first_app/src/appAPI/SubscriberOperations.dart';
import 'package:first_app/src/model/Subscriber.dart';

class SubscriberCtl {
  final SubscriberOperations subscriberOperations = SubscriberOperations();
  final subscriberStream = StreamController<List<Subscriber>>();
  Stream<List<Subscriber>> get subscriberList => subscriberStream.stream;

  SubscriberCtl() {
    subscriberStream.add(subscriberOperations.getSubscriberList());
  }
}
