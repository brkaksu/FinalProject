import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/manager/urun.dart';
import 'package:flutter_firebase/user/sepet.dart';

class KullaniciGidaUrunleri extends StatefulWidget {
  @override
  _KullaniciGidaUrunleriState createState() => _KullaniciGidaUrunleriState();
}

class _KullaniciGidaUrunleriState extends State<KullaniciGidaUrunleri> {

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  int _sayac = 0;
  String okunanUrunAd = "";
  String okunanUrunFiyat = "";
  String okunanUrunID = "";
  List<Urun> gidaUrunleri = List();
  Map<int, Urun> sepetUrunleri = Map<int, Urun>();

@override
void initState() {
  super.initState();
  for(int i = 0; i< 15; i++){
    gidaUrunleri.add(Urun(ad: "ad", fiyat: "fiyat", urunID: "id"));
  }
  _firebaseFirestore.collection('Ürünler/GidaÜrünleri/Ürünler').get().then((gelenVeri) {
    for (int i = 0; i < gelenVeri.docs.length; i++) {
      okunanUrunID = gelenVeri.docs[i].data()['Ürün ID'];
      debugPrint(okunanUrunID);
      okunanUrunAd = gelenVeri.docs[i].data()['Ürün Adı'];
      debugPrint(okunanUrunAd);
      okunanUrunFiyat = gelenVeri.docs[i].data()['Ürün Fiyatı'];
      debugPrint(okunanUrunFiyat);
      gidaUrunleri[i] = Urun(urunID: okunanUrunID, ad: okunanUrunAd, fiyat: okunanUrunFiyat);
    }
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Gıda Ürünleri"),),
    body: ListView(
      children: <Widget>[
        Container(
          child: Card(
            child: ExpansionTile(
              title: Text(gidaUrunleri[0].ad),
              subtitle: Text(gidaUrunleri[0].fiyat +"₺"),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.remove),
                      onPressed: _sayacAzalt,
                    ),
                    Text("$_sayac kg", style: TextStyle(fontSize: 25)),
                    IconButton(
                      color: Colors.green,
                      icon: Icon(Icons.add),
                      onPressed: _sayacArttir,
                    ),
                    SizedBox(width: 60,),
                    RaisedButton.icon(
                      label: Text("Sepete Ekle",style: TextStyle(color: Colors.white),),
                      color: Colors.purple,
                      icon: Icon(Icons.shopping_cart,color: Colors.white,),
                      onPressed: (){
                        sepetUrunleri[0] = Urun(ad: gidaUrunleri[0].ad, fiyat: gidaUrunleri[0].fiyat, odenecekTutar: _sayac * double.parse(gidaUrunleri[0].fiyat));
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Sepet(gelenVeriler: sepetUrunleri,)));
                        _sayac = 0;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Card(
            child: ExpansionTile(
              title: Text(gidaUrunleri[1].ad),
              subtitle: Text(gidaUrunleri[1].fiyat +"₺"),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.remove),
                      onPressed: _sayacAzalt,
                    ),
                    Text("$_sayac kg", style: TextStyle(fontSize: 25)),
                    IconButton(
                      color: Colors.green,
                      icon: Icon(Icons.add),
                      onPressed: _sayacArttir,
                    ),
                    SizedBox(width: 60,),
                    RaisedButton.icon(
                      label: Text("Sepete Ekle",style: TextStyle(color: Colors.white),),
                      color: Colors.purple,
                      icon: Icon(Icons.shopping_cart,color: Colors.white,),
                      onPressed: (){
                        sepetUrunleri[1] = Urun(ad: gidaUrunleri[1].ad, fiyat: gidaUrunleri[1].fiyat, odenecekTutar: _sayac * double.parse(gidaUrunleri[1].fiyat));
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Sepet(gelenVeriler: sepetUrunleri,)));
                        _sayac = 0;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Card(
            child: ExpansionTile(
              title: Text(gidaUrunleri[2].ad),
              subtitle: Text(gidaUrunleri[2].fiyat +"₺"),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.remove),
                      onPressed: _sayacAzalt,
                    ),
                    Text("$_sayac kg", style: TextStyle(fontSize: 25)),
                    IconButton(
                      color: Colors.green,
                      icon: Icon(Icons.add),
                      onPressed: _sayacArttir,
                    ),
                    SizedBox(width: 60,),
                    RaisedButton.icon(
                      label: Text("Sepete Ekle",style: TextStyle(color: Colors.white),),
                      color: Colors.purple,
                      icon: Icon(Icons.shopping_cart,color: Colors.white,),
                      onPressed: (){
                        sepetUrunleri[2] = Urun(ad: gidaUrunleri[2].ad, fiyat: gidaUrunleri[2].fiyat, odenecekTutar: _sayac * double.parse(gidaUrunleri[2].fiyat));
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Sepet(gelenVeriler: sepetUrunleri)));
                        _sayac = 0;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


void _sayacArttir() {
  setState(() {
    _sayac++;
  });
}

void _sayacAzalt() {
  setState(() {
    if(_sayac > 0){
      _sayac--;
    }
  });
}


}