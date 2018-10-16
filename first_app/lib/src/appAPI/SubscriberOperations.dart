import 'package:first_app/src/model/Subscriber.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubscriberOperations {

  getSubscriberList() => <Subscriber>[
        Subscriber(
            id: "1231233123",
            name: "Sham Rastudi",
            address: "Panaji-Goa",
            plan: "Basic",
            street: "18 june Road",
            balance: 100,
            ),
        Subscriber(
            id: "8908908907",
            name: "alpha Rastudi",
            address: "Panaji-Goa",
            plan: "Basic",
            street: "19 june Road",
            balance: 100,
            ),
        Subscriber(
            id: "1241241243",
            name: "brata Rastudi",
            address: "Mapusa-Goa",
            plan: "Basic",
            street: "19 june Road",
            balance: 100,
            ),
        Subscriber(
            id: "6786786785",
            name: "rama gaikwad",
            address: "pona-Goa",
            plan: "Basic",
            street: "19 june Road",
            balance: 100,
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

  addSubscriber() => () {

  };
}
