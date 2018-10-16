import 'dart:async';
import 'dart:io';
import 'package:first_app/src/model/Subscriber.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class baseNTsubscriber {
  // new Subscriber
  Future<String> addSubscriber(Subscriber subscriber);

  Future<List<Subscriber>> listSubscriber();
  // update Subscriber details
  Future<String> modifySubscriber();
  // update payment of muiltiple users [] ids
  Future<String> updatePaymentSubscribers();
}

class NTsubscriber implements baseNTsubscriber {
  String userId;
  Firestore db;

  List<Subscriber> dummy = <Subscriber>[
        Subscriber(
            id: "1231233123",
            name: "Sham Rastudi",
            address: "Panaji-Goa",
            plan: "Basic",
            street: "18 june Road",
            balance: 500,
            ),
        Subscriber(
            id: "8908908907",
            name: "alpha Rastudi",
            address: "Panaji-Goa",
            plan: "Basic",
            street: "19 june Road",
            balance: 400,
            ),
        Subscriber(
            id: "1241241243",
            name: "brata Rastudi",
            address: "Mapusa-Goa",
            plan: "Basic",
            street: "19 june Road",
            balance: 300,
            ),
        Subscriber(
            id: "6786786785",
            name: "rama gaikwad",
            address: "pona-Goa",
            plan: "Basic",
            street: "19 june Road",
            balance: 200,
            ),
        Subscriber(
            id: "6785675676",
            name: "barat kashi",
            address: "vasco-Goa",
            plan: "Basic",
            street: "19 june Road karma goa",
            balance: 100,
            ),
      ];

  NTsubscriber(this.userId, this.db);

  Future<String> addSubscriber(Subscriber subscriber) {
    // DocumentReference document = db.document("users/$userId");
    sleep(const Duration(seconds: 10));
    dummy.add(subscriber);
  }

  Future<List<Subscriber>> listSubscriber() async {
    sleep(const Duration(seconds: 10));
    return dummy;
  }

  Future<String> modifySubscriber() {}

  Future<String> updatePaymentSubscribers() {}
}
