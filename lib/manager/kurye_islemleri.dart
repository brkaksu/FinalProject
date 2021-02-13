import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/manager/urun.dart';
import 'package:image_picker/image_picker.dart';

final picker = ImagePicker();
class KuryeIslemleri extends StatefulWidget {
  @override
  _KuryeIslemleriState createState() => _KuryeIslemleriState();
}

class _KuryeIslemleriState extends State<KuryeIslemleri> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController kuryeAdController = TextEditingController();
  TextEditingController kuryeTelNoController = TextEditingController();
  int index = 0;
  String urunID = "";
  String urunAdi = "default urun adi";
  String urunResim = "default resim";
  String urunFiyat = "";
  List<Urun> tumKuryeler;
  List<File> urunResimler;
  var formKey = GlobalKey<FormState>();
  File image;
  String okunanKuryeAd ="";
  String okunanKuryeTelNo ="";
  String okunanKuryeID ="";
  Map<String, dynamic> kuryelerMap = Map();

  @override
  void initState() {
    super.initState();
    tumKuryeler = [];
    _firebaseFirestore.collection('Kuryeler').get().then((gelenVeri){
      for(int i = 0 ; i<gelenVeri.docs.length ; i++){
        setState(() {
          okunanKuryeID = gelenVeri.docs[i].data()['Kurye ID'];
          okunanKuryeAd = gelenVeri.docs[i].data()['Kurye Adı'];
          okunanKuryeTelNo = gelenVeri.docs[i].data()['Kurye TelNo'];
        });
        tumKuryeler.add(Urun(urunID: okunanKuryeID, ad: okunanKuryeAd, fiyat: okunanKuryeTelNo));
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
          urunID = (tumKuryeler.length +1).toString();
          if(formKey.currentState.validate()){
            formKey.currentState.save();
            formKey.currentState.reset();
          }
          _firebaseFirestore.collection('Kuryeler').doc('KR$urunID').set(kuryebilgial());
          //image = null;
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Kurye İşlemleri"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // URUN RESİNLERİNİN GÖSTERİLDİĞİ BÖLUM
            SizedBox(height: 50),
            // URUNLERİN GİRİLİGİ BOLUM
            Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    // ID BÖLÜMÜ
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(child: Text("Kurye ID: KR$urunID", style: TextStyle(fontSize: 20))),
                    ),
                    Divider(thickness:1,color: Colors.black,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text("Kurye Adı: ",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'ElYazisi',fontSize: 20,color: Colors.white),),
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
                            controller: kuryeAdController,
                            decoration: InputDecoration(
                                labelText: "Kurye Adı",
                                hintText: "Kurye Adını Giriniz",
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
                          child: Text("Kurye TelNo: ",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontFamily: 'ElYazisi',color: Colors.white),),
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
                            controller: kuryeTelNoController,
                            decoration: InputDecoration(
                              labelText: "Kurye TelNo",
                              hintText: "Kurye TelNo Giriniz",
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
                                //tumKuryeler.add(Urun(urunID: urunID,ad: urunAdi, fiyat: urunFiyat, resmi: urunResim));
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
                itemCount: tumKuryeler.length,
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
        title: Text("Kurye ID: KR${tumKuryeler[index].urunID}\n"+"Kurye Adı: "+tumKuryeler[index].ad),
        subtitle: Text("Kurye TelNo: " + tumKuryeler[index].fiyat.toString()),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text("Düzenle"),
                color: Colors.purple,
                onPressed: (){
                  setState(() {
                    kuryeAdController.text  = tumKuryeler[index].ad;
                    kuryeTelNoController.text = tumKuryeler[index].fiyat;
                    urunID = tumKuryeler[index].urunID;
                  });

                },
              ),
              RaisedButton(
                child: Text("Sil"),
                color: Colors.red,
                onPressed: (){
                  _firebaseFirestore.collection('Kuryeler').doc('KR${tumKuryeler[index].urunID}').delete();
                  tumKuryeler.removeWhere((element) => element.urunID == '$index');
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
                _firebaseFirestore.collection('Kuryeler').doc('KR${tumKuryeler[index].urunID}').update({
                  'Kurye Adı' : '$urunAdi',
                  'Kurye TelNo' : '$urunFiyat',
                  'Kurye ID' : '$urunID',
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
      //debugPrint("Resim yolu listeye eklendi yol : ${pickedFile.path}");
    });
  }


  Map<String, dynamic> kuryebilgial() {
    kuryelerMap['Kurye ID'] = urunID;
    kuryelerMap['Kurye Adı'] = urunAdi;
    //debugPrint("Yazdırılan ürün adı:"+urunAdi);
    kuryelerMap['Kurye TelNo'] = urunFiyat;
    kuryelerMap['Kurye YolBilgi'] = false;
    //debugPrint("Yazdırılan ürün fiyatı:"+urunFiyat);
    return kuryelerMap;
  }
}
