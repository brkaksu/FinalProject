import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlatMarket", style: TextStyle(fontFamily: 'Font3',fontSize: 25),),
        centerTitle: true,
      ),
      body:Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        height: 175,
                        width: 175,
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Colors.orange, width: 5, style: BorderStyle.solid),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              offset: Offset(7.5, 7.5),
                            )
                          ],
                          color: Colors.purple,
                          image: DecorationImage(
                            image: AssetImage("assets/images/sebzemeyve.jpg"),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(""),
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, "/KullaniciSebze");
                      },
                    ),
                    Container(child: Text(
                      "Sebzeler Ve Meyveler",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w700),
                    ),)
                  ],
                ),
                // Et ve et ürünleri
                Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        width: 175,
                        height: 175,
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Colors.orange, width: 5, style: BorderStyle.solid),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              offset: Offset(7.5, 7.5),
                            )
                          ],
                          color: Colors.purple,
                          image: DecorationImage(
                              image: AssetImage("assets/images/etvet.jpg"),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(""),
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, "/KullaniciEt");
                      },
                    ),
                    Container(
                      child: Text(
                        "Et Ve Et Ürünleri",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )

              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    //Süt Ve Süt Ürünleri
                    GestureDetector(
                      child: Container(
                        width: 175,
                        height: 175,
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Colors.orange, width: 5, style: BorderStyle.solid),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              offset: Offset(7.5, 7.5),
                            )
                          ],
                          color: Colors.purple,
                          image: DecorationImage(
                              image: AssetImage("assets/images/sutvesut.jpg"),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, "/KullaniciSut");
                      },
                    ),
                    Container(child: Text(
                      "Süt ve Süt Ürünleri",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w700),
                    ),)
                  ],
                ),
                Column(
                  children: <Widget>[
                    //Gida Urunleri
                    GestureDetector(
                      child: Container(
                        width: 175,
                        height: 175,
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Colors.orange, width: 5, style: BorderStyle.solid),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              offset: Offset(7.5, 7.5),
                            )
                          ],
                          color: Colors.purple,
                          image: DecorationImage(
                              image: AssetImage("assets/images/gidavegida.jpg"),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, "/KullaniciGida");
                      },
                    ),
                    Container(child: Text(
                      "Gıda Ürünleri",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w700),
                    ),)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // içecek ürünleri
                    GestureDetector(
                      child: Container(
                        width: 175,
                        height: 175,
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                              color: Colors.orange, width: 5, style: BorderStyle.solid),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey,
                              offset: Offset(7.5, 7.5),
                            )
                          ],
                          color: Colors.purple,
                          image: DecorationImage(
                              image: AssetImage("assets/images/icecekurunler.jpg"),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                        ),
                      ),
                      onTap: (){
                        Navigator.pushNamed(context, "/KullaniciIcecek");
                      },
                    ),
                    Container(child: Text(
                      "İçecek Ürünleri",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
                    ),),
                  ],
                ),
                Column(children: <Widget>[
                  GestureDetector(
                    child: Container(
                      width: 175,
                      height: 175,
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                            color: Colors.orange, width: 5, style: BorderStyle.solid),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey,
                            offset: Offset(7.5, 7.5),
                          )
                        ],
                        color: Colors.purple,
                        image: DecorationImage(
                            image: AssetImage("assets/images/temizvetemiz2.jpg"),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, "/KullaniciTemizlik");
                    },
                  ),
                  Container(child: Text(
                    "Temizlik Ürünleri",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                  ),
                ],),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Sebzeler ve Meyveler
// Et ve Et Ürünleri
// Süt Ve Süt ürünleri
// İçecekler
// Temizlik Ürünleri
// Gıda Ürünleri

