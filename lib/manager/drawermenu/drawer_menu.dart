import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/flutter_firebase/lib/manager/drawermenu/urun_islemleri.dart';

// Buraya firebase bağlantısı eklenerek giriş yapan kullanıcının bilgilerinin gösterilmesi gerekli.

class DrawerMenu extends StatefulWidget {
  FirebaseAuth firebaseAuthYonetici;
  DrawerMenu({this.firebaseAuthYonetici});
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  void initState() {
    super.initState();
    //debugPrint("Drawer classında yönetici email kontrol" + widget.firebaseAuthYonetici.currentUser.email);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Burak Aksu"),
            accountEmail: Text("brk.aksu60@gmail.com\n(Yönetici)"),
            currentAccountPicture: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              //borderRadius: BorderRadius.all(Radius.circular(20.0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/ekran2.png"),
              )
            ),
          ),
        ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "/Urunislemleri");
            },
            highlightColor: Colors.blue,
            //splashColor: Colors.red,
            child: ListTile(
              leading: Icon(Icons.add_business_outlined),
              title: Text("Ürün işlemleri"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "/KuryeIslemleri");
            },
            highlightColor: Colors.blue,
            //splashColor: Colors.red,
            child: ListTile(
              leading: Icon(Icons.sports_motorsports_rounded),
              title: Text("Kurye işlemleri"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          InkWell(
            onTap: _showDialog,
            highlightColor: Colors.blue,
            //splashColor: Colors.red,
            child: ListTile(
              leading: Icon(Icons.power_settings_new_outlined),
              title: Text("Çıkış Yap"),
            ),
          ),
        ],
      ),
    );
  }
  void _cikisYap() async {
    try {
      if (widget.firebaseAuthYonetici.currentUser != null) {
        debugPrint("${widget.firebaseAuthYonetici.currentUser.email} çıkış yapıyor...");
        await widget.firebaseAuthYonetici.signOut();
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, "/Login");
      } else {
        // sistemde zaten bir kullanıcı yoksa sorun yok
        debugPrint("Zaten oturum açmış bir kullanıcı yok");
      }
    } catch (e) {
      debugPrint("HATA!:" + e.toString());
    }
  }

  void _showDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Çıkış Yap"),
            content: Text("Emin misiniz?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Evet"),
                onPressed: _cikisYap,
              ),
              FlatButton(
                child: Text("Hayır"),
                onPressed: (){
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
Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          UserAccountsDrawerHeader(
            accountName: Text("Burak Aksu"),
            accountEmail: Text("burakaksu576@gmail.com"),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/ekran1.png"),
                  )
              ),

            ),
          ),
          Divider(height: 10),
          Expanded(
            child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UrunIslemleri()));
                    Navigator.pop(context);
                  },
                  highlightColor: Colors.blue,
                  //splashColor: Colors.red,
                  child: ListTile(
                    leading: Icon(Icons.add_business_outlined),
                    title: Text("Ürün işlemleri"),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  highlightColor: Colors.blue,
                  //splashColor: Colors.red,
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Kurye işlemleri"),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                ),
              ],
            ),
          ),

        ],

      ),
    )
*/