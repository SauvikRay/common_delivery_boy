import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';
import 'package:wholesale_delivery_boy/screens/main.dart';

import '../helpers/auth_helper.dart';
import '../helpers/shared_value_helper.dart';
import '../screens/cancelled_delivery.dart';
import '../screens/collection.dart';
import '../screens/completed_delivery.dart';
import '../screens/login.dart';
import '../screens/pending.dart';


class MainDrawer extends StatefulWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {


  onTapLogout(context) async {
    AuthHelper().clearUserData();

    /*
    var logoutResponse = await AuthRepository()
            .getLogoutResponse();


    if(logoutResponse.result == true){
         ToastComponent.showDialog(logoutResponse.message, context,
                   gravity: Toast.center, duration: Toast.lengthLong);
         }
         */
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Login();
    }));
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              is_logged_in.$ == true
                  ? ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "${avatar_original.$}",
                    ),
                  ),
                  title: Text("${user_name.$}"),
                  subtitle:
                  user_email.$ != "" && user_email.$ != null
                      ? Text("${user_email.$}")
                      : Text("${user_phone.$}"))
                  : const Text('Not logged in',
                  style: TextStyle(
                      color: Color.fromRGBO(153, 153, 153, 1),
                      fontSize: 14)),
              const Divider(),
              ListTile(
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/dashboard.png",
                      height: 16, color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('Dashboard',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return MainScreen();
                        }));

                    // pop(context);
                    // slideRightWidget(
                    //   newPage: Main(),
                    //   context: context,
                    // );


                  }),
              is_logged_in.$ == true
                  ? ListTile(
                  visualDensity:
                  const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/tick_circle.png",
                      height: 16, color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('Completed Delivery',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return CompletedDelivery(show_back_button: true);
                        }));
                    // pop(context);
                    // slideRightWidget(
                    //   newPage: CompletedDelivery(show_back_button: true),
                    //   context: context,
                    // );
                  })
                  : Container(),
              is_logged_in.$ == true
                  ? ListTile(
                  visualDensity:
                  const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/clock_circle.png",
                      height: 16, color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('Pending Delivery',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const Pending();
                        }));

                    // pop(context);
                    // slideRightWidget(
                    //   newPage: Pending(),
                    //   context: context,
                    // );
                  })
                  : Container(),
              is_logged_in.$ == true
                  ? ListTile(
                  visualDensity:
                  const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/cross_circle.png",
                      height: 16, color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('Cancelled Delivery',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return CancelledDelivery(show_back_button: true);
                        }));

                    // pop(context);
                    // slideRightWidget(
                    //   newPage: CancelledDelivery(show_back_button: true),
                    //   context: context,
                    // );
                  })
                  : Container(),
              is_logged_in.$ == true
                  ? ListTile(
                  visualDensity:
                  const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/dollar_circle.png",
                      height: 16, color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('My Collection',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Collection(show_back_button: true);
                        }));
                    // pop(context);
                    // slideRightWidget(
                    //   newPage: Collection(show_back_button: true),
                    //   context: context,
                    // );
                  })
                  : Container(),
              is_logged_in.$ == true
                  ? ListTile(
                  visualDensity:
                  const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/profile.png",
                      height: 16, color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('Profile',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {
                    /*Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Profile(show_back_button: true);
                        }));*/
                  })
                  : Container(),
              const Divider(),
              is_logged_in.$ == false
                  ? ListTile(
                  visualDensity:
                  const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/login.png",
                      height: 16, color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('Login',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                    // pop(context);
                    // slideRightWidget(
                    //   newPage: Login(),
                    //   context: context,
                    // );
                  })
                  : Container(),
              is_logged_in.$ == true
                  ? ListTile(
                  visualDensity:
                  const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Image.asset("assets/logout.png",
                      height: 16, color: const Color.fromRGBO(153, 153, 153, 1)),
                  title: const Text('Logout',
                      style: TextStyle(
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontSize: 14)),
                  onTap: () {
                    onTapLogout(context);
                  })
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}


