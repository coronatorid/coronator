// "id": 5,
//         "user_id": 1,
//         "lat": 41.0054989,
//         "long": 28.7313008,
//         "created_at": "2020-12-07T16:58:25Z",
//         "updated_at": "2020-12-07T16:58:25Z"

class LocationSerializer {
  final int id;
  final int userID;
  final double lat;
  final double long;
  final DateTime createdAt;
  final DateTime updatedAt;

  LocationSerializer(
    this.id,
    this.userID,
    this.lat,
    this.long,
    this.createdAt,
    this.updatedAt,
  );

  static LocationSerializer fromJson(Map<String, dynamic> json) {
    return LocationSerializer(
      json['id'],
      json['user_id'],
      json['lat'].toDouble(),
      json['long'].toDouble(),
      DateTime.parse(json['created_at']),
      DateTime.parse(json['updated_at']),
    );
  }
}
