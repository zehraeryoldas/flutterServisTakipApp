import 'package:flutter/material.dart';
import 'package:jsonblob/giris.dart';
import 'package:jsonblob/models/kullanici.dart';
import 'package:jsonblob/services/kullanici_servis.dart';

class kullaniciForm extends StatefulWidget {
  final String id;
  const kullaniciForm({Key? key, required this.id}) : super(key: key);

  @override
  State<kullaniciForm> createState() => _formState();
}

class _formState extends State<kullaniciForm> {
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();
  TextEditingController t6 = TextEditingController();
  TextEditingController t7 = TextEditingController();
  TextEditingController t8 = TextEditingController();
  TextEditingController t9 = TextEditingController();
  TextEditingController hedefId = TextEditingController();

  bool _cagri = true;
  bool _sms = true;
  bool _sofor = false;
  bool _hostes = false;
  bool _kullanici = false;
  bool _admin = true;
  bool _idari = false;
  bool _veli = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    t2.text = "250";
    // hedefId.text = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext) => const Arayuz()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
        ),
        title: const Text("Kullanıcı Yeni Kayıt",
            style: TextStyle(color: Colors.blue)),
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                kullaniciServis().addUsers(
                    int.parse(t2.text),
                    Tercih(cagri: _cagri, sms: _sms),
                    Adres(
                        iLongitude: int.parse(t8.text),
                        iLatitude: int.parse(t9.text)),
                    t3.text,
                    t4.text,
                    t5.text,
                    Yetki(
                        sofor: _sofor,
                        hostes: _hostes,
                        kullanici: _kullanici,
                        admin: _admin,
                        veli: _veli,
                        idari: _idari),
                    hedefId.text);
              },
              icon: const Icon(Icons.save),
              label: const Text("Kaydet"))
        ],
      ),
      body: ListView(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: TextField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("yakinMesafe"),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    controller: t2,
                  ),
                ),
                ListTile(
                  title: TextField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("ad soyad"),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    controller: t3,
                  ),
                ),
                ListTile(
                  title: TextField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("telefon"),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    controller: t4,
                  ),
                ),
                ListTile(
                  title: TextField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        label: Text("sifre"),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    controller: t5,
                  ),
                ),
                ListTile(
                  title: TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text("Longitude"),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    controller: t8,
                  ),
                  subtitle: TextField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text("Latitude"),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    controller: t9,
                  ),
                ),
              ],
            ),
          ),
          const Text(
              "-------------------------Tercih-------------------------------------------------------------"),
          Container(
              child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 30.0),
                        child: Text("Çağrı"),
                      ),
                      Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: _cagri,
                              onChanged: (value) {
                                setState(() {
                                  _cagri = value as bool;
                                });
                              }),
                          const Text("true")
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: false,
                              groupValue: _cagri,
                              onChanged: (value) {
                                setState(() {
                                  _cagri = value as bool;
                                });
                              }),
                          const Text("false")
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 50.0),
                        child: Text("sms"),
                      ),
                      Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: _sms,
                              onChanged: (value) {
                                setState(() {
                                  _sms = value as bool;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text("true")
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: false,
                              groupValue: _sms,
                              onChanged: (value) {
                                setState(() {
                                  _sms = value as bool;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text("false")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                  "---------------------------------Yetki-------------------------------------------------------------"),
              Row(
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 30.0),
                        child: Text("Şöför"),
                      ),
                      Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: _sofor,
                              onChanged: (value) {
                                setState(() {
                                  _sofor = value as bool;
                                });
                              }),
                          const Text("true")
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: false,
                              groupValue: _sofor,
                              onChanged: (value) {
                                setState(() {
                                  _sofor = value as bool;
                                });
                              }),
                          const Text("false")
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 50.0),
                        child: Text("hostes"),
                      ),
                      Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: _hostes,
                              onChanged: (value) {
                                setState(() {
                                  _hostes = value as bool;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text("true")
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: false,
                              groupValue: _hostes,
                              onChanged: (value) {
                                setState(() {
                                  _hostes = value as bool;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text("false")
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 30.0),
                        child: Text("kullanıcı"),
                      ),
                      Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: _kullanici,
                              onChanged: (value) {
                                setState(() {
                                  _kullanici = value as bool;
                                });
                              }),
                          const Text("true")
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: false,
                              groupValue: _kullanici,
                              onChanged: (value) {
                                setState(() {
                                  _kullanici = value as bool;
                                });
                              }),
                          const Text("false")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 50.0),
                        child: Text("admin"),
                      ),
                      Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: _admin,
                              onChanged: (value) {
                                setState(() {
                                  _admin = value as bool;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text("true")
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: false,
                              groupValue: _admin,
                              onChanged: (value) {
                                setState(() {
                                  _admin = value as bool;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text("false")
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 50.0),
                        child: Text("veli"),
                      ),
                      Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: _veli,
                              onChanged: (value) {
                                setState(() {
                                  _veli = value as bool;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text("true")
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: false,
                              groupValue: _veli,
                              onChanged: (value) {
                                setState(() {
                                  _veli = value as bool;
                                });
                              }),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text("false")
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 30.0),
                        child: Text("idari"),
                      ),
                      Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: _idari,
                              onChanged: (value) {
                                setState(() {
                                  _idari = value as bool;
                                });
                              }),
                          const Text("true")
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: false,
                              groupValue: _idari,
                              onChanged: (value) {
                                setState(() {
                                  _idari = value as bool;
                                });
                              }),
                          const Text("false")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
