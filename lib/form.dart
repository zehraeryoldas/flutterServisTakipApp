// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:jsonblob/giris.dart';
import 'package:jsonblob/models/hedef.dart';
import 'package:jsonblob/services/hedef_servis.dart';

class form extends StatefulWidget {
  const form({Key? key}) : super(key: key);

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  var items = [
    'Ogrenci servis',
    'Personel servis',
  ];
  String? selectedValue;

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  final t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();
  TextEditingController t6 = TextEditingController();
  TextEditingController t7 = TextEditingController();
  TextEditingController t8 = TextEditingController();
  TextEditingController t9 = TextEditingController();
  TextEditingController t10 = TextEditingController();
  TextEditingController t11 = TextEditingController();
  TextEditingController t12 = TextEditingController();
  TextEditingController t13 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('hedef');
    // Future<void> addUser() {
    //   return users
    //       .doc(t1.text)
    //       .set(
    //         {
    //           'telefon': t1.text,
    //           'hedefAdi': t2.text,
    //           'servisKota': t3.text,
    //           'cagrisesId': t4.text,
    //           'tip': t5.text,
    //           'anlasma': t6.text,
    //           'ogrenciKota': t7.text,
    //           'fiyatnet': t8.text,
    //           'ogrenciSayisi': t9.text,
    //           'cagriSesAksam': t10.text,
    //           'komisyon': t11.text,
    //           'yer._latitude': t12.text,
    //           'yer._longitude': t13.text,
    //         },
    //         SetOptions(merge: true),
    //       )
    //       .then((value) =>
    //           print("'full_name' & 'age' merged with existing data!"))
    //       .catchError((error) => print("Failed to merge data: $error"));
    // }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext) => Arayuz()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
        title: const Text("Yeni Kayıt", style: TextStyle(color: Colors.blue)),
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                hedefservis().addHedef(
                    int.parse(t1.text),
                    t2.text,
                    int.parse(t3.text),
                    int.parse(t4.text),
                    t5.text,
                    t6.text,
                    int.parse(t7.text),
                    double.parse(t8.text),
                    int.parse(t9.text),
                    int.parse(t10.text),
                    int.parse(t11.text),
                    Yer(
                        dLatitude: double.parse(t12.text),
                        dLongitude: double.parse(t13.text)));
              },
              icon: Icon(Icons.save),
              label: Text("Kaydet"))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: TextField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          label: Text("Telefon"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: t1,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          label: Text("Hedef Adı"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: t2,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text("Servis Kota"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: t3,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      //onTap: getData,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text("Çağrı ses Id"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: t4,
                    ),
                  ),
                  Container(
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                      hint: Text("Tip"),
                      items: items
                          .map((item) => DropdownMenuItem(
                                child: Text(item),
                                value: item,
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String?;
                          if (selectedValue == 'Personel servis') {
                            t5.text = "2";
                            t4.text = "13508667";
                          } else {
                            t5.text = "1";
                            t4.text = "20825999";
                          }
                        });
                      },
                    )),
                  ),
                  ListTile(
                    title: TextField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          label: Text("Anlaşma"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: t6,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text("öğrenci Kota"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: t7,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text("Fiyat net"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: t8,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text("öğrenci Sayısı"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: t9,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text("Çağrı ses akşam"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: t10,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text("Komisyon"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: t11,
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text("Latitude"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: t12,
                    ),
                    subtitle: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text("longitude"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: t13,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


  



// ignore: camel_case_types

