
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/manager/urun.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

final picker = ImagePicker();
class SebzeMeyve extends StatefulWidget {
  @override
  _SebzeMeyveState createState() => _SebzeMeyveState();
}

class _SebzeMeyveState extends State<SebzeMeyve> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController urunAdController = TextEditingController();
  TextEditingController urunFiyatController = TextEditingController();
  int index = 0;
  String urunID = "";
  String urunAdi = "default urun adi";
  String urunResim = "default resim";
  String urunFiyat = "";
  List<Urun> sebzeler = List();
  List<File> urunResimler = List();
  var formKey = GlobalKey<FormState>();
  File image;
  String okunanUrunAd ="";
  String okunanUrunFiyat ="";
  String okunanUrunID ="";
  Map<String, dynamic> sebzeUrunleri = Map();

  @override
   initState()  {
    super.initState();
    Urun(urunID: "asd", );
    for(int i = 0; i<10; i++){
      urunResimler.add(image);
    }
    _firebaseFirestore.collection('Ürünler/SebzeveMeyveler/Ürünler').get().then((gelenVeri){
        for(int i = 0 ; i<gelenVeri.docs.length ; i++){
          setState(() {
            okunanUrunID = gelenVeri.docs[i].data()['Ürün ID'];
            okunanUrunAd = gelenVeri.docs[i].data()['Ürün Adı'];
            okunanUrunFiyat = gelenVeri.docs[i].data()['Ürün Fiyatı'];
          });
          sebzeler.add(Urun(urunID: okunanUrunID, ad: okunanUrunAd, fiyat: okunanUrunFiyat));
        }
      });
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            mini: true,
            onPressed: (){
              _firebaseFirestore.collection('Ürünler/SebzeveMeyveler/Ürünler').get().then((gelenVeri){
                for(int i = 0 ; i<gelenVeri.docs.length ; i++){
                  setState(() {
                    okunanUrunID = gelenVeri.docs[i].data()['Ürün ID'];
                    okunanUrunAd = gelenVeri.docs[i].data()['Ürün Adı'];
                    okunanUrunFiyat = gelenVeri.docs[i].data()['Ürün Fiyatı'];
                  });
                  sebzeler.add(Urun(urunID: okunanUrunID, ad: okunanUrunAd, fiyat: okunanUrunFiyat));
                }
              });
            },
            heroTag: "update",
            child: Icon(Icons.arrow_circle_down_rounded),
          ),
          SizedBox(height: 530),
          FloatingActionButton(
            child: Icon(Icons.add),
            heroTag: "add",
            onPressed: () {
              urunID = (sebzeler.length +1).toString();
              if(formKey.currentState.validate()){
                formKey.currentState.save();
                formKey.currentState.reset();
              }
              // Firebase e yeni ürün ekleme işlemi gerçekleşiyor.
              _firebaseFirestore.collection('Ürünler').doc('SebzeveMeyveler').collection('Ürünler').doc('SM$urunID').set(sebzeUrunleriGetir());
              //image = null;
            },
          ),

        ],
      ),
      appBar: AppBar(
        title: Text("Sebze ve Meyve"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    // ÜRÜN ID GÖSTERİMİ
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(child: Text("Ürün ID: SM$urunID", style: TextStyle(fontSize: 20))),
                    ),
                    Divider(thickness:1,color: Colors.black,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // Ürün Adı
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 30, 10),
                          child: Text("Ürün Adı: ",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'ElYazisi',fontSize: 20,color: Colors.white),),
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: Colors.blue, width: 2),
                          ),

                        ),
                        // Ürün Adı Gir
                        Container(
                          width: 200,
                          height: 50,
                          padding: EdgeInsets.fromLTRB(2, 5, 2, 2),
                          child: TextFormField(
                            controller: urunAdController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                              labelText: "Urun Adı",
                              hintText: "Urun Adını Giriniz",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue,width: 4),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue, width: 4),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),

                              )
                            ),
                            validator: (girilendeger) {
                              if (girilendeger.length > 0) {
                                return null;
                              } else {
                                return "Urun adı boş olamaz";
                              }
                            },
                            onSaved: (kaydedilecekDeger) {
                              setState(() {
                                urunAdi = kaydedilecekDeger;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness:1,color: Colors.white),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // Ürün Fiyatı
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          padding: EdgeInsets.all(5.0),
                          child: Text("Urun Fiyatı: ",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontFamily: 'ElYazisi',color: Colors.white),),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: Colors.blue, width: 2),
                          ),
                        ),
                        // Ürün Fiyat Gir
                        Container(
                          width: 200,
                          height: 50,
                          padding: EdgeInsets.fromLTRB(2, 5, 2, 2),
                          child: TextFormField(
                            controller: urunFiyatController,
                            decoration: InputDecoration(
                              labelText: "Ürün Fiyatı",
                              hintText: "Urun Fiyat Giriniz",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue, width: 4),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue, width: 4),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            validator: (girilendeger) {
                              if (girilendeger.length > 0) {
                                return null;
                              } else {
                                return "Urun adı boş olamaz";
                              }
                            },
                            onSaved: (kaydedilecekDeger) {
                              setState(() {
                                urunFiyat = kaydedilecekDeger;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(thickness:1,color: Colors.black,),
            // URUNLERİN GÖSTERİLDİĞİ BÖLUM
            Expanded(
                child: ListView.builder(
              itemBuilder: _listeElemanOlustur,
              itemCount: sebzeler.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listeElemanOlustur(BuildContext context, int index) {
    return Card(
      child: ExpansionTile(
        title: Text("Ürün ID: SM${sebzeler[index].urunID}\n"+"Ürün adı: ${sebzeler[index].ad}"),
        subtitle: Text("Ürün Fiyatı: ${sebzeler[index].fiyat} " + "₺"),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text("Düzenle"),
                color: Colors.purple,
                onPressed: (){
                  setState(() {
                    urunAdController.text  = sebzeler[index].ad;
                    urunFiyatController.text = sebzeler[index].fiyat;
                    urunID = sebzeler[index].urunID;
                  });
                },
              ),
              RaisedButton(
                child: Text("Sil"),
                color: Colors.red,
                onPressed: (){
                  _firebaseFirestore.collection('Ürünler').doc('SebzeveMeyveler').collection('Ürünler').doc('SM${sebzeler[index].urunID}').delete();
                  sebzeler.removeWhere((element) => element.urunID == '$index');
                },
              ),
            ],
          ),
          RaisedButton(
            child: Text("Kaydet"),
            color: Colors.blue,
            onPressed: (){
              setState(() {
                formKey.currentState.save();
                //debugPrint(urunID + "--" + urunAdi + "--" + urunFiyat);
                _firebaseFirestore.collection('Ürünler').doc('SebzeveMeyveler').collection('Ürünler').doc('SM${sebzeler[index].urunID}').update({
                  'Ürün Adı' : '$urunAdi',
                  'Ürün Fiyatı' : '$urunFiyat',
                  'Ürün ID' : '$urunID',
                });
              });
            },
              ),
        ],
      ),
    );
  }

  void onImageButtonPressed(ImageSource source) async {
    try{
      await getImage(source);
    }catch(e){
      print(e);
    }
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      urunResimler.add(File(pickedFile.path));
      image = File(pickedFile.path);
      debugPrint("Resim yolu listeye eklendi yol : ${pickedFile.path}");
    });
  }

  Map<String, dynamic> sebzeUrunleriGetir() {
    sebzeUrunleri['Ürün ID'] = urunID;
    sebzeUrunleri['Ürün Adı'] = urunAdi;
    sebzeUrunleri['Ürün Fiyatı'] = urunFiyat;
    return sebzeUrunleri;
  }
  Future _verioku() async{
    try{
      DocumentSnapshot documentSnapshot = await _firebaseFirestore.doc("Ürünler/SebzeveMeyveler/Sebzeler/$urunAdi").get();
        //okunanUrunAd = documentSnapshot.data()['Ürün Adı'];
        //debugPrint("Okunan veri ad:  "+okunanUrunAd);
        //okunanUrunFiyat = documentSnapshot.data()['Ürün Fiyatı'];
        //debugPrint(okunanUrunFiyat);
        //okunanUrunID = documentSnapshot.data()['Ürün ID'];
        //debugPrint(okunanUrunID);
      // = documentSnapshot.data()['Ürün Adı'];
      //debugPrint(documentSnapshot.data()['Ürün Adı']);
      //okunanUrunFiyat = documentSnapshot.data()['Ürün Fiyatı'];
      //debugPrint(documentSnapshot.data()['Ürün Fiyatı']);
    }catch(e){
      print(e);
    }

  }
}

/*
ListTile(
        leading: Icon(Icons.person),
        title: Text("Ürün ID: ${tumUrunler[index].urunID}\n"+"Ürün adı: "+tumUrunler[index].ad),
        subtitle: Text("Ürün Fiyatı: " + tumUrunler[index].fiyat.toString() + "₺",),
      )
*/

