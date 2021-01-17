import 'package:flutter/material.dart';
import 'package:flutter_firebase/user/form_user.dart';
import '../widgets/animated/ripple.dart';
import 'dart:async';

import '../routes/fadeInFadeOutRoute.dart';
import 'gecis.dart';

class Info extends StatefulWidget {
  Info({Key key}) : super(key: key);
  @override
  _State createState() => new _State();
}

class _State extends State<Info> {
  Duration duration = const Duration(seconds: 2);

  startTimeout() {
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    Navigator.pop(context);
    Navigator.push(
        context, FadeInFadeOutRoute(builder: (context) => new UserForm()));
  }

  initState() {
    super.initState();
    this.startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/ekran2.png"),
                fit: BoxFit.cover,
              )),
          child:  Center(
              child: Ripple(
                300,
                child: Text('FlatMarket',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 50.0, color: Colors.white,fontFamily: 'Font3'),),
              )),
        ));
  }

  dispose() {
    super.dispose();
  }
}