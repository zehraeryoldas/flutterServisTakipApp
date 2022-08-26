class odeme1 {
  Odeme? odeme;

  odeme1({this.odeme});

  odeme1.fromJson(Map<String, dynamic> json) {
    odeme = json['odeme'] != null ? new Odeme.fromJson(json['odeme']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.odeme != null) {
      data['odeme'] = this.odeme!.toJson();
    }
    return data;
  }
}

class Odeme {
  odeme2? odeme3;

  Odeme({this.odeme3});

  Odeme.fromJson(Map<String, dynamic> json) {
    odeme3 = json['SB02hXXTpNHnuhsWwiZQ'] != null
        ? new odeme2.fromJson(json['SB02hXXTpNHnuhsWwiZQ'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.odeme3 != null) {
      data['SB02hXXTpNHnuhsWwiZQ'] = this.odeme3!.toJson();
    }
    return data;
  }
}

class odeme2 {
  String? text;
  int? guncelleme;
  String? hedefId;

  odeme2({this.text, this.guncelleme, this.hedefId});

  odeme2.fromJson(Map<String, dynamic> json) {
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
