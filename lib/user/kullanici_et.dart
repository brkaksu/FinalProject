import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/manager/urun.dart';
import 'package:flutter_firebase/user/sepet.dart';

class KullaniciEtUrunleri extends StatefulWidget {
  @override
  _KullaniciEtUrunleriState createState() => _KullaniciEtUrunleriState();
}

class _KullaniciEtUrunleriState extends State<KullaniciEtUrunleri> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  int _sayac = 0;
  String okunanUrunAd = "";
  String okunanUrunFiyat = "";
  String okunanUrunID = "";
  List<Urun> etUrunleri = List();
  Map<int, Urun> sepetUrunleri = Map<int, Urun>();

  @override
  void initState() {
    super.initState();
    for(int i = 0; i< 15; i++){
      etUrunleri.add(Urun(ad: "ad", fiyat: "fiyat", urunID: "id"));
    }
    _firebaseFirestore.collection('Ürünler/EtÜrünleri/Ürünler').get().then((gelenVeri) {
      for (int i = 0; i < gelenVeri.docs.length; i++) {
        okunanUrunID = gelenVeri.docs[i].data()['Ürün ID'];
        debugPrint(okunanUrunID);
        okunanUrunAd = gelenVeri.docs[i].data()['Ürün Adı'];
        debugPrint(okunanUrunAd);
        okunanUrunFiyat = gelenVeri.docs[i].data()['Ürün Fiyatı'];
        debugPrint(okunanUrunFiyat);
        etUrunleri[i] = Urun(urunID: okunanUrunID, ad: okunanUrunAd, fiyat: okunanUrunFiyat);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: _sepeteGit),
        ],
        title: Text("Et ve Et Ürünleri"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Card(
              child: ExpansionTile(
                title: Text(etUrunleri[0].ad),
                subtitle: Text(etUrunleri[0].fiyat +"₺"),
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
                          sepetUrunleri[0] = Urun(ad: etUrunleri[0].ad, fiyat: etUrunleri[0].fiyat, odenecekTutar: _sayac * double.parse(etUrunleri[0].fiyat));
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
                title: Text(etUrunleri[1].ad),
                subtitle: Text(etUrunleri[1].fiyat +"₺"),
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
                          sepetUrunleri[1] = Urun(ad: etUrunleri[1].ad, fiyat: etUrunleri[1].fiyat, odenecekTutar: _sayac * double.parse(etUrunleri[1].fiyat));
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

  Widget _urunleriListele(BuildContext context, int index) {
    return Card(
      child: ExpansionTile(
        title: Text("Ürün Adı:" + etUrunleri[index].ad),
        subtitle: Text("Ürün Fiyatı: " + etUrunleri[index].fiyat),
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
              SizedBox(width: 120),
              RaisedButton(
                child: Text("Sepete Ekle"),
                onPressed: _sepeteEkle,
              ),
            ],
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

  void _sepeteGit() {

  }

  void _sepeteEkle() {
    setState(() {
      _sayac = 0;
    });
  }
}