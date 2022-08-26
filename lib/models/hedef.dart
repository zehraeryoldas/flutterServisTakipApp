import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jsonblob/services/hedef_servis.dart';

class hedef {
  Hedef1? hedeff;

  hedef(
      {this.hedeff,
      required num telefon,
      required num guncelleme,
      required String hedefAdi,
      required bool durum,
      required num servisKota,
      required num cagrisesId,
      required String tip,
      required bool aylikOdeme,
      required Yer yer,
      required String rid,
      required String anlasma,
      required num ogrenciKota,
      required num fiyatnet,
      required String logo,
      required num ogrenciSayisi,
      required num cagriSesAksam,
      required num komisyon});

  hedef.fromJson(Map<String, dynamic> json) {
    hedeff = json['hedef'] != null ? Hedef1.fromJson(json['hedef']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.hedeff != null) {
      data['hedef'] = this.hedeff!.toJson();
    }
    return data;
  }
}

class Hedef1 {
  int? telefon;
  ServisBtn? servisBtn;
  int? guncelleme;
  VeliizinBtn? veliizinBtn;
  String? hedefAdi;
  bool? durum;
  int? servisKota;
  int? cagrisesId;
  String? tip;
  bool? aylikOdeme;
  String? rid;
  Yer? yer;
  String? anlasma;
  DagitBtn? dagitBtn;
  int? ogrenciKota;
  double? fiyatnet;
  VeliizinBtn? idariizinBtn;
  String? logo;
  ToplaBtn? toplaBtn;
  int? ogrenciSayisi;
  VeliizinBtn? kullaniciizinBtn;
  int? cagriSesAksam;
  int? komisyon;
  // Odeme? odeme;
  // Arama? arama;

  Hedef1({
    this.telefon,
    this.servisBtn,
    this.guncelleme,
    this.veliizinBtn,
    this.hedefAdi,
    this.durum,
    this.servisKota,
    this.cagrisesId,
    this.tip,
    this.aylikOdeme,
    this.rid,
    this.yer,
    this.anlasma,
    this.dagitBtn,
    this.ogrenciKota,
    this.fiyatnet,
    this.idariizinBtn,
    this.logo,
    this.toplaBtn,
    this.ogrenciSayisi,
    this.kullaniciizinBtn,
    this.cagriSesAksam,
    this.komisyon,
    // this.odeme,
    // this.arama
  });

  Hedef1.fromJson(Map<String, dynamic> json) {
    telefon = json['telefon'];
    servisBtn = json['servisBtn'] != null
        ? new ServisBtn.fromJson(json['servisBtn'])
        : null;
    guncelleme = json['guncelleme'];
    veliizinBtn = json['veliizinBtn'] != null
        ? new VeliizinBtn.fromJson(json['veliizinBtn'])
        : null;
    hedefAdi = json['hedefAdi'];
    durum = json['durum'];
    servisKota = json['servisKota'];
    cagrisesId = json['cagrisesId'];
    tip = json['tip'];
    aylikOdeme = json['aylikOdeme'];
    rid = json['rid'];
    yer = json['yer'] != null ? new Yer.fromJson(json['yer']) : null;
    anlasma = json['anlasma'];
    dagitBtn = json['dagitBtn'] != null
        ? new DagitBtn.fromJson(json['dagitBtn'])
        : null;
    ogrenciKota = json['ogrenciKota'];
    fiyatnet = json['fiyatnet'];
    idariizinBtn = json['idariizinBtn'] != null
        ? new VeliizinBtn.fromJson(json['idariizinBtn'])
        : null;
    logo = json['logo'];
    toplaBtn = json['toplaBtn'] != null
        ? new ToplaBtn.fromJson(json['toplaBtn'])
        : null;
    ogrenciSayisi = json['ogrenciSayisi'];
    kullaniciizinBtn = json['kullaniciizinBtn'] != null
        ? new VeliizinBtn.fromJson(json['kullaniciizinBtn'])
        : null;
    cagriSesAksam = json['cagriSesAksam'];
    komisyon = json['komisyon'];
    // odeme = json['odeme'] != null ? new Odeme.fromJson(json['odeme']) : null;
    // arama = json['arama'] != null ? new Arama.fromJson(json['arama']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['telefon'] = this.telefon;
    if (this.servisBtn != null) {
      data['servisBtn'] = this.servisBtn!.toJson();
    }
    data['guncelleme'] = this.guncelleme;
    if (this.veliizinBtn != null) {
      data['veliizinBtn'] = this.veliizinBtn!.toJson();
    }
    data['hedefAdi'] = this.hedefAdi;
    data['durum'] = this.durum;
    data['servisKota'] = this.servisKota;
    data['cagrisesId'] = this.cagrisesId;
    data['tip'] = this.tip;
    data['aylikOdeme'] = this.aylikOdeme;
    data['rid'] = this.rid;
    if (this.yer != null) {
      data['yer'] = this.yer!.toJson();
    }
    data['anlasma'] = this.anlasma;
    if (this.dagitBtn != null) {
      data['dagitBtn'] = this.dagitBtn!.toJson();
    }
    data['ogrenciKota'] = this.ogrenciKota;
    data['fiyatnet'] = this.fiyatnet;
    if (this.idariizinBtn != null) {
      data['idariizinBtn'] = this.idariizinBtn!.toJson();
    }
    data['logo'] = this.logo;
    if (this.toplaBtn != null) {
      data['toplaBtn'] = this.toplaBtn!.toJson();
    }
    data['ogrenciSayisi'] = this.ogrenciSayisi;
    if (this.kullaniciizinBtn != null) {
      data['kullaniciizinBtn'] = this.kullaniciizinBtn!.toJson();
    }
    data['cagriSesAksam'] = this.cagriSesAksam;
    data['komisyon'] = this.komisyon;
    // if (this.odeme != null) {
    //   data['odeme'] = this.odeme!.toJson();
    // }
    // if (this.arama != null) {
    //   data['arama'] = this.arama!.toJson();
    // }
    return data;
  }
}

class ServisBtn {
  DagitmaBitir? dagitmaBitir;
  DagitmaBitir? otoBasla;
  DagitmaBitir? otoBitir;
  DagitmaBitir? dagitmaBasla;
  DagitmaBitir? toplamaBitir;
  DagitmaBitir? toplamaBasla;

  ServisBtn(
      {this.dagitmaBitir,
      this.otoBasla,
      this.otoBitir,
      this.dagitmaBasla,
      this.toplamaBitir,
      this.toplamaBasla});

  ServisBtn.fromJson(Map<String, dynamic> json) {
    dagitmaBitir = json['dagitmaBitir'] != null
        ? new DagitmaBitir.fromJson(json['dagitmaBitir'])
        : null;
    otoBasla = json['otoBasla'] != null
        ? new DagitmaBitir.fromJson(json['otoBasla'])
        : null;
    otoBitir = json['otoBitir'] != null
        ? new DagitmaBitir.fromJson(json['otoBitir'])
        : null;
    dagitmaBasla = json['dagitmaBasla'] != null
        ? new DagitmaBitir.fromJson(json['dagitmaBasla'])
        : null;
    toplamaBitir = json['toplamaBitir'] != null
        ? new DagitmaBitir.fromJson(json['toplamaBitir'])
        : null;
    toplamaBasla = json['toplamaBasla'] != null
        ? new DagitmaBitir.fromJson(json['toplamaBasla'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dagitmaBitir != null) {
      data['dagitmaBitir'] = this.dagitmaBitir!.toJson();
    }
    if (this.otoBasla != null) {
      data['otoBasla'] = this.otoBasla!.toJson();
    }
    if (this.otoBitir != null) {
      data['otoBitir'] = this.otoBitir!.toJson();
    }
    if (this.dagitmaBasla != null) {
      data['dagitmaBasla'] = this.dagitmaBasla!.toJson();
    }
    if (this.toplamaBitir != null) {
      data['toplamaBitir'] = this.toplamaBitir!.toJson();
    }
    if (this.toplamaBasla != null) {
      data['toplamaBasla'] = this.toplamaBasla!.toJson();
    }
    return data;
  }
}

class DagitmaBitir {
  String? id;
  String? mesaj;
  bool? durum;

  DagitmaBitir({this.id, this.mesaj, this.durum});

  DagitmaBitir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mesaj = json['mesaj'];
    durum = json['durum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['mesaj'] = this.mesaj;
    data['durum'] = this.durum;
    return data;
  }
}

class VeliizinBtn {
  Iki? iki;
  Iki? uc;
  Iki? bir;

  VeliizinBtn({this.iki, this.uc, this.bir});

  VeliizinBtn.fromJson(Map<String, dynamic> json) {
    iki = json['iki'] != null ? new Iki.fromJson(json['iki']) : null;
    uc = json['uc'] != null ? new Iki.fromJson(json['uc']) : null;
    bir = json['bir'] != null ? new Iki.fromJson(json['bir']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iki != null) {
      data['iki'] = this.iki!.toJson();
    }
    if (this.uc != null) {
      data['uc'] = this.uc!.toJson();
    }
    if (this.bir != null) {
      data['bir'] = this.bir!.toJson();
    }
    return data;
  }
}

class Iki {
  int? yon;
  bool? kilit;
  bool? sms;
  String? renk;
  bool? durum;
  String? mesaj;
  String? id;

  Iki(
      {this.yon,
      this.kilit,
      this.sms,
      this.renk,
      this.durum,
      this.mesaj,
      this.id});

  Iki.fromJson(Map<String, dynamic> json) {
    yon = json['yon'];
    kilit = json['kilit'];
    sms = json['sms'];
    renk = json['renk'];
    durum = json['durum'];
    mesaj = json['mesaj'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yon'] = this.yon;
    data['kilit'] = this.kilit;
    data['sms'] = this.sms;
    data['renk'] = this.renk;
    data['durum'] = this.durum;
    data['mesaj'] = this.mesaj;
    data['id'] = this.id;
    return data;
  }
}

class Yer {
  double? dLatitude;
  double? dLongitude;

  Yer({
    this.dLatitude,
    this.dLongitude,
  });

  Yer.fromJson(Map<String, dynamic> json) {
    dLatitude = json['_latitude'];
    dLongitude = json['_longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_latitude'] = this.dLatitude;
    data['_longitude'] = this.dLongitude;
    return data;
  }
}

class DagitBtn {
  Yaklasti? yaklasti;
  Yaklasti? indi;
  Yaklasti? serviseBinmedi;
  Yaklasti? serviseBindi;

  DagitBtn({this.yaklasti, this.indi, this.serviseBinmedi, this.serviseBindi});

  DagitBtn.fromJson(Map<String, dynamic> json) {
    yaklasti = json['yaklasti'] != null
        ? new Yaklasti.fromJson(json['yaklasti'])
        : null;
    indi = json['indi'] != null ? new Yaklasti.fromJson(json['indi']) : null;
    serviseBinmedi = json['serviseBinmedi'] != null
        ? new Yaklasti.fromJson(json['serviseBinmedi'])
        : null;
    serviseBindi = json['serviseBindi'] != null
        ? new Yaklasti.fromJson(json['serviseBindi'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.yaklasti != null) {
      data['yaklasti'] = this.yaklasti!.toJson();
    }
    if (this.indi != null) {
      data['indi'] = this.indi!.toJson();
    }
    if (this.serviseBinmedi != null) {
      data['serviseBinmedi'] = this.serviseBinmedi!.toJson();
    }
    if (this.serviseBindi != null) {
      data['serviseBindi'] = this.serviseBindi!.toJson();
    }
    return data;
  }
}

class Yaklasti {
  String? renk;
  bool? sms;
  String? kmesaj;
  String? id;
  bool? cagri;
  String? text;
  bool? kilit;
  int? yon;
  String? mesaj;

  Yaklasti(
      {this.renk,
      this.sms,
      this.kmesaj,
      this.id,
      this.cagri,
      this.text,
      this.kilit,
      this.yon,
      this.mesaj});

  Yaklasti.fromJson(Map<String, dynamic> json) {
    renk = json['renk'];
    sms = json['sms'];
    kmesaj = json['kmesaj'];
    id = json['id'];
    cagri = json['cagri'];
    text = json['text'];
    kilit = json['kilit'];
    yon = json['yon'];
    mesaj = json['mesaj'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['renk'] = this.renk;
    data['sms'] = this.sms;
    data['kmesaj'] = this.kmesaj;
    data['id'] = this.id;
    data['cagri'] = this.cagri;
    data['text'] = this.text;
    data['kilit'] = this.kilit;
    data['yon'] = this.yon;
    data['mesaj'] = this.mesaj;
    return data;
  }
}

class ToplaBtn {
  Yaklasti? serviseBindi;
  Yaklasti? serviseBinmedi;
  Yaklasti? duragaYaklasti;
  Yaklasti? beklendiAlindi;
  Yaklasti? indi;
  Yaklasti? beklendiAlinmadi;

  ToplaBtn(
      {this.serviseBindi,
      this.serviseBinmedi,
      this.duragaYaklasti,
      this.beklendiAlindi,
      this.indi,
      this.beklendiAlinmadi});

  ToplaBtn.fromJson(Map<String, dynamic> json) {
    serviseBindi = json['serviseBindi'] != null
        ? new Yaklasti.fromJson(json['serviseBindi'])
        : null;
    serviseBinmedi = json['serviseBinmedi'] != null
        ? new Yaklasti.fromJson(json['serviseBinmedi'])
        : null;
    duragaYaklasti = json['duragaYaklasti'] != null
        ? new Yaklasti.fromJson(json['duragaYaklasti'])
        : null;
    beklendiAlindi = json['beklendiAlindi'] != null
        ? new Yaklasti.fromJson(json['beklendiAlindi'])
        : null;
    indi = json['indi'] != null ? new Yaklasti.fromJson(json['indi']) : null;
    beklendiAlinmadi = json['beklendiAlinmadi'] != null
        ? new Yaklasti.fromJson(json['beklendiAlinmadi'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviseBindi != null) {
      data['serviseBindi'] = this.serviseBindi!.toJson();
    }
    if (this.serviseBinmedi != null) {
      data['serviseBinmedi'] = this.serviseBinmedi!.toJson();
    }
    if (this.duragaYaklasti != null) {
      data['duragaYaklasti'] = this.duragaYaklasti!.toJson();
    }
    if (this.beklendiAlindi != null) {
      data['beklendiAlindi'] = this.beklendiAlindi!.toJson();
    }
    if (this.indi != null) {
      data['indi'] = this.indi!.toJson();
    }
    if (this.beklendiAlinmadi != null) {
      data['beklendiAlinmadi'] = this.beklendiAlinmadi!.toJson();
    }
    return data;
  }
}

class Odeme {
  SB02hXXTpNHnuhsWwiZQ? sB02hXXTpNHnuhsWwiZQ;

  Odeme({this.sB02hXXTpNHnuhsWwiZQ});

  Odeme.fromJson(Map<String, dynamic> json) {
    sB02hXXTpNHnuhsWwiZQ = json['SB02hXXTpNHnuhsWwiZQ'] != null
        ? new SB02hXXTpNHnuhsWwiZQ.fromJson(json['SB02hXXTpNHnuhsWwiZQ'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sB02hXXTpNHnuhsWwiZQ != null) {
      data['SB02hXXTpNHnuhsWwiZQ'] = this.sB02hXXTpNHnuhsWwiZQ!.toJson();
    }
    return data;
  }
}

class SB02hXXTpNHnuhsWwiZQ {
  String? text;
  int? guncelleme;
  String? hedefId;

  SB02hXXTpNHnuhsWwiZQ({this.text, this.guncelleme, this.hedefId});

  SB02hXXTpNHnuhsWwiZQ.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    guncelleme = json['guncelleme'];
    hedefId = json['hedefId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['guncelleme'] = this.guncelleme;
    data['hedefId'] = this.hedefId;
    return data;
  }
}

class Arama {
  SB02hXXTpNHnuhsWwiZQ? jNfOu0LuYBslSqDJG2mm;

  Arama({this.jNfOu0LuYBslSqDJG2mm});

  Arama.fromJson(Map<String, dynamic> json) {
    jNfOu0LuYBslSqDJG2mm = json['jNfOu0LuYBslSqDJG2mm'] != null
        ? new SB02hXXTpNHnuhsWwiZQ.fromJson(json['jNfOu0LuYBslSqDJG2mm'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jNfOu0LuYBslSqDJG2mm != null) {
      data['jNfOu0LuYBslSqDJG2mm'] = this.jNfOu0LuYBslSqDJG2mm!.toJson();
    }
    return data;
  }
}
