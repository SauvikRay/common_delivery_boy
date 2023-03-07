import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

import '../helpers/shared_value_helper.dart';
import 'login.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  var _children = [
    // Home(),
    // CompletedDelivery(),
    // Earnings(),
    // ProfileEdit()
    Text("AAAAA"),
    Text("BBBBB"),
    Text("CCCC"),
    Text("DDDD"),
  ];

  void onTapped(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  void initState() {
    // TODO: implement initState
    //re appear statusbar in case it was not there in the previous page
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.initState();

  }

  onPop(value) {

  }

  @override
  Widget build(BuildContext context) {
    return access_token.$.isNotEmpty? Scaffold(
      extendBody: true,
      body: _children[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //specify the location of the FAB
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: onTapped,
            currentIndex: _currentIndex,
            backgroundColor: Colors.white.withOpacity(0.8),
            fixedColor: Theme
                .of(context)
                .accentColor,
            unselectedItemColor: Color.fromRGBO(153, 153, 153, 1),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/dashboard.png",
                    color: _currentIndex == 0
                        ? Theme
                        .of(context)
                        .accentColor
                        : Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  label: "Dashboard"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/delivery.png",
                    color: _currentIndex == 1
                        ? Theme
                        .of(context).colorScheme
                        .secondary
                        : Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  label: "My Delivery"),

              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/earnings.png",
                    color: _currentIndex == 2
                        ? Theme
                        .of(context)
                        .accentColor
                        : Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  label: "My Earnings"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/profile.png",
                    color: _currentIndex == 3
                        ? Theme
                        .of(context)
                        .accentColor
                        : Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  label: "Profile"),
            ],
          ),
        ),
      ),
    ):Login();
  }
}
