import 'package:flutter/material.dart';
import 'file:///D:/AndroidStudioProjects/flutter_app_yeni_calismalar/lib/pages/ana_ekran.dart';


class UrunIslemleri extends StatefulWidget {
  @override
  _UrunIslemleriState createState() => _UrunIslemleriState();
}

class _UrunIslemleriState extends State<UrunIslemleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün işlemleri"),
      ),
      body: Container(
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
                        Navigator.pushNamed(context, "/SebzeVeMeyve");
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
                        Navigator.pushNamed(context, "/EtVeEtUrunleri");
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
                        Navigator.pushNamed(context, "/SutVeSutUrunleri");
                      },
                    ),
                    Container(
                      child: Text(
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
                        Navigator.pushNamed(context, "/Gıda");
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
                        Navigator.pushNamed(context, "/Icecek");
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
                      Navigator.pushNamed(context, "/Temizlik");
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


/*
GridView.count(
        crossAxisCount: 2,
        primary: false,
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 40,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          // Sebze Ve Meyve
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(5),
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
                    alignment: Alignment.topCenter
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Sebzeler Ve Meyveler",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w700),
                ),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/SebzeVeMeyve");
            },
          ),
          // Et ve et ürünleri
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(5),
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
                child: Text(
                  "Et Ve Et Ürünleri",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/EtVeEtUrunleri");
            },
          ),
          //Süt Ve Süt Ürünleri
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(5),
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
                child: Text(
                  "Süt Ve Süt Ürünleri",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/SutVeSutUrunleri");
            },
          ),
          //Gida Urunleri
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(5),
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
                child: Text(
                  "Gıda Ürünleri",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/Gıda");
            },
          ),
          // içecek ürünleri
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(5),
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
                child: Text(
                  "İçecek Ürünleri",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/Icecek");
            },
          ),
          // Temizlik ürünleri
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(5),
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
                child: Text(
                  "Temizlik Ürünleri",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/Temizlik");
            },
          ),

        ],
      )

*/