import 'dart:io';
import 'package:flutter/material.dart';
import 'package:first_app/common/staticData.dart';
import 'package:first_app/uiComponents/common/CustomFloat.dart';
import 'package:first_app/uiComponents/common/CommonDrawer.dart';

class CommonScaffold extends StatelessWidget {

  final VoidCallback onSignedOut;
  final appTitle;
  final Widget bodyData;
  final showFAB;
  final showDrawer;
  final backGroundColor;
  final actionFirstIcon;
  final scaffoldKey;
  final showBottomNav;
  final floatingIcon;
  final centerDocked;
  final elevation;
  final isSearching;
  final VoidCallback floatingCb;

  CommonScaffold(
      {this.appTitle,
      this.bodyData,
      this.showFAB = false,
      this.showDrawer = false,
      this.backGroundColor,
      this.actionFirstIcon = Icons.search,
      this.scaffoldKey,
      this.showBottomNav = false,
      this.centerDocked = false,
      this.floatingIcon,
      this.floatingCb,
      this.elevation = 4.0,
      this.isSearching = false,
      this.onSignedOut
      });

  Widget myBottomBar() => new BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Ink(
          height: 50.0,
          decoration: new BoxDecoration(
              gradient: new LinearGradient(colors: staticData.appGradients)),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: double.infinity,
                child: new InkWell(
                  radius: 10.0,
                  splashColor: Colors.yellow,
                  onTap: () {},
                  child: Center(
                    child: new Text(
                      "List",
                      style: new TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              new SizedBox(
                width: 20.0,
              ),
              SizedBox(
                height: double.infinity,
                child: new InkWell(
                  onTap: () {},
                  radius: 10.0,
                  splashColor: Colors.yellow,
                  child: Center(
                    child: new Text(
                      "Subs",
                      style: new TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  //https://www.developerlibs.com/2018/06/flutter-apply-search-box-in-appbar.html
  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment =
        Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return new InkWell(
      onTap: () => scaffoldKey.currentState.openDrawer(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            const Text('Seach box'),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return new TextField(
      //controller: _searchQuery,
      //autofocus: true,
       maxLines: 1,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      //onChanged: updateSearchQuery,
    );
  }

  List<Widget> _buildActions() {
    // if (_isSearching) {
    // }
    return <Widget>[
      SizedBox(
        width: 5.0,
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(actionFirstIcon),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_vert),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    print("test");
    return Scaffold(
      key: scaffoldKey != null ? scaffoldKey : null,
      backgroundColor: backGroundColor != null ? backGroundColor : null,
      appBar: AppBar(
        elevation: elevation,
        backgroundColor: Colors.black,
        leading: isSearching ? const BackButton() : null,
        title: isSearching ? _buildSearchField() : _buildTitle(context), //Text(appTitle),
        actions: _buildActions(),
      ),
      drawer: showDrawer ? CommonDrawer(onSignedOut: onSignedOut) : null,
      body: bodyData,
      floatingActionButton: showFAB
          ? CustomFloat(
              builder: centerDocked
                  ? Text(
                      "5",
                      style: TextStyle(color: Colors.white, fontSize: 10.0),
                    )
                  : null,
              icon: floatingIcon,
              cfCallback: floatingCb,
            )
          : null,
      floatingActionButtonLocation: centerDocked
          ? FloatingActionButtonLocation.centerDocked
          : FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: showBottomNav ? myBottomBar() : null,
    );
  }
}
