import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:jsonblob/models/hedef.dart';
import 'package:jsonblob/models/kullanici.dart';
import 'package:jsonblob/models/odeme.dart';

import '../models/arama1.dart';

class hedefservis {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<String> addHedef(
    int telefon,
    String hedefAdi,
    int servisKota,
    int cagrisesId,
    String tip,
    String anlasma,
    int ogrenciKota,
    double fiyatnet,
    int ogrenciSayisi,
    int cagriSesAksam,
    int komisyon,
    Yer yer,
  ) async {
    //hedef hd = hedef(telefon: 34234234, guncelleme: 3324, hedefAdi: "hedefAdi", durum: false, servisKota: 34, cagrisesId: 45, tip: "sm", aylikOdeme: false, yer: Yer(latitude: 23, longitude: 23424), rid: "dfd", anlasma: "ef", ogrenciKota: 34, fiyatnet: 34, logo: logo, ogrenciSayisi: ogrenciSayisi, cagriSesAksam: cagriSesAksam, komisyon: komisyon)
    Hedef1 hdf = Hedef1(
      telefon: telefon,
      hedefAdi: hedefAdi,
      servisKota: servisKota,
      cagrisesId: 45,
      tip: tip,
      anlasma: anlasma,
      ogrenciKota: ogrenciKota,
      fiyatnet: fiyatnet,
      ogrenciSayisi: ogrenciSayisi,
      cagriSesAksam: cagriSesAksam,
      komisyon: komisyon,
      veliizinBtn: VeliizinBtn(iki: Iki(), uc: Iki(), bir: Iki()),
      //yer: Yer(latitude: 2323, longitude: 34),
      idariizinBtn: VeliizinBtn(bir: Iki(), iki: Iki(), uc: Iki()),
      servisBtn: ServisBtn(
          dagitmaBitir: DagitmaBitir(mesaj: "dsfsfsd", durum: false),
          otoBitir: DagitmaBitir(),
          otoBasla: DagitmaBitir(),
          dagitmaBasla: DagitmaBitir(),
          toplamaBitir: DagitmaBitir(),
          toplamaBasla: DagitmaBitir()),
      kullaniciizinBtn: VeliizinBtn(bir: Iki(), iki: Iki(), uc: Iki()),
      dagitBtn: DagitBtn(
        yaklasti: Yaklasti(),
        indi: Yaklasti(),
        serviseBinmedi: Yaklasti(),
      ),
      toplaBtn: ToplaBtn(
          serviseBindi: Yaklasti(),
          serviseBinmedi: Yaklasti(),
          duragaYaklasti: Yaklasti(),
          beklendiAlindi: Yaklasti(),
          indi: Yaklasti(),
          beklendiAlinmadi: Yaklasti()),

      // odeme: Odeme(),
      // arama: Arama(),
    );

    String sonuc = "";

    DocumentReference sonuc1 =
        await FirebaseFirestore.instance.collection("hedef").add(hdf.toJson());

    var idx = sonuc1.id;
    print("************");
    print(idx);
    print("************");

    arama2 aramaa2 = arama2(
      guncelleme: 1649057818,
      text: "",
    );
    DocumentReference ref = await FirebaseFirestore.instance
        .collection("arama")
        .add(aramaa2.toJson());

    var aramaid = ref.id;
    print(aramaid);
    FirebaseFirestore.instance
        .collection("arama")
        .doc(aramaid)
        .update({'hedefId': aramaid});

    odeme2 odemee2 = odeme2(
      guncelleme: 0,
      text: "",
    );
    DocumentReference ref2 = await FirebaseFirestore.instance
        .collection("odeme")
        .add(odemee2.toJson());

    var odemeid = ref2.id;
    print(odemeid);
    FirebaseFirestore.instance
        .collection("odeme")
        .doc(odemeid)
        .update({'hedefId': odemeid});

    FirebaseFirestore.instance.collection("hedef").doc(idx).update({
      'aylikOdeme': false,
      'durum': true,
      'rid': idx,
      'yer._latitude': yer.dLatitude,
      'yer._longitude': yer.dLongitude,
      'guncelleme': 1652640548,
      'cagrisesId': 45,
      'logo': "https://servisbildirim.com/ayarlar/servis-bildirim-logo.jpg",
      'toplaBtn.beklendiAlindi.id': idx + "t5",
      'toplaBtn.beklendiAlinmadi.id': idx + "t6",
      'toplaBtn.duragaYaklasti.id': idx + "t1",
      'toplaBtn.indi.id': idx + "t2",
      'toplaBtn.serviseBindi.id': idx + "t4",
      'toplaBtn.serviseBinmedi.id': idx + "t3",
      'toplaBtn.beklendiAlindi.cagri': true,
      'toplaBtn.beklendiAlinmadi.cagri': true,
      'toplaBtn.duragaYaklasti.cagri': true,
      'toplaBtn.indi.cagri': false,
      'toplaBtn.serviseBindi.cagri': false,
      'toplaBtn.serviseBinmedi.cagri': false,
      'toplaBtn.beklendiAlindi.yon': 1,
      'toplaBtn.beklendiAlinmadi.yon': 1,
      'toplaBtn.duragaYaklasti.yon': 1,
      'toplaBtn.indi.yon': 1,
      'toplaBtn.serviseBindi.yon': 1,
      'toplaBtn.serviseBinmedi.yon': 1,
      'toplaBtn.beklendiAlindi.kilit': false,
      'toplaBtn.beklendiAlinmadi.kilit': true,
      'toplaBtn.duragaYaklasti.kilit': false,
      'toplaBtn.indi.kilit': true,
      'toplaBtn.serviseBindi.kilit': false,
      'toplaBtn.serviseBinmedi.kilit': true,
      'toplaBtn.beklendiAlindi.sms': false,
      'toplaBtn.beklendiAlinmadi.sms': false,
      'toplaBtn.duragaYaklasti.sms': false,
      'toplaBtn.indi.sms': false,
      'toplaBtn.serviseBindi.sms': true,
      'toplaBtn.serviseBinmedi.sms': true,
      'toplaBtn.beklendiAlindi.renk': "0xffffc744",
      'toplaBtn.beklendiAlinmadi.renk': "0xffffc744",
      'toplaBtn.duragaYaklasti.renk': "0xffffc744",
      'toplaBtn.indi.renk': "0xff8ec33f",
      'toplaBtn.serviseBindi.renk': "0xff8ec33f",
      'toplaBtn.serviseBinmedi.renk': "0xffe82b2f",
      'toplaBtn.beklendiAlindi.text': "Beklendi Alındı",
      'toplaBtn.beklendiAlinmadi.text': "Beklendi Alınmadı",
      'toplaBtn.duragaYaklasti.text': "Yaklaştı",
      'toplaBtn.indi.text': "İndi",
      'toplaBtn.serviseBindi.text': "Bindi",
      'toplaBtn.serviseBinmedi.text': "Binmedi",
      'toplaBtn.beklendiAlindi.mesaj': "Beklendi alındı.",
      'toplaBtn.beklendiAlinmadi.mesaj': "Beklendi Alınmadı",
      'toplaBtn.duragaYaklasti.mesaj': "durağa yaklaştı",
      'toplaBtn.indi.mesaj': "okula bırakıldı",
      'toplaBtn.serviseBindi.mesaj': "servise bindi",
      'toplaBtn.serviseBinmedi.mesaj': "servise binmedi",
      'toplaBtn.beklendiAlindi.kmesaj': "Servis bekledi ve aldı.",
      'toplaBtn.beklendiAlinmadi.kmesaj': "Servis bekledi ve alınmadı.",
      'toplaBtn.duragaYaklasti.kmesaj':
          "Servis sizi almak için durağa yaklaştı.",
      'toplaBtn.indi.kmesaj': "Personel iş yönünde varış durağında indi.",
      'toplaBtn.serviseBindi.kmesaj':
          "Personel iş yeri yönünde ki servise binmiştir.",
      'toplaBtn.serviseBinmedi.kmesaj':
          "Personel iş yönünde ki servise binmedi.",
      'dagitBtn.yaklasti.id': idx + "d4",
      'dagitBtn.indi.id': idx + "d2",
      'dagitBtn.serviseBinmedi.id': idx + "d3",
      'dagitBtn.servisBindi.id': idx + "d1",
      'dagitBtn.yaklasti.sms': true,
      'dagitBtn.indi.sms': true,
      'dagitBtn.serviseBinmedi.sms': true,
      'dagitBtn.servisBindi.sms': true,
      'dagitBtn.yaklasti.renk': "0xff8ec33f",
      'dagitBtn.indi.renk': "0xff8ec33f",
      'dagitBtn.serviseBinmedi.renk': "0xff8ec33f",
      'dagitBtn.servisBindi.renk': "0xff8ec33f",
      'dagitBtn.yaklasti.yon': 2,
      'dagitBtn.indi.yon': 2,
      'dagitBtn.serviseBinmedi.yon': 2,
      'dagitBtn.servisBindi.yon': 2,
      'dagitBtn.yaklasti.cagri': true,
      'dagitBtn.indi.cagri': false,
      'dagitBtn.serviseBinmedi.cagri': false,
      'dagitBtn.servisBindi.cagri': false,
      'dagitBtn.yaklasti.kilit': false,
      'dagitBtn.indi.kilit': false,
      'dagitBtn.serviseBinmedi.kilit': true,
      'dagitBtn.servisBindi.kilit': false,
      'dagitBtn.yaklasti.text': "Yaklaştı",
      'dagitBtn.indi.text': "İndi",
      'dagitBtn.serviseBinmedi.text': "Binmedi",
      'dagitBtn.servisBindi.text': "Bindi",
      'dagitBtn.yaklasti.mesaj': "Eve yaklaştı",
      'dagitBtn.indi.mesaj': "Öğrenci ev yönünde, akşam durağına  bırakıldı.",
      'dagitBtn.serviseBinmedi.mesaj':
          "Öğrenci eve varmak için servise binmedi",
      'dagitBtn.servisBindi.mesaj':
          "Öğrenci eve varmak üzere, akşam servisine bindi.",
      'dagitBtn.yaklasti.kmesaj': "eve yaklaştı",
      'dagitBtn.indi.kmesaj': "Personel ev yönünde, varış durağında indi.",
      'dagitBtn.serviseBinmedi.kmesaj':
          "Personel eve varmak için servis kullanmadı.",
      'dagitBtn.servisBindi.kmesaj':
          "Personel ev yönüne gitmek üzere servise bindi.",
      'veliizinBtn.bir.id': idx + "v1",
      'veliizinBtn.iki.id': idx + "v2",
      'veliizinBtn.uc.id': idx + "v3",
      'veliizinBtn.bir.yon': 1,
      'veliizinBtn.iki.yon': 2,
      'veliizinBtn.uc.yon': 3,
      'veliizinBtn.bir.mesaj': "Sabah",
      'veliizinBtn.iki.mesaj': "Akşam",
      'veliizinBtn.uc.mesaj': "izinli",
      'veliizinBtn.bir.kilit': true,
      'veliizinBtn.iki.kilit': true,
      'veliizinBtn.uc.kilit': true,
      'veliizinBtn.bir.sms': false,
      'veliizinBtn.iki.sms': true,
      'veliizinBtn.uc.sms': true,
      'veliizinBtn.bir.renk': "0xffee4725",
      'veliizinBtn.iki.renk': "0xffee4725",
      'veliizinBtn.uc.renk': "0xffee4725",
      'veliizinBtn.bir.durum': true,
      'veliizinBtn.iki.durum': true,
      'veliizinBtn.uc.durum': true,
      'idariizinBtn.bir.id': idx + "i1",
      'idariizinBtn.iki.id': idx + "i2",
      'idariizinBtn.uc.id': idx + "i3",
      'idariizinBtn.bir.sms': true,
      'idariizinBtn.iki.sms': true,
      'idariizinBtn.uc.sms': true,
      'idariizinBtn.bir.kilit': true,
      'idariizinBtn.iki.kilit': true,
      'idariizinBtn.uc.kilit': true,
      'idariizinBtn.bir.durum': true,
      'idariizinBtn.iki.durum': true,
      'idariizinBtn.uc.durum': true,
      'idariizinBtn.bir.renk': "0xff8ec33f",
      'idariizinBtn.iki.renk': "0xff30a9e0",
      'idariizinBtn.uc.renk': "0xffffc744",
      'idariizinBtn.bir.yon': 2,
      'idariizinBtn.iki.yon': 2,
      'idariizinBtn.uc.yon': 2,
      'idariizinBtn.bir.mesaj': "Velisi alacak.",
      'idariizinBtn.iki.mesaj': "Okulda kalacak.",
      'idariizinBtn.uc.mesaj': "Serbest çıkış izni verildi.",
      'kullaniciizinBtn.bir.id': idx + "k1",
      'kullaniciizinBtn.iki.id': idx + "k2",
      'kullaniciizinBtn.uc.id': idx + "k3",
      'kullaniciizinBtn.bir.kilit': true,
      'kullaniciizinBtn.iki.kilit': true,
      'kullaniciizinBtn.uc.kilit': true,
      'kullaniciizinBtn.bir.yon': 1,
      'kullaniciizinBtn.iki.yon': 2,
      'kullaniciizinBtn.uc.yon': 3,
      'kullaniciizinBtn.bir.renk': "0xffee4725",
      'kullaniciizinBtn.iki.renk': "0xffee4725",
      'kullaniciizinBtn.uc.renk': "0xffee4725",
      'kullaniciizinBtn.bir.mesaj': "Sabah servise binmeyeceğim.",
      'kullaniciizinBtn.iki.mesaj': "Akşam servise binmeyeceğim.",
      'kullaniciizinBtn.uc.mesaj': "Kullanıcı İzinli",
      'kullaniciizinBtn.bir.durum': true,
      'kullaniciizinBtn.iki.durum': true,
      'kullaniciizinBtn.uc.durum': true,
      'kullaniciizinBtn.bir.sms': true,
      'kullaniciizinBtn.iki.sms': true,
      'kullaniciizinBtn.uc.sms': true,
      'servisBtn.dagitmaBitir.id': idx + "s6",
      'servisBtn.otoBitir.id': idx + "s4",
      'servisBtn.otoBasla.id': idx + "s3",
      'servisBtn.dagitmaBasla.id': idx + "s5",
      'servisBtn.toplamaBitir.id': idx + "s2",
      'servisBtn.toplamaBasla.id': idx + "s1",
      'servisBtn.dagitmaBitir.durum': true,
      'servisBtn.otoBitir.durum': true,
      'servisBtn.otoBasla.durum': true,
      'servisBtn.dagitmaBasla.durum': true,
      'servisBtn.toplamaBitir.durum': true,
      'servisBtn.toplamaBasla.durum': true,
      'servisBtn.dagitmaBitir.mesaj': "Dağıtma bitirildi.",
      'servisBtn.otoBitir.mesaj': "Otomatik mod bitirildi",
      'servisBtn.otoBasla.mesaj': "Otomatik mod aktif edildi.",
      'servisBtn.dagitmaBasla.mesaj': "Dağıtmaya başlandı.",
      'servisBtn.toplamaBitir.mesaj': "Toplama bitirildi.",
      'servisBtn.toplamaBasla.mesaj': "Toplamaya başladı.",
    });

    return sonuc;
  }
}
