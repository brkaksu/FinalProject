
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Giris/uye_ol_sayfasi.dart';
import 'package:flutter_firebase/giris_animasyon/pages/Info.dart';
import 'package:flutter_firebase/manager/ana_ekran.dart';

import '../user/form_user.dart';

 FirebaseAuth _auth = FirebaseAuth.instance;
  
class LoginIslemleri extends StatefulWidget {
  @override
  _LoginIslemleriState createState() => _LoginIslemleriState();
}

class _LoginIslemleriState extends State<LoginIslemleri> {
  String _email ="";
  String _password = "";
  var girisKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((User user) {
      // ilk girişte Giriş yapmış bir kullanıcı var ise sistemi boşaltıyor
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        _auth.signOut();
        print("User is currently signed out!");
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
        alignment: Alignment.center,
        child: Form(
          key: girisKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: <Widget>[
              //Email giriş
              TextFormField(
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
                  _email = girilenEmail;
                },
              ),
              SizedBox(height: 10),
              //Şifre Giriş
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
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
                icon: Icon(Icons.arrow_forward),
                label: Text("Giriş Yap"),
                onPressed: _emailSifreKullaniciGirisyap,
                color: Colors.blueAccent,
              ),

              //------------------------------
              //Üye ol sayfasi
              RaisedButton.icon(
                icon: Icon(Icons.person),
                  label: Text("Üye Ol"),
                  color: Colors.blueAccent,
                  onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => UyeOl(_auth)));
                  }),



            ],
          ),
        ),
      ),
    );
  }

  void _emailSifreKullaniciOlustur() async {
    String _email = "hakan.dursun@bil.omu.edu.tr";
    String _password = "password";

    try {
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      User _newUser = _credential.user;
      //debugPrint(_newUser.toString());
      await _newUser.sendEmailVerification();
      if (_auth.currentUser != null) {
        debugPrint("Size bir e mail yolladık lütfen onaylayın");
        await _auth.signOut();
        debugPrint("Kullanıcı sistemden atıldı.");
      }
    } catch (e) {
      debugPrint("**************HATA VAR!!!************");
      debugPrint(e.toString());
    }
  }

  void _emailSifreKullaniciGirisyap() async {
    //debugPrint(_auth.toString());
    girisKey.currentState.save();

    try {
      // eger giriş yapmış kullanıcı yoksa
      if (_auth.currentUser == null) {
        //debugPrint(_email + "--" +_password);

        //Yönetici
        if(_email =="brk.aksu60@gmail.com"){
          await _auth.signInWithEmailAndPassword(email: _email, password: _password);
          Navigator.push(context, MaterialPageRoute(builder: (context) => AnaEkran()));
        }else{
          if(_email == "burakaksu576@gmail.com" || _email == "hakandursun175@hotmail.com"){
            await _auth.signInWithEmailAndPassword(email: _email, password: _password);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Info()));
          }else{
            _showDialog();
          }
        }

      } else {
        // giriş yapmış bir kullanıcı
        debugPrint("Zaten giriş yapmış bir kullanıcı var");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _resetPassword() async {
    String _email = "burakaksu576@gmail.com";
    try {
      await _auth.sendPasswordResetEmail(email: _email);
    } catch (e) {
      debugPrint("HATA: Şifre resetlenirken " + e.toString() + "hatası ile karşılaşıldı");
    }
  }

  void _updatePassword() async {
    try {
      // Bu blok yakın zamanda oturum açılma işlemi gerçekleştirilmiş ise çalıştırılacaktır
      // şifre güncelleme işlemi  <updatePassword>
      await _auth.currentUser.updatePassword("password3");
      debugPrint("Şifre başarılı şekilde güncellendi");
    } catch (e) {

      // Bu blok ise yakın zamanda oturum açılmadığı için hata alıp çalışacaktır
      try{
        // tekrar kullanıcı adı ve şifre alınıyor
        String email = 'burakaksu576@gmail.com';
        String password = 'password3';

        // Yeni bir kimlik yaratılıyor.
        EmailAuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

        // tekrar oturum açma işlemi yapılıyor.
        await FirebaseAuth.instance.currentUser.reauthenticateWithCredential(credential);
        debugPrint("Girilen eski email ve şifre bilgisi doğru");
        // şifre güncelleme işlemi tekrar deneniyor
        await _auth.currentUser.updatePassword("password3");
        debugPrint("Şifre tekrar deneme sonucu başarılı şekilde güncellendi");
      }catch(e){
        debugPrint("HATA : ${e.toString()}");
      }
      debugPrint("HATA: Şifre güncellenirken" + e.toString() + "hatası ile karşılaşıldı");
    }
  }

  void _updateEmail() async {
    try {
      // emaili güncelle
      await _auth.currentUser.updateEmail("burakaksu576@gmail.com");
      debugPrint("Email başarılı şekilde güncellendi");
    } catch (e) {
      // Belli bir süre sonra kullanıcı önceden giriş yapmış olsa bile
      // sistem güncelleme için tekrar giriş yapmasını istiyor.
      // hata durumunda bu yapıya giren sistemi kullanıcının tekrar giriş yapması
      // sağlanarak işlemi başarılı bir şekilde yürütebiliyoruz.
      try{
        // kullanıcının tekrar email ve şifre bilgisi alınıyor.
        String email = 'burakaksu576@gmail.com';
        String password = 'password3';

        // Yeni bir kimlik oluşturuluyor.
        EmailAuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

        // oluşturulan kimlikle tekrar oturum açılıyor
        await FirebaseAuth.instance.currentUser.reauthenticateWithCredential(credential);

        debugPrint("Girilen eski email ve şifre bilgisi doğru");

        // e mail güncelleme işlemi tekrar deneniyor
        await _auth.currentUser.updateEmail("burakaksu576@gmail.com");
        debugPrint("Email tekrar deneme sonucu başarılı şekilde güncellendi");
      }catch(e){
        debugPrint("HATA: " + e.toString());
      }



      debugPrint("HATA: Email güncellenirken" + e.toString() + "hatası ile karşılaşıldı");
    }
  }

  void _cikisYap() async {
    try {
      // sistemde kullanıcı varsa çıkış yap
      if (_auth.currentUser != null) {
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
            content: Text("Sistemde kayıtlı değilsiniz\n Üye Olun"),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    girisKey.currentState.reset();
                    Navigator.of(context).pop();
                  },
                  child: Text("Tamam")),
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