class Station {
  late String fid;
  late String id;
  late String nimi;
  late String namn;
  late String name;
  late String osoite;
  late String address;
  late String kaupunki;
  late String stad;
  late String operaatto;
  late String kapasiteet;
  late String x;
  late String y;

  Station(
      {required this.fid,
      required this.id,
      required this.nimi,
      required this.namn,
      required this.name,
      required this.osoite,
      required this.address,
      required this.kaupunki,
      required this.stad,
      required this.operaatto,
      required this.kapasiteet,
      required this.x,
      required this.y});

  Station.fromJson(Map<String, dynamic> json) {
    fid = json['fid'];
    id = json['id'];
    nimi = json['nimi'];
    namn = json['namn'];
    name = json['name'];
    osoite = json['osoite'];
    address = json['address'];
    kaupunki = json['kaupunki'];
    stad = json['stad'];
    operaatto = json['operaatto'];
    kapasiteet = json['kapasiteet'];
    x = json['x'];
    y = json['y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fid'] = this.fid;
    data['id'] = this.id;
    data['nimi'] = this.nimi;
    data['namn'] = this.namn;
    data['name'] = this.name;
    data['osoite'] = this.osoite;
    data['address'] = this.address;
    data['kaupunki'] = this.kaupunki;
    data['stad'] = this.stad;
    data['operaatto'] = this.operaatto;
    data['kapasiteet'] = this.kapasiteet;
    data['x'] = this.x;
    data['y'] = this.y;
    return data;
  }
}
