import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';

import '../my_theme.dart';
import 'assigned_delivery.dart';
import 'on_the_way_delivery.dart';
import 'picked_delivery.dart';

class Pending extends StatefulWidget {
  const Pending({super.key,  this.index=0});
  final int index;

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {

  
  int _currentIndex =0;
  var _children = [
    OnTheWayDelivery(show_back_button: true,),
    PickedDelivery(show_back_button: true,),
    AssignedDelivery(show_back_button: true,),
  ];

  void onTapped(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  void initState() {
    // TODO: implement initState
    //re appear statusbar in case it was not there in the previous page
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.initState();

    _currentIndex = widget.index;

  }

  onPop(value) {

  }


  @override
  Widget build(BuildContext context) {
     var screen_width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                .colorScheme.secondary,
            unselectedItemColor: Color.fromRGBO(153, 153, 153, 1),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/human_run.png",
                    color: _currentIndex == 0
                        ? MyTheme.red
                        : Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  label: "On the Way"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/press.png",
                    color: _currentIndex == 1
                        ? MyTheme.golden
                        : Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  label: "Picked"),

              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/sandclock.png",
                    color: _currentIndex == 2
                        ? MyTheme.blue
                        : Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  label:  "Assigned"),
            ],
          ),
        ),
      ),
    );
  
  }
}

