// charging_station.dart
class ChargingStation {
  final String name;
  final String details;
  double cost; // New property
  int slots; // New property
  double distance; // New property

  ChargingStation({
    required this.name,
    required this.details,
    required this.cost,
    required this.slots,
    required this.distance,
  });

  get value => null;
}
