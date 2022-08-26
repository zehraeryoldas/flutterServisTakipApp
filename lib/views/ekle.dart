import 'package:flutter/material.dart';
import 'package:jsonblob/views/arama.dart';
import 'package:jsonblob/views/form.dart';
import 'package:jsonblob/views/kullaniciEkle.dart';
import 'package:jsonblob/views/kullaniciListele.dart';

class ekle extends StatefulWidget {
  const ekle({Key? key}) : super(key: key);

  @override
  State<ekle> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ekle> {
  gecis() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext) => form()));
    });
  }

  gecis2() {
    setState(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext) => kullaniciListeleme()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Listele",
          style: TextStyle(color: Colors.blue),
        )),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    gecis();
                  },
                  child: Text("Okul Ekle")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    gecis2();
                  },
                  child: Text("Kullanıcı Ekle")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {},
                  child: Text("Admin Ekle")),
            ],
          )
        ],
      ),
    );
  }
}
