// my_home_page.dart
import 'package:flutter/material.dart';
import 'charging_station_card.dart';
import 'charging_station.dart';
import 'charging_station_menu.dart';
import 'package:dashboard/rightsideData.dart';

// my_home_page.dart
ValueNotifier<ChargingStation?> selectedStation =
    ValueNotifier<ChargingStation?>(null);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ChargingStation> chargingStations = [
    ChargingStation(
      name: 'Station 1',
      details: 'Details for Station 1',
      cost: 10.0,
      slots: 5,
      distance: 3.5,
    ),
    ChargingStation(
      name: 'Station 2',
      details: 'Details for Station 2',
      cost: 12.0,
      slots: 3,
      distance: 4.2,
    ),
    ChargingStation(
      name: 'Station 3',
      details: 'Details for Station 3',
      cost: 8.0,
      slots: 8,
      distance: 2.8,
    ),
    // Add 8 more stations
    ChargingStation(
      name: 'Station 4',
      details: 'Details for Station 4',
      cost: 9.0,
      slots: 6,
      distance: 5.0,
    ),
    ChargingStation(
      name: 'Station 5',
      details: 'Details for Station 5',
      cost: 11.0,
      slots: 4,
      distance: 3.2,
    ),
    ChargingStation(
      name: 'Station 6',
      details: 'Details for Station 6',
      cost: 7.0,
      slots: 7,
      distance: 4.5,
    ),
    ChargingStation(
      name: 'Station 7',
      details: 'Details for Station 7',
      cost: 13.0,
      slots: 2,
      distance: 6.2,
    ),
    ChargingStation(
      name: 'Station 8',
      details: 'Details for Station 8',
      cost: 8.5,
      slots: 5,
      distance: 3.8,
    ),
    ChargingStation(
      name: 'Station 9',
      details: 'Details for Station 9',
      cost: 10.5,
      slots: 3,
      distance: 4.8,
    ),
    ChargingStation(
      name: 'Station 10',
      details: 'Details for Station 10',
      cost: 7.5,
      slots: 6,
      distance: 3.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charging Stations'),
      ),
      backgroundColor: Color(0xFF171821),
      body: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChargingStationMenu(),
              SizedBox(
                  height: 16.0), // Add space between the menu and the GridView
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 4 boxes in each row
                  crossAxisSpacing: 0.1, // Horizontal spacing between boxes
                  mainAxisSpacing: 0.1, // Vertical spacing between boxes
                  childAspectRatio: 2, // Adjust aspect ratio for smaller boxes
                ),
                itemCount: chargingStations.length,
                itemBuilder: (context, index) {
                  return ChargingStationCard(chargingStations[index]);
                },
              ),
            ),
          ),
          Container(
            width: 450.0, // Adjust the width as needed
            color:
                Color(0xFF21222D), // Example color, change as per your design
            child:
                RightsideData(), // Replace YourRightWidget() with your actual widget
          ),
        ],
      ),
    );
  }
}
