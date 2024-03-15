import 'package:flutter/material.dart';
import 'package:dashboard/charging_station.dart';
import 'package:dashboard/my_home_page.dart';
//import 'charging_station_card.dart';

class RightsideData extends StatefulWidget {
  @override
  _RightsideDataState createState() => _RightsideDataState();
}

class _RightsideDataState extends State<RightsideData> {
  late TextEditingController _costController;
  late TextEditingController _slotsController;
  late TextEditingController _distanceController;

  @override
  void initState() {
    super.initState();
    _costController = TextEditingController();
    _slotsController = TextEditingController();
    _distanceController = TextEditingController();
  }

  @override
  void dispose() {
    _costController.dispose();
    _slotsController.dispose();
    _distanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ChargingStation?>(
      valueListenable: selectedStation,
      builder: (context, selectedStation, _) {
        if (selectedStation != null) {
          _costController.text = selectedStation.cost.toString();
          _slotsController.text = selectedStation.slots.toString();
          _distanceController.text = selectedStation.distance.toString();
        }
        return selectedStation != null
            ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Charging Station ${selectedStation.value?.name ?? 'Data'}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _costController,
                        decoration: InputDecoration(
                          labelText: 'Cost/Kwh',
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: Colors.green,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                      ),
                      TextFormField(
                        controller: _slotsController,
                        decoration: InputDecoration(
                          labelText: 'Available Slots',
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.car_repair,
                            color: Colors.blue,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                      ),
                      TextFormField(
                        controller: _distanceController,
                        decoration: InputDecoration(
                          labelText: 'Queue',
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.queue,
                            color: Colors.yellow,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 16.0),
                      Wrap(
                        spacing: 10.0,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedStation.cost =
                                    double.parse(_costController.text);
                                selectedStation.slots =
                                    int.parse(_slotsController.text);
                                selectedStation.distance =
                                    double.parse(_distanceController.text);
                              });
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _costController.text =
                                    selectedStation.cost.toString();
                                _slotsController.text =
                                    selectedStation.slots.toString();
                                _distanceController.text =
                                    selectedStation.distance.toString();
                              });
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Container(); // Empty container when no station is selected
      },
    );
  }
}
