import 'package:coronator/src/core/api/api_builder.dart';
import 'package:coronator/src/provider/auth_provider.dart';
import 'package:coronator/src/serializer/location_serializer.dart';
import 'package:coronator/src/serializer/track_request_serializer.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TrackAPI {
  final APIBuilder _apiBuilder;

  TrackAPI(this._apiBuilder);

  Future<LocationSerializer> track(
      BuildContext context, double lat, long) async {
    AuthProvider authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );

    LocationSerializer locationSerializer = await this._apiBuilder.post(
          context,
          "/tracker/update",
          TrackRequestSerializer(lat, long),
          responseMapper: LocationSerializer.fromJson,
          token: authProvider.getLogin().auth.token,
        );

    return locationSerializer;
  }
}
