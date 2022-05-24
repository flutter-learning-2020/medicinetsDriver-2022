import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:map_launcher/map_launcher.dart';

class MapLauchOrInstall {
  double latitude;
  double longitude;
  String title;
  String nombreDelMapaAMostrar;

  MapLauchOrInstall(
      {required this.latitude,
      required this.longitude,
      required this.title,
      required this.nombreDelMapaAMostrar});

  mapLauncherMyFunc() async {
    final availableMaps = await MapLauncher.installedMaps;
    print(availableMaps);
    bool existAppMap = false;

    availableMaps.forEach((map) {
      if (map.mapName == nombreDelMapaAMostrar) {
        existAppMap = true;
        MapLauncher.showMarker(
          zoom: 16,
          coords: Coords(latitude, longitude),
          title: title,
          mapType: map.mapType,
        );
      }
    });

    if (existAppMap == false) {
      if (nombreDelMapaAMostrar == "Google Maps") {
        await LaunchApp.openApp(
            androidPackageName: 'com.google.android.apps.maps',
            iosUrlScheme: 'com.google.Maps',
            openStore: true);
      }
      if (nombreDelMapaAMostrar == "Waze") {
        await LaunchApp.openApp(
            androidPackageName: 'com.waze',
            iosUrlScheme: 'com.waze',
            openStore: true);
      }
    }
  }
}
