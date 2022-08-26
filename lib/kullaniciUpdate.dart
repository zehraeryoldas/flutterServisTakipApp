import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jsonblob/giris.dart';
import 'package:jsonblob/kullaniciListele.dart';

class kullaniciUpdate extends StatefulWidget {
  final String id;
  const kullaniciUpdate({Key? key, required this.id}) : super(key: key);

  @override
  State<kullaniciUpdate> createState() => _kullaniciUpdateState();
}

class _kullaniciUpdateState extends State<kullaniciUpdate> {
  TextEditingController bildirimTel = TextEditingController();
  TextEditingController yaklastiMesafe = TextEditingController();

  //TextEditingController durum = TextEditingController();
  TextEditingController longitude = TextEditingController();
  TextEditingController latitude = TextEditingController();

  TextEditingController telefon = TextEditingController();
  TextEditingController adSoyad = TextEditingController();
  TextEditingController sifre = TextEditingController();

  bool _cagri = true;
  bool _sms = true;
  bool _sofor = false;
  bool _hostes = false;
  bool _kullanici = false;
  bool _admin = true;
  bool _idari = false;
  bool _veli = false;

  late Map userData2;
  @override
  void initState() {
    userData2 = Map();

    // TODO: implement initState
    super.initState();
    _cagri;
    _sms;
    _sofor;
    _hostes;
    _kullanici;
    _admin;
    _idari;
    _veli;

    getData2();
  }

  getData2() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection("kullanici")
          .doc(widget.id)
          .get();

      userData2 = snap.data()!;
      bildirimTel.text = userData2['bildirimTel'].toString();
      yaklastiMesafe.text = userData2['yaklastiMesafe'].toString();
      longitude.text = userData2['adres']['_longitude'].toString();
      latitude.text = userData2['adres']['_latitude'].toString();
      adSoyad.text = userData2['adSoyad'];
      telefon.text = userData2['telefon'];
      sifre.text = userData2['sifre'];
      _cagri = userData2['tercih']['cagri'];
      _sms = userData2['tercih']['sms'];
      _sofor = userData2['yetki']['sofor'];
      _hostes = userData2['yetki']['hostes'];
      _kullanici = userData2['yetki']['kullanici'];
      _idari = userData2['yetki']['idari'];
      _admin = userData2['yetki']['admin'];
      _veli = userData2['yetki']['veli'];
    } catch (e) {
      print(e.toString());
    }
  }

  void infoUpdate2() async {
    var bildirimtel = int.tryParse(bildirimTel.text);
    var yaklastimesafe = int.tryParse(yaklastiMesafe.text);
    var cagri = _cagri;
    var sms = _sms;
    var sofor = _sofor;
    var hostes = _hostes;
    var kullanici = _kullanici;
    var idari = _idari;
    var veli = _veli;
    var admin = _admin;

    var adsoyad = adSoyad.text;
    var telefonn = telefon.text;
    var sifree = sifre.text;
    var longitude1 = int.tryParse(longitude.text);
    var latitude1 = int.tryParse(latitude.text);
    Future<void> reference = FirebaseFirestore.instance
        .collection("kullanici")
        .doc(widget.id)
        .update({
      'bildirimTel': bildirimtel,
      'yaklastiMesafe': yaklastimesafe,
      'adSoyad': adsoyad,
      'telefon': telefonn,
      'sifre': sifree,
      'adres._latitude': latitude1,
      'adres._longitude': longitude1,
      'tercih.cagri': cagri,
      'tercih.sms': sms,
      'yetki.sofor': sofor,
      'yetki.kullanici': kullanici,
      'yetki.admin': admin,
      'yetki.veli': veli,
      'yetki.idari': idari,
      'yetki.hostes': hostes,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(
              onPressed: () {
                infoUpdate2();
              },
              icon: const Icon(Icons.update),
              label: const Text("Güncelle"))
        ],
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
        title: const Text(
          "Düzenle",
          style: const TextStyle(color: Colors.blue),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  //initialValue: userData['telefon'].toString(),
                  keyboardType: TextInputType.number,

                  textInputAction: TextInputAction.next,
                  controller: bildirimTel,

                  decoration: const InputDecoration(
                      label: Text("bildirim tel"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  //initialValue: userData['telefon'].toString(),
                  keyboardType: TextInputType.number,

                  textInputAction: TextInputAction.next,
                  controller: yaklastiMesafe,

                  decoration: const InputDecoration(
                      label: Text("yakinMesafe"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  //initialValue: userData['telefon'].toString(),

                  textInputAction: TextInputAction.next,
                  controller: adSoyad,

                  decoration: const InputDecoration(
                      label: Text("ad soyad"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  //initialValue: userData['telefon'].toString(),

                  textInputAction: TextInputAction.next,
                  controller: telefon,

                  decoration: const InputDecoration(
                      label: Text("telefon"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  //initialValue: userData['telefon'].toString(),

                  textInputAction: TextInputAction.next,
                  controller: sifre,

                  decoration: const InputDecoration(
                      label: Text("sifre"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     //initialValue: userData['telefon'].toString(),

              //     textInputAction: TextInputAction.next,
              //     controller: durum,

              //     decoration: const InputDecoration(
              //         label: Text("durum"),
              //         border: OutlineInputBorder(
              //             borderSide: BorderSide(color: Colors.teal))),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  //initialValue: userData['telefon'].toString(),

                  textInputAction: TextInputAction.next,
                  controller: longitude,
                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
                      label: Text("longitude"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  //initialValue: userData['telefon'].toString(),

                  textInputAction: TextInputAction.next,
                  controller: latitude,
                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
                      label: Text("latitude"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal))),
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
                      "---------------------------Yetki-------------------------------------------------------------"),
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
          )
        ],
      ),
    );
  }
}
