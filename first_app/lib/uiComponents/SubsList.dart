import 'package:flutter/material.dart';
import 'package:first_app/uiComponents/common/CommonScaffold.dart';
import 'package:first_app/src/model/Subscriber.dart';
import 'package:first_app/Controller/SubscriberCtl.dart';

class SubsList extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget subscriberGrid(List<Subscriber> subscribers) => ListView(
        shrinkWrap: true,
        children: subscribers
            .map((subscriber) => new ChildCard(
                name: subscriber.name,
                address: subscriber.address,
                plan: subscriber.plan,
                street: subscriber.street))
            .toList(),
      );

  Widget bodyData() {
    SubscriberCtl subscriberCtl = SubscriberCtl();
    return StreamBuilder<List<Subscriber>>(
        stream: subscriberCtl.subscriberList,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? subscriberGrid(snapshot.data)
              : Center(child: CircularProgressIndicator());
        });
  }

  void showSnackBar() {
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        "Added",
      ),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      scaffoldKey: scaffoldKey,
      appTitle: "Subscribers",
      showDrawer: true,
      showFAB: false,
      isSearching: true,
      actionFirstIcon: Icons.search,
      bodyData: bodyData(),
    );
  }
}

class ChildCard extends StatelessWidget {
  final String name, address, street, plan;

  ChildCard({this.name, this.address, this.street, this.plan});

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
           // leading: const Icon(Icons.album),
            title: new Text(this.name),
            subtitle: new Text("${this.street}, ${this.address}}"),
          ),
          new ButtonTheme.bar(
            // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: const Text('Details'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
