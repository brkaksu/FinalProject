import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/manager/urun.dart';
import 'package:flutter_firebase/user/sepet.dart';

class KullaniciSebzeveMeyve extends StatefulWidget {
  @override
  _KullaniciSebzeveMeyveState createState() => _KullaniciSebzeveMeyveState();
}

class _KullaniciSebzeveMeyveState extends State<KullaniciSebzeveMeyve> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  double _sayac = 0;
  String okunanUrunAd = "";
  String okunanUrunFiyat = "";
  String okunanUrunID = "";
  List<Urun> sebzeler = List();
  List<double> _sayaclar = List();
  Map<int, Urun> sepetUrunleri = Map<int, Urun>();

  @override
  void initState() {
    super.initState();
    for(int i = 0; i< 15; i++){
      sebzeler.add(Urun(ad: "ad", fiyat: "fiyat", urunID: "id"));
    }
    for(int i = 0; i< 10; i++){
      _sayaclar.add(0.0);
    }
      _firebaseFirestore.collection('Ürünler/SebzeveMeyveler/Ürünler').get().then((gelenVeri) {
        for (int i = 0; i < gelenVeri.docs.length; i++) {
          okunanUrunID = gelenVeri.docs[i].data()['Ürün ID'];
          //debugPrint(okunanUrunID);
          okunanUrunAd = gelenVeri.docs[i].data()['Ürün Adı'];
          //debugPrint(okunanUrunAd);
          okunanUrunFiyat = gelenVeri.docs[i].data()['Ürün Fiyatı'];
          //debugPrint(okunanUrunFiyat);
          sebzeler[i] = Urun(urunID: okunanUrunID, ad: okunanUrunAd, fiyat: okunanUrunFiyat);
        }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          //IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
            //Navigator.pushNamed(context, "/Sepet");
          //}),
        ],
        title: Text("Sebzeler ve Meyveler"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Card(
              child: ExpansionTile(
                title: Text(sebzeler[0].ad),
                subtitle: Text(sebzeler[0].fiyat +"₺"),
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
                      SizedBox(width: 60),
                      RaisedButton.icon(
                        label: Text("Sepete Ekle",style: TextStyle(color: Colors.white),),
                        color: Colors.purple,
                        icon: Icon(Icons.shopping_cart,color: Colors.white,),
                        onPressed: (){
                          sepetUrunleri[0] = Urun(ad: sebzeler[0].ad, fiyat: sebzeler[0].fiyat, odenecekTutar: _sayac * double.parse(sebzeler[0].fiyat));
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
                title: Text(sebzeler[1].ad),
                subtitle: Text(sebzeler[1].fiyat +"₺"),
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
                      SizedBox(width: 60),
                      RaisedButton.icon(
                        label: Text("Sepete Ekle",style: TextStyle(color: Colors.white),),
                        color: Colors.purple,
                        icon: Icon(Icons.shopping_cart,color: Colors.white,),
                        onPressed: (){
                          sepetUrunleri[1] = Urun(ad: sebzeler[1].ad, fiyat: sebzeler[1].fiyat, odenecekTutar: _sayac * double.parse(sebzeler[1].fiyat));
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
                title: Text(sebzeler[2].ad),
                subtitle: Text(sebzeler[2].fiyat +"₺"),
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
                          sepetUrunleri[2] = Urun(ad: sebzeler[2].ad, fiyat: sebzeler[2].fiyat, odenecekTutar: _sayac * double.parse(sebzeler[2].fiyat));
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
        ],
      ),
    );
  }


   void _sayacArttir() {
    setState(() {
      _sayac += 1;
    });
  }

  void _sayacAzalt() {
    setState(() {
      if(_sayac > 0){
        _sayac -= 1;
      }
    });
  }


}

/*
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
              SizedBox(width: 120),

            ],
          ),
*/