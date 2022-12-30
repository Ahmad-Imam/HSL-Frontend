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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['departure_date'] = departureDate;
    data['return_date'] = returnDate;
    data['departure_id'] = departureId;
    data['departure_name'] = departureName;
    data['return_id'] = returnId;
    data['return_name'] = returnName;
    data['cover_distance'] = coverDistance;
    data['duration'] = duration;
    return data;
  }
}
