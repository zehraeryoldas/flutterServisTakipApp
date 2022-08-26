import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jsonblob/models/kullanici.dart';
import 'package:jsonblob/services/hedef_servis.dart';

class kullaniciServis {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  addUsers(
    //int? bildirimTel,
    int? yaklastiMesafe,
    Tercih tercih,
    Adres adres,
    String? adSoyad,
    String? telefon,
    String? sifre,
    Yetki yetki,
    String hedefId,
  ) async {
    kullanici1 kullanici = kullanici1(
      acikAdres: "",
      adSoyad: adSoyad,
      telefon: telefon,

      durum: true,
      bildirimTel: int.tryParse(telefon.toString()),

      izin: Izin(baslaTarih: 0, bitirTarih: 0),
      kupon: Kupon(durum: false, indirim: 0, kuponId: "0"),
      sifre: sifre,
      signalId: "123123",
      //hedefId:,
      guncelleme: 0,
      yaklastiMesafe: yaklastiMesafe,
      odeme: Odeme(
          odemeUniqId: "",
          odemeZamani: 0,
          paket: "yillik",
          songun: "0",
          odenen: 0),
      hedefId: [hedefId],
    );

    //String sonuc = "";

    DocumentReference sonuc1 = await FirebaseFirestore.instance
        .collection("kullanici")
        .add(kullanici.toJson());

    var idy = sonuc1.id;

    FirebaseFirestore.instance.collection("kullanici").doc(idy).update({
      'rid': idy,
      'adres._longitude': adres.iLongitude,
      'adres._latitude': adres.iLatitude,
      'tercih.cagri': tercih.cagri,
      'tercih.sms': tercih.sms,
      'yetki.sofor': yetki.sofor,
      'yetki.hostes': yetki.hostes,
      'yetki.kullanici': yetki.kullanici,
      'yetki.admin': yetki.admin,
      'yetki.idari': yetki.idari,
      'yetki.veli': yetki.veli,
    });
  }
}
