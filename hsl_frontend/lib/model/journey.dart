// ignore_for_file: non_constant_identifier_names

class Journey {
  late String departureDate;
  late String returnDate;
  late String departureId;
  late String departureName;
  late String returnId;
  late String returnName;
  late String coverDistance;
  late String duration;

  Journey(
      {required this.departureDate,
      required this.returnDate,
      required this.departureId,
      required this.departureName,
      required this.returnId,
      required this.returnName,
      required this.coverDistance,
      required this.duration});

  Journey.fromJson(Map<String, dynamic> json) {
    departureDate = json['departure_date'];
    returnDate = json['return_date'];
    departureId = json['departure_id'];
    departureName = json['departure_name'];
    returnId = json['return_id'];
    returnName = json['return_name'];
    coverDistance = json['cover_distance'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departure_date'] = this.departureDate;
    data['return_date'] = this.returnDate;
    data['departure_id'] = this.departureId;
    data['departure_name'] = this.departureName;
    data['return_id'] = this.returnId;
    data['return_name'] = this.returnName;
    data['cover_distance'] = this.coverDistance;
    data['duration'] = this.duration;
    return data;
  }
}
