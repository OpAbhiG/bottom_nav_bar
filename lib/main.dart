import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70, // Subtle shadow color

    body: IndexedStack(
        index: _currentIndex,
        children: [
          DashboardScreen(),
          DoctorListScreen(),
          ProfileScreen(),
          AppointmentScreen(),
          TreatmentScreen(),
        ],
      ),
      floatingActionButton : Container(
        height: 50, // Adjust the size of the outer circle
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Color(0xFF243B6D),
            // color: Colors.white,
            width: 5,         // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Subtle shadow color
              blurRadius: 10,                       // Blur effect
              offset: Offset(0, 5),                 // Shadow position
            ),
          ],
        ),
        child: FloatingActionButton.small (
          onPressed: () {
            setState(() {
              _currentIndex = 2; // Navigate to the Profile screen
            });
          },
          backgroundColor: const Color(0xFF243B6D), // FAB background color
          elevation: 4, // Prevent additional shadow from the FAB itself
          // child: const Icon(
          //   Icons.person,
          //   size: 25,
          //   color:Colors.white, // FAB background color
          // ),
          child: Image.asset(
            'assets/b-nobg.png', // Use your image
            fit: BoxFit.cover,
            height: 30, // Adjust the image size
            width: 30,
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
  Widget _buildBottomNavBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 4.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0), // Reduce vertical padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.grid_view_sharp, 'Dashboard', 0),
            _buildNavItem(Icons.monitor_heart, 'Doctors', 1),
            const SizedBox(width: 50), // Space for the FAB
            _buildNavItem(Icons.calendar_month, 'Appointment', 3),
            _buildNavItem(Icons.medical_services, 'Treatment', 4),
          ],
        ),
      ),
    );
  }




  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 18, // Smaller icon size
            color: isSelected ? const Color(0xFF243B6D) : Colors.grey,
          ),
          const SizedBox(height: 0), // Less spacing between icon and label
          Text(
            label,
            style: TextStyle(
              fontSize: 9, // Smaller text size
              fontWeight: FontWeight.bold,
              color: isSelected ? const Color(0xFF243B6D) : const Color(0xFFB0B0B0),
            ),
          ),
        ],
      ),
    );
  }




}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

// Dummy screens for navigation
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Dashboard Screen"));
  }
}

class DoctorListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Doctor List Screen"));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile Screen"));
  }
}

class AppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Appointment Screen"));
  }
}

class TreatmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Treatment Screen"));
  }
}
