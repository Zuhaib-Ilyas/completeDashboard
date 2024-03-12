import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charging Stations Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      ////
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<ChargingStation> chargingStations = [
    ChargingStation(name: 'Station 1', details: 'Details for Station 1'),
    ChargingStation(name: 'Station 2', details: 'Details for Station 2'),
    ChargingStation(name: 'Station 3', details: 'Details for Station 3'),
    // Add more stations as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charging Stations'),
      ),
      body: Row(
        children: [
          // Left Menu
          Container(
            width: 150.0,
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    // Handle Dashboard Click
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle CS Click
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'CS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle Logout Click
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Charging Stations
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: chargingStations.length,
                itemBuilder: (context, index) {
                  return ChargingStationCard(chargingStations[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChargingStation {
  final String name;
  final String details;

  ChargingStation({required this.name, required this.details});
}

class ChargingStationCard extends StatefulWidget {
  final ChargingStation chargingStation;

  ChargingStationCard(this.chargingStation);

  @override
  _ChargingStationCardState createState() => _ChargingStationCardState();
}

class _ChargingStationCardState extends State<ChargingStationCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: Card(
        elevation: 5.0,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.chargingStation.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              if (expanded)
                Text(
                  widget.chargingStation.details,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
