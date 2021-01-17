import 'package:flutter/material.dart';
import 'package:flutter_firebase/manager/drawermenu/drawer_menu.dart';
import 'package:flutter_firebase/manager/drawermenu/urun_islemleri.dart';
import 'package:flutter_firebase/manager/ilkEkran.dart';
import 'package:flutter_firebase/manager/profil.dart';
import 'package:flutter_firebase/manager/siparisler.dart';

import 'ilkEkran.dart';

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  int secilenmenuItem = 0;
  List<Widget> tumSayfalar;
  IlkEkran sayfaAna;
  Siparisler siparisler;
  Profil profil;

  @override
  void initState() {
    super.initState();
    sayfaAna = IlkEkran();
    siparisler = Siparisler();
    profil = Profil();
    tumSayfalar = [sayfaAna, siparisler, profil];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text(
          "Flat Market",
          style: TextStyle(fontFamily: "Font3",fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: tumSayfalar[secilenmenuItem],
      bottomNavigationBar: bottomNavMenu(),
    );
  }

  Theme bottomNavMenu() {
    return Theme(
      data: ThemeData(
        // bottom bar button ların renklerinin değiştirilmesi
        //primarySwatch: Colors.red,
        canvasColor: Colors.indigo,
        primaryColor: Colors.white,
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // button active olduğunda kullanılacak icon
              //activeIcon: Icon(Icons.call),
              label: "Ana sayfa",
              backgroundColor: Colors.indigoAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Siparişler",
              backgroundColor: Colors.deepOrange),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: secilenmenuItem,
        onTap: (index){
          setState(() {
            secilenmenuItem = index;
          });
        },
      ),
    );
  }
}
