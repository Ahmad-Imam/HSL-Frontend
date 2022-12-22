class JourneyList {
  late String departure_date;
  late String return_date;
  late String departureId;
  late String departureName;
  late String returnId;
  late String returnName;
  late String coverDistance;
  late String duration;

  JourneyList(
      {required this.departure_date,
      required this.return_date,
      required this.departureId,
      required this.departureName,
      required this.returnId,
      required this.returnName,
      required this.coverDistance,
      required this.duration});

  JourneyList.fromJson(Map<String, dynamic> json) {
    departure_date = json['departure_date'];
    return_date = json['return_date'];
    departureId = json['departure_id'];
    departureName = json['departure_name'];
    returnId = json['return_id'];
    returnName = json['return_name'];
    coverDistance = json['cover_distance'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departure_date'] = this.departure_date;
    data['return_date'] = this.return_date;
    data['departure_id'] = this.departureId;
    data['departure_name'] = this.departureName;
    data['return_id'] = this.returnId;
    data['return_name'] = this.returnName;
    data['cover_distance'] = this.coverDistance;
    data['duration'] = this.duration;
    return data;
  }
}
