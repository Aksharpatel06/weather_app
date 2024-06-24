import 'package:weather_app/view/modal/current_modal.dart';
import 'package:weather_app/view/modal/location_modal.dart';

class Weather {
  LocationModal locationModal;

  CurrentModal currentModal;

  Weather({required this.locationModal, required this.currentModal});

  factory Weather.getData(Map json) {
    return Weather(
        locationModal: LocationModal.getData(json['location']),
        currentModal: CurrentModal.fromJson(json['current']));
  }
}
