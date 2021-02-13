
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Giris/uye_ol_sayfasi.dart';
import 'package:flutter_firebase/manager/ana_ekran.dart';

import '../user/form_user.dart';

class LoginIslemleri extends StatefulWidget {
  @override
  _LoginIslemleriState createState() => _LoginIslemleriState();
}

class _LoginIslemleriState extends State<LoginIslemleri> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController sifrecontroller = TextEditingController();
  String _email ="";
  String _password = "";
  var girisKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((User user) {
      if (user == null) {
        debugPrint('Giriş yapmış bir kullanıcı yok!');
      } else{
        debugPrint('Giriş Yapmış bir kullanıcı var Email: ${_auth.currentUser.email}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("FlatMarket", style: TextStyle(fontFamily: 'Font3',fontSize: 25),),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: girisKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: <Widget>[
              //Email giriş
              Container(
                child: TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "E mail",
                    labelText: "E mail",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    // standart hali
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  validator: (String girilenVeri){
                    if (!(girilenVeri.contains("@gmail.com")|| girilenVeri.contains("@hotmail.com") || girilenVeri.contains("@outlook.com") || girilenVeri.contains("@bil.omu.edu.tr"))){
                      return "Lütfen geçerli bir e mail giriniz";
                    }else {
                    return null;
                    }
                  },
                  onSaved: (girilenEmail){
                    if(girilenEmail.isEmpty){
                      debugPrint("durum if e düstü!!!!");
                      _showDialog();
                    }
                    _email = girilenEmail;
                  },
                ),
              ),
              SizedBox(height: 10),
              //Şifre Giriş
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Şifre",
                  labelText: "Şifre",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),

                ),
                validator: (String girilenVeri){
                  if(girilenVeri.length <= 6 ){
                    return "Şifre 6 karakterden az olamaz";
                  }else{
                  return null;
                  }
                },
                onSaved: (girilenSifre){
                  _password = girilenSifre;
                },

              ),
              SizedBox(height: 10),
              // GirişButonu

              RaisedButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  side: BorderSide(color: Colors.purple),
                ),
                icon: Icon(Icons.arrow_forward,color: Colors.white,),
                label: Text("Giriş Yap",style: TextStyle(color: Colors.white),),
                color: Colors.purple,
                onPressed: _emailSifreKullaniciGirisyap,
              ),
              //Üye ol Butonu
              RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    side: BorderSide(color: Colors.purple),
                  ),
                icon: Icon(Icons.person,color: Colors.white,),
                  label: Text("Üye Ol",style: TextStyle(color: Colors.white),),
                  color: Colors.purple,
                  onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => UyeOl(_auth)));
                  }),
              // cıkıs yap
              RaisedButton(
                child: Text("Kullanıcı oluştur"),
                onPressed: _cikisYap,
                color: Colors.deepOrange,
              ),
              RaisedButton(
                child: Text("Çıkış Yap"),
                onPressed: _cikisYap,
                color: Colors.deepOrange,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _emailSifreKullaniciGirisyap() async {
    girisKey.currentState.save();
    //debugPrint("save methodu calisti amaa ???");
    try {
        // eger giriş yapmış kullanıcı yoksa
        if (_auth.currentUser == null) {
          // Yönetici kontolü
          _firebaseFirestore.collection("yönetici").get().then((gelenVeri) async {
            //debugPrint("Okunması istenen değer: " + gelenVeri.docs[0].data().toString());
            for(int i= 0; i<gelenVeri.docs.length; i++){
              if((gelenVeri.docs[i].data()['Email']).toString() == _email){
                User _oturumAcanYonetici = (await _auth.signInWithEmailAndPassword(email: _email, password: _password)).user;
                //debugPrint("Login Sayfası oturum açan yonetici email:  "+ _oturumAcanYonetici.email);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AnaEkran(firebaseAuthManager: _auth)));
              }
            }
          });

          // Uye kontrolü
          _firebaseFirestore.collection("users").get().then((gelenVeri) async {
            for(int i=0; i< gelenVeri.docs.length; i++){
              if(gelenVeri.docs[i].data()['Email'].toString() == _email){
                User _oturumAcanUser = (await _auth.signInWithEmailAndPassword(email: _email, password: _password)).user;
                debugPrint(_oturumAcanUser.toString());
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserForm()));
              }
            }
          });
      } else {
        // giriş yapmış bir kullanıcı
        debugPrint("Zaten giriş yapmış bir kullanıcı var");
      }
    } catch (e) {
      debugPrint("Oturum Açarken HATA!:" + e.toString());
    }

  }

  void _cikisYap() async {
    try {
      // sistemde kullanıcı varsa çıkış yap
      if (_auth.currentUser != null) {
        debugPrint("${_auth.currentUser.email} sistemden çıkıyor");
        await _auth.signOut();
      } else {
        // sistemde zaten bir kullanıcı yoksa sorun yok
        debugPrint("Zaten oturum açmış bir kullanıcı yok");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _showDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Giriş Yap"),
            content: Text("Lütfen email ve şifrenizi kontrol edin..."),
            actions: <Widget>[
              FlatButton(
                child: Text("Tamam"),
                  onPressed: (){
                    girisKey.currentState.reset();
                    Navigator.of(context).pop();
                  },
                  ),
            ],
          );
        }
    );
  }
}



/*
Column(
          children: <Widget>[

            //yeni bir kullancı oluştur
            RaisedButton(
                child: Text("Email/Sifre User Create"),
                color: Colors.blueAccent,
                onPressed: _emailSifreKullaniciOlustur),
            // verilen bilgilerle giriş yap
            RaisedButton(
                child: Text("Email/Sifre User Login"),
                color: Colors.purpleAccent,
                onPressed: _emailSifreKullaniciGirisyap),
            // şifremi unuttum
            RaisedButton(
                child: Text("Şifremi Unuttum"),
                color: Colors.redAccent,
                onPressed: _resetPassword),
            // email güncelle
            RaisedButton(
                child: Text("Email Güncelle"),
                color: Colors.indigo,
                onPressed: _updateEmail),
            // şifre güncelle
            RaisedButton(
                child: Text("Şifremi Güncelle"),
                color: Colors.indigo,
                onPressed: _updatePassword),
            // çıkış yap
            RaisedButton(
                child: Text("Çıkış yap"),
                color: Colors.deepOrange,
                onPressed: _cikisYap),

          ],
        ),
*/

/*
              // verilen bilgilerle giriş yap
              RaisedButton(
                  child: Text("Email/Sifre User Login"),
                  color: Colors.purpleAccent,
                  onPressed: _emailSifreKullaniciGirisyap),
              // şifremi unuttum
              RaisedButton(
                  child: Text("Şifremi Unuttum"),
                  color: Colors.redAccent,
                  onPressed: _resetPassword),
              // email güncelle
              RaisedButton(
                  child: Text("Email Güncelle"),
                  color: Colors.indigo,
                  onPressed: _updateEmail),
              // şifre güncelle
              RaisedButton(
                  child: Text("Şifremi Güncelle"),
                  color: Colors.indigo,
                  onPressed: _updatePassword),
              // çıkış yap
              RaisedButton(
                  child: Text("Çıkış yap"),
                  color: Colors.deepOrange,
                  onPressed: _cikisYap),
                  */