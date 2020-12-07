import 'package:coronator/src/interface/request_interface.dart';

class TrackRequestSerializer implements RequestInterface {
  final double lat;
  final double long;

  TrackRequestSerializer(this.lat, this.long);

  @override
  Map<String, dynamic> toJson() {
    return {
      'lat': this.lat,
      'long': this.long,
    };
  }
}
