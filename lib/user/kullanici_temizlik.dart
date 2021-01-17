import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/manager/urun.dart';

class KullaniciTemizlikUrunleri extends StatefulWidget {
  @override
  _KullaniciTemizlikUrunleriState createState() => _KullaniciTemizlikUrunleriState();
}

class _KullaniciTemizlikUrunleriState extends State<KullaniciTemizlikUrunleri> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  int _sayac = 0;
  String okunanUrunAd = "";
  String okunanUrunFiyat = "";
  String okunanUrunID = "";
  List<Urun> temizlikUrunleri;

  @override
  void initState() {
    super.initState();
    temizlikUrunleri = [];
    _firebaseFirestore.collection('Ürünler/TemizlikÜrünleri/Ürünler').get().then((gelenVeri) {
      for (int i = 0; i < gelenVeri.docs.length; i++) {
        okunanUrunID = gelenVeri.docs[i].data()['Ürün ID'];
        debugPrint(okunanUrunID);
        okunanUrunAd = gelenVeri.docs[i].data()['Ürün Adı'];
        debugPrint(okunanUrunAd);
        okunanUrunFiyat = gelenVeri.docs[i].data()['Ürün Fiyatı'];
        debugPrint(okunanUrunFiyat);
        temizlikUrunleri.add(Urun(urunID: okunanUrunID, ad: okunanUrunAd, fiyat: okunanUrunFiyat));
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
        title: Text("Temizlik Ürünleri"),
      ),
      body: ListView.builder(
        itemBuilder: _urunleriListele,
        itemCount: temizlikUrunleri.length,
      ),
    );
  }

  Widget _urunleriListele(BuildContext context, int index) {
    return Card(
      child: ExpansionTile(
        title: Text("Ürün Adı:" + temizlikUrunleri[index].ad),
        subtitle: Text("Ürün Fiyatı: " + temizlikUrunleri[index].fiyat),
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                color: Colors.red,
                icon: Icon(Icons.remove),
                onPressed: _sayacAzalt,
              ),
              Text("$_sayac", style: TextStyle(fontSize: 25)),
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