// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// Charging Station class

class ChargingStation {
  final String id;
  final int availableSlots;
  final double cost;

  final List<double> location;
  final int queue;

  ChargingStation({
    required this.id,
    required this.availableSlots,
    required this.cost,
    required this.location,
    required this.queue,
  });

  factory ChargingStation.fromJson(Map<String, dynamic> json) {
    return ChargingStation(
      id: json['id'],
      availableSlots: json['available_slots'],
      cost: json['cost'],
      location: List<double>.from(json['location']),
      queue: json['queue'],
    );
  }
}

// Charging Station class

class csProvider extends ChangeNotifier {
  Map<String, dynamic> _chargingStations = {};
  Map<String, dynamic> get chargingStations => _chargingStations;

  set chargingStations(Map<String, dynamic> value) {
    _chargingStations = value;
    notifyListeners();
  }
}
