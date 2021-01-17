import 'package:flutter/material.dart';
import 'package:flutter_firebase/manager/urun.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sepet extends StatefulWidget {
  Map<int, Urun> gelenVeriler = Map<int, Urun>();

  Sepet({this.gelenVeriler});

  @override
  _SepetState createState() => _SepetState();
}

class _SepetState extends State<Sepet> {
  Map<int, Urun> sepetUrunleri = Map<int, Urun>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sepetim"),centerTitle: true,),
      body: Container(
        child: ListView.builder(
            itemBuilder: _urunleriListele,
          itemCount: widget.gelenVeriler.length,
        ),
      ),
    );
  }

  Widget _urunleriListele(BuildContext context, int index) {
    sepetUrunleri[index] = widget.gelenVeriler[index];
    debugPrint(sepetUrunleri[index].ad);
    return Card(
      child: ListTile(
        title: Text("Ürün Adı:" + sepetUrunleri[index].ad),
        subtitle: Text("Ödenecek Tutar: " + sepetUrunleri[index].odenecekTutar.toString() + "₺"),
      ),
    );
  }
}
