import 'package:flutter/material.dart';

class ChargingStationMenu extends StatefulWidget {
  @override
  _ChargingStationMenuState createState() => _ChargingStationMenuState();
}

class _ChargingStationMenuState extends State<ChargingStationMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  //late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    //_animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      height: 650.0, // Increase height
      color: Color(0xFF21222D),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100.0),
          buildMenuItem('Dashboard', Icons.dashboard_customize, () {
            // Handle Dashboard Click
          }),
          buildSeparator(),
          buildMenuItem('CS', Icons.map_sharp, () {
            // Handle CS Click
          }),
          buildSeparator(),
          buildMenuItem('Logout', Icons.logout, () {
            // Handle Logout Click
          }),
        ],
      ),
    );
  }

  Widget buildSeparator() {
    return Container(
      height: 1,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
    );
  }

  Widget buildMenuItem(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Add curved padding
          color: Colors.transparent, // Transparent background
          border: Border(
            left: BorderSide(
              color: Colors.transparent,
              width: 4.0, // Highlighter width
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.grey[50],
              ),
              SizedBox(width: 16.0),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[50],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  // Add your preferred font family here
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
