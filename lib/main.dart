import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/user/form_user.dart';
import 'package:flutter_firebase/user/kullanici_et.dart';
import 'package:flutter_firebase/user/kullanici_gida.dart';
import 'package:flutter_firebase/user/kullanici_icecek.dart';
import 'package:flutter_firebase/user/kullanici_sebze_meyve.dart';
import 'package:flutter_firebase/user/kullanici_sut.dart';
import 'package:flutter_firebase/user/kullanici_temizlik.dart';
import 'package:flutter_firebase/user/sepet.dart';
import 'file:///D:/AndroidStudioProjects/flutter_firebase/lib/Giris/login_islemleri.dart';
import 'giris_animasyon/pages/Info.dart';
import 'manager/ana_ekran.dart';
import 'manager/urun_islemleri_sayfalari/et_ve_et_urunleri.dart';
import 'manager/urun_islemleri_sayfalari/gıda_urunleri.dart';
import 'manager/urun_islemleri_sayfalari/icecek_urunleri.dart';
import 'manager/kurye_islemleri.dart';
import 'manager/urun_islemleri_sayfalari/sebze_meyve.dart';
import 'manager/urun_islemleri_sayfalari/sut_urunleri.dart';
import 'manager/urun_islemleri_sayfalari/temizlik_urunleri.dart';
import 'manager/drawermenu/urun_islemleri.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/" : (context) => App(),
        "/AnaEkran" : (context) => AnaEkran(),
        "/Urunislemleri" : (context) => UrunIslemleri(),
        "/KuryeIslemleri" : (context) => KuryeIslemleri(),
        "/SebzeVeMeyve" : (BuildContext context) => SebzeMeyve(),
        "/EtVeEtUrunleri" : (context) => EtveEtUrunleri(),
        "/SutVeSutUrunleri" : (context) => SutVeSutUrunleri(),
        "/Gıda" : (context) => GidaUrunleri(),
        "/Icecek" : (context) => IcecekUrunleri(),
        "/Temizlik" : (context) => TemizlikUrunleri(),
        "/KullaniciSebze" : (context) => KullaniciSebzeveMeyve(),
        "/KullaniciEt" : (context) => KullaniciEtUrunleri(),
        "/KullaniciSut" : (context) => KullaniciSutUrunleri(),
        "/KullaniciGida" : (context) => KullaniciGidaUrunleri(),
        "/KullaniciIcecek" : (context) => KullaniciIcecekUrunleri(),
        "/KullaniciTemizlik" : (context) => KullaniciTemizlikUrunleri(),
        "/Sepet" : (context) => Sepet(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("HATA !!!:" + snapshot.error.toString()),
            ),
          );
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return AnaEkran();
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}


