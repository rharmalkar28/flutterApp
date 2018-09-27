import 'package:first_app/src/model/Subscriber.dart';

class SubscriberOperations {

  getSubscriberList() => <Subscriber>[
    Subscriber(name:"Sham Rastudi", address:"Panaji-Goa",plan: "Basic",street: "18 june Road" ),
    Subscriber(name:"alpha Rastudi", address:"Panaji-Goa",plan: "Basic",street: "19 june Road" ),
    Subscriber(name:"brata Rastudi", address:"Mapusa-Goa",plan: "Basic",street: "19 june Road" ),
  ];
}