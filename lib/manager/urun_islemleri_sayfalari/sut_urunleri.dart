import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/manager/urun.dart';
import 'package:image_picker/image_picker.dart';

final picker = ImagePicker();
class SutVeSutUrunleri extends StatefulWidget {
  @override
  _SutVeSutUrunleriState createState() => _SutVeSutUrunleriState();
}

class _SutVeSutUrunleriState extends State<SutVeSutUrunleri> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController urunAdController = TextEditingController();
  TextEditingController urunFiyatController = TextEditingController();
  int index = 0;
  String urunID = "";
  String urunAdi = "default urun adi";
  String urunResim = "default resim";
  String urunFiyat = "";
  List<Urun> sutUrunler;
  List<File> urunResimler;
  var formKey = GlobalKey<FormState>();
  File image;
  String okunanUrunAd ="";
  String okunanUrunFiyat ="";
  String okunanUrunID ="";
  Map<String, dynamic> sutUrunleriMap = Map();

  @override
  void initState() {
    super.initState();
    sutUrunler = [];
    _firebaseFirestore.collection('Ürünler/SütÜrünleri/Ürünler').get().then((gelenVeri){
      for(int i = 0 ; i<gelenVeri.docs.length ; i++){
        //debugPrint(gelenVeri.docs[i].data()['Ürün Adı']);
        okunanUrunID = gelenVeri.docs[i].data()['Ürün ID'];
        //debugPrint(okunanUrunID);
        okunanUrunAd = gelenVeri.docs[i].data()['Ürün Adı'];
        //debugPrint(okunanUrunAd);
        okunanUrunFiyat = gelenVeri.docs[i].data()['Ürün Fiyatı'];
        //debugPrint(okunanUrunFiyat);
        //gecici.add(Urun(ad: okunanUrunAd, fiyat: okunanUrunFiyat, urunID:okunanUrunID));
        sutUrunler.add(Urun(urunID: okunanUrunID, ad: okunanUrunAd, fiyat: okunanUrunFiyat));
      }
    });
    //urunResimler = [];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          urunID = (sutUrunler.length +1).toString();
          if(formKey.currentState.validate()){
            formKey.currentState.save();
            formKey.currentState.reset();
          }
          _firebaseFirestore.collection('Ürünler').doc('SütÜrünleri').collection('Ürünler').doc('ST${urunID}').set(sutUrunleriGetir());
          image = null;
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Süt ve Süt Ürünleri"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // URUN RESİNLERİNİN GÖSTERİLDİĞİ BÖLUM
            SizedBox(height: 50),
            // URUNLERİN GİRİLDİGİ BOLUM
            Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(child: Text("Ürün ID: ST${urunID}", style: TextStyle(fontSize: 20))),
                    ),
                    Divider(thickness:1,color: Colors.black,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text("Ürün Adı: ",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'ElYazisi',fontSize: 20,color: Colors.white),),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: Colors.blue, width: 2),
                          ),
                          margin: EdgeInsets.fromLTRB(10, 10, 30, 10),
                        ),
                        Container(
                          width: 200,
                          height: 50,
                          child: TextFormField(
                            controller: urunAdController,
                            decoration: InputDecoration(
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
                    Divider(thickness:1,color: Colors.white,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text("Urun Fiyatı: ",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontFamily: 'ElYazisi',color: Colors.white),),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            border: Border.all(color: Colors.blue, width: 2),
                          ),
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        ),
                        Container(
                          width: 200,
                          height: 50,
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
                                //sutUrunler.add(Urun(urunID: urunID,ad: urunAdi, fiyat: urunFiyat, resmi: urunResim));
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
                itemCount: sutUrunler.length,
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
        title: Text("Ürün ID: ST${sutUrunler[index].urunID}\n"+"Ürün adı: "+sutUrunler[index].ad),
        subtitle: Text("Ürün Fiyatı: " + sutUrunler[index].fiyat.toString() + "₺"),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text("Düzenle"),
                color: Colors.purple,
                onPressed: (){
                  setState(() {
                    urunAdController.text  = sutUrunler[index].ad;
                    urunFiyatController.text = sutUrunler[index].fiyat;
                    urunID = sutUrunler[index].urunID;
                  });

                },
              ),
              RaisedButton(
                child: Text("Sil"),
                color: Colors.red,
                onPressed: (){
                  _firebaseFirestore.collection('Ürünler').doc('SütÜrünleri').collection('Ürünler').doc('ST${sutUrunler[index].urunID}').delete();
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
                _firebaseFirestore.collection('Ürünler').doc('SütÜrünleri').collection('Ürünler').doc('ST${sutUrunler[index].urunID}').update({
                  'Ürün Adı' : '${urunAdi}',
                  'Ürün Fiyatı' : '${urunFiyat}',
                  'Ürün ID' : '${urunID}',
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
  Map<String, dynamic> sutUrunleriGetir() {
    sutUrunleriMap['Ürün ID'] = urunID;
    sutUrunleriMap['Ürün Adı'] = urunAdi;
    //debugPrint("Yazdırılan ürün adı:"+urunAdi);
    sutUrunleriMap['Ürün Fiyatı'] = urunFiyat;
    //debugPrint("Yazdırılan ürün fiyatı:"+urunFiyat);
    return sutUrunleriMap;
  }
}

