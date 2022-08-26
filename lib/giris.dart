import 'package:flutter/material.dart';
import 'package:jsonblob/form.dart';
import 'package:jsonblob/ekle.dart';
import 'package:jsonblob/kullaniciListele.dart';
import 'package:jsonblob/kullaniciUpdate.dart';
import 'package:jsonblob/okulListele.dart';

class Arayuz extends StatefulWidget {
  const Arayuz({Key? key}) : super(key: key);

  @override
  State<Arayuz> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<Arayuz> {
  int guncel_no = 0;
  late List<Widget> icerikler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    icerikler = [
      // MyWidget2(),
      MyWidget(),
      ekle(),
      kullaniciListele(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: icerikler[guncel_no],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: guncel_no,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Listele"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Ekle"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Arama")
        ],
        onTap: (int tiklama) {
          setState(() {
            guncel_no = tiklama;
          });
        },
      ),
    );
  }
}
