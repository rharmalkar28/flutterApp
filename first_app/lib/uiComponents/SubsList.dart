import 'package:flutter/material.dart';
import 'package:first_app/uiComponents/common/CommonScaffold.dart';
import 'package:first_app/src/model/Subscriber.dart';
import 'package:first_app/Controller/SubscriberCtl.dart';
import 'package:first_app/src/serviceAPI/SubsProvider.dart';

class SubsList extends StatelessWidget {
  SubsList({this.onSignedOut});
  final VoidCallback onSignedOut;
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

  Widget bodyData(context) {
    SubscriberCtl subscriberCtl = SubscriberCtl();
    return StreamBuilder<List<Subscriber>>(
        stream: subscriberCtl.subscriberList,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? subscriberGrid(snapshot.data)
              : Center(child: CircularProgressIndicator());
        });

    // var subs = SubsProvider.of(context).NTsubscriber;
    // subs.listSubscriber().then((List<Subscriber> ab) {
    //   print("check list ${ab.length}");
    //   return subscriberGrid(ab);
    // });
    // print("check end");
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
        showFAB: true,
        floatingCb: () {
          print("test error");
        },
        isSearching: false,
        actionFirstIcon: Icons.search,
        bodyData: bodyData(context),
        onSignedOut: onSignedOut);
  }
}

class ChildCard extends StatelessWidget {
  final String name, address, street, plan;

  ChildCard({this.name, this.address, this.street, this.plan});

  void getSubsDetails(context) {
    print("in getSubsDetails");
    var subs = SubsProvider.of(context).NTsubscriber;
    subs.listSubscriber().then((List<Subscriber> ab) {
      print("check list $ab");
    });
  }

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
                  onPressed: () {
                    getSubsDetails(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
