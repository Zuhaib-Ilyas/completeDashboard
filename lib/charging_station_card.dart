import 'package:flutter/material.dart';
import 'charging_station.dart';
import 'package:dashboard/my_home_page.dart';

class ChargingStationCard extends StatefulWidget {
  final ChargingStation chargingStation;

  ChargingStationCard(this.chargingStation);

  @override
  _ChargingStationCardState createState() => _ChargingStationCardState();
}

class _ChargingStationCardState extends State<ChargingStationCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedStation.value != widget.chargingStation) {
            if (selectedStation.value != null) {
              // Reset color of previously selected card
              selectedStation.value = null;
            }
            isSelected = true;
          } else {
            isSelected = !isSelected;
          }
          selectedStation.value = isSelected ? widget.chargingStation : null;
        });
      },
      child: ValueListenableBuilder<ChargingStation?>(
        valueListenable: selectedStation,
        builder: (context, selectedStation, _) {
          if (selectedStation != null) {
            isSelected = selectedStation == widget.chargingStation;
          } else {
            isSelected = false;
          }
          return Card(
            elevation: 5.0,
            color: isSelected
                ? const Color.fromARGB(255, 0, 140, 255)
                : Color(0xFF21222D), // Change color for selected card
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ev_station, // Choose appropriate icon
                        color: Colors.blue, // Adjust icon color as needed
                      ),
                      SizedBox(
                          width: 8), // Adjust spacing between icon and text
                      Text(
                        widget.chargingStation.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
