import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IlkEkran extends StatefulWidget {
  @override
  _IlkEkranState createState() => _IlkEkranState();
}

class _IlkEkranState extends State<IlkEkran> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String sebzeveMeyve ="";
  String etUrun ="";
  String sutUrun ="";
  String gidaUrun ="";
  String icecekUrun ="";
  String temizlikUrun ="";


  String kuryeBilgi1 ="";
  String kuryeBilgi2 = "";
  String kuryeBilgi3 = "";


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    urunBilgiGetir();
    kuryeBilgiGetir();
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 200,
            height: 350,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Text("Sebze Ve Meyve Ürünleri:" + "  ${sebzeveMeyve} Adet",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Text("Et ve Et Ürünleri:" + "  ${etUrun} Adet",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Text("Süt ve Süt Ürünleri:" + "  ${sutUrun} Adet",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Text("Gıda Ürünleri:" + "  ${gidaUrun} Adet",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Text("İçecek Ürünleri:" + "  ${icecekUrun} Adet",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Text("Temizlik Ürünleri:" + "  ${temizlikUrun} Adet",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 200,
            height: 215,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Text("Burak Aksu  : ${kuryeBilgi1}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Text("Hakan Dursun  :" + "${kuryeBilgi2}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Text("Enes Korkmaz  :" + "${kuryeBilgi3}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Future urunBilgiGetir() async {

    await _firebaseFirestore.collection('Ürünler/SebzeveMeyveler/Ürünler').get().then((value) => {
      sebzeveMeyve = value.docs.length.toString(),
    });
    await _firebaseFirestore.collection('Ürünler/EtÜrünleri/Ürünler').get().then((value) => {
      etUrun = value.docs.length.toString(),
    });
    await _firebaseFirestore.collection('Ürünler/SütÜrünleri/Ürünler').get().then((value) => {
      sutUrun = value.docs.length.toString(),
    });
    await _firebaseFirestore.collection('Ürünler/GidaÜrünleri/Ürünler').get().then((value) => {
      gidaUrun = value.docs.length.toString(),
    });
    await _firebaseFirestore.collection('Ürünler/İçecekÜrünleri/Ürünler').get().then((value) => {
      icecekUrun = value.docs.length.toString(),
    });
    await _firebaseFirestore.collection('Ürünler/TemizlikÜrünleri/Ürünler').get().then((value) => {
      temizlikUrun = value.docs.length.toString(),
    });
  }
  Future kuryeBilgiGetir() async{
    _firebaseFirestore.collection('Kuryeler').get().then((gelenVeri){
      kuryeBilgi1 = gelenVeri.docs[0].data()['Kurye YolBilgi'].toString();
    });
    _firebaseFirestore.collection('Kuryeler').get().then((gelenVeri){
      kuryeBilgi2 = gelenVeri.docs[1].data()['Kurye YolBilgi'].toString();
    });
    _firebaseFirestore.collection('Kuryeler').get().then((gelenVeri){
      kuryeBilgi3 = gelenVeri.docs[2].data()['Kurye YolBilgi'].toString();
    });
    }

}




// Ana sayfada ayıntılar görüntünelebilir
// Ekleme ve güncelleme işlemleri


// Yönetici neye ihtiyaç duyar ?



//3. Siparişleri Kuryelerle ilişkilendirmeye ihtiyaç duyar.
//