class arama1 {
  Arama? arama;

  arama1({this.arama});

  arama1.fromJson(Map<String, dynamic> json) {
    arama = json['arama'] != null ? new Arama.fromJson(json['arama']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.arama != null) {
      data['arama'] = this.arama!.toJson();
    }
    return data;
  }
}

class Arama {
  arama2? arama3;

  Arama({this.arama3});

  Arama.fromJson(Map<String, dynamic> json) {
    arama3 = json['jNfOu0LuYBslSqDJG2mm'] != null
        ? new arama2.fromJson(json['jNfOu0LuYBslSqDJG2mm'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.arama3 != null) {
      data['jNfOu0LuYBslSqDJG2mm'] = this.arama3!.toJson();
    }
    return data;
  }
}

class arama2 {
  int? guncelleme;
  String? text;
  String? hedefId;

  arama2({this.guncelleme, this.text, this.hedefId});

  arama2.fromJson(Map<String, dynamic> json) {
    guncelleme = json['guncelleme'];
    text = json['text'];
    hedefId = json['hedefId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guncelleme'] = this.guncelleme;
    data['text'] = this.text;
    data['hedefId'] = this.hedefId;
    return data;
  }
}
