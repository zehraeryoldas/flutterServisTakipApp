import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:jsonblob/giris.dart';
import 'package:jsonblob/okulListele.dart';

class Update extends StatefulWidget {
  final String id;
  const Update({Key? key, required this.id}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  var items = [
    'Ogrenci servis',
    'Personel servis',
  ];
  String? selectedValue;
  TextEditingController telefon = TextEditingController();
  TextEditingController hedefAdi = TextEditingController();
  TextEditingController servisKota = TextEditingController();
  TextEditingController cagrisesId = TextEditingController();
  TextEditingController tip = TextEditingController();
  TextEditingController anlasma = TextEditingController();
  TextEditingController ogrenciKota = TextEditingController();
  TextEditingController fiyatnet = TextEditingController();
  TextEditingController ogrenciSayisi = TextEditingController();
  TextEditingController cagriSesAksam = TextEditingController();
  TextEditingController komisyon = TextEditingController();
  TextEditingController latitude = TextEditingController();
  TextEditingController longitude = TextEditingController();

  late Map userData;

  @override
  void initState() {
    userData = Map();
    super.initState();

    getData();
  }

  getData() async {
    try {
      var snap = await FirebaseFirestore.instance
          .collection("hedef")
          .doc(widget.id)
          .get();

      userData = snap.data()!;
      hedefAdi.text = userData['hedefAdi'];
      telefon.text = userData['telefon'].toString();
      servisKota.text = userData['servisKota'].toString();
      cagrisesId.text = userData['cagrisesId'].toString();
      tip.text = userData['tip'];
      anlasma.text = userData['anlasma'];
      ogrenciKota.text = userData['ogrenciKota'].toString();
      fiyatnet.text = userData['fiyatnet'].toString();
      ogrenciSayisi.text = userData['ogrenciSayisi'].toString();
      cagriSesAksam.text = userData['cagriSesAksam'].toString();
      komisyon.text = userData['komisyon'].toString();
      latitude.text = userData['yer']['_latitude'].toString();
      longitude.text = userData['yer']['_longitude'].toString();
    } catch (e) {
      print(e.toString());
    }

    // setState(() {
    //   userData = userData;

    //   //telefon.text = userData['telefon'].toString();
    // });
  }

  void infoUpdate() async {
    var telefonPars = int.tryParse(telefon.text);
    var hedefPars = hedefAdi.text;
    var servisPars = int.tryParse(servisKota.text);
    var cagriSesIdPars = int.tryParse(cagrisesId.text);
    var tipPars = tip.text;
    var anlasmaPars = anlasma.text;
    var ogrenciKotaPars = int.tryParse(ogrenciKota.text);
    var fiyatnetPars = int.tryParse(fiyatnet.text);
    var ogrSayPars = int.tryParse(ogrenciSayisi.text);
    var cagriSesAksamPars = int.tryParse(cagriSesAksam.text);
    var komisyonPars = int.tryParse(komisyon.text);
    var latPars = int.tryParse(latitude.text);

    var longPars = int.tryParse(longitude.text);

    Future<void> reference =
        FirebaseFirestore.instance.collection("hedef").doc(widget.id).update({
      'telefon': telefonPars,
      'hedefAdi': hedefPars,
      'servisKota': servisPars,
      'cagrisesId': cagriSesIdPars,
      'tip': tipPars,
      'anlasma': anlasmaPars,
      'ogrenciKota': ogrenciKotaPars,
      'fiyatnet': fiyatnetPars,
      'ogrenciSayisi': ogrSayPars,
      'cagriSesAksam': cagriSesAksamPars,
      'komisyon': komisyonPars,
      'yer._latitude': latPars,
      'yer._longitude': longPars,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton.icon(
                onPressed: () {
                  infoUpdate();
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Text(userData['hedefAdi'].toString()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //initialValue: userData['telefon'].toString(),
                      keyboardType: TextInputType.number,

                      textInputAction: TextInputAction.next,
                      controller: telefon,

                      decoration: const InputDecoration(
                          label: Text("Telefon"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: hedefAdi,
                      decoration: const InputDecoration(
                          label: const Text("Hedef Adı"),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //initialValue: userData['servisKota'].toString(),
                      textInputAction: TextInputAction.next,
                      controller: servisKota,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text("Servis Kota"),
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.teal))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //initialValue: userData['cagrisesId'].toString(),
                      textInputAction: TextInputAction.next,
                      controller: cagrisesId,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: const Text("Çağrı ses Id"),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
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
                            tip.text = "2";
                            cagrisesId.text = "13508667";
                          } else {
                            tip.text = "1";
                            cagrisesId.text = "20825999";
                          }
                        });
                      },
                    )),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextFormField(
                  //     //initialValue: userData['tip'].toString(),
                  //     textInputAction: TextInputAction.next,
                  //     controller: tip,
                  //     decoration: const InputDecoration(
                  //         label: Text("Tip"),
                  //         border: OutlineInputBorder(
                  //             borderSide: BorderSide(color: Colors.teal))),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //initialValue: userData['anlasma'].toString(),
                      textInputAction: TextInputAction.next,
                      controller: anlasma,
                      decoration: const InputDecoration(
                          label: const Text("Anlaşma"),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //initialValue: userData['ogrenciKota'].toString(),
                      textInputAction: TextInputAction.next,
                      controller: ogrenciKota,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text("öğrenci Kota"),
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.teal))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //initialValue: userData['fiyatnet'].toString(),
                      textInputAction: TextInputAction.next,
                      controller: fiyatnet,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: const Text("Fiyat net"),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //initialValue: userData['ogrenciSayisi'].toString(),
                      textInputAction: TextInputAction.next,
                      controller: ogrenciSayisi,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text("öğrenci Sayısı"),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //initialValue: userData['cagriSesAksam'].toString(),
                      textInputAction: TextInputAction.next,
                      controller: cagriSesAksam,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text("Çağrı ses akşam"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //initialValue: userData['komisyon'].toString(),
                      textInputAction: TextInputAction.next,
                      controller: komisyon,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text("Komisyon"),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text("Latitude"),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal))),
                      controller: latitude,
                    ),
                    subtitle: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: const Text("longitude"),
                          border: const OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.teal))),
                      controller: longitude,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
