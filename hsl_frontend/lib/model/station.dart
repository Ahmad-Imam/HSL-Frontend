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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fid'] = fid;
    data['id'] = id;
    data['nimi'] = nimi;
    data['namn'] = namn;
    data['name'] = name;
    data['osoite'] = osoite;
    data['address'] = address;
    data['kaupunki'] = kaupunki;
    data['stad'] = stad;
    data['operaatto'] = operaatto;
    data['kapasiteet'] = kapasiteet;
    data['x'] = x;
    data['y'] = y;
    return data;
  }
}
