import 'package:flutter/material.dart';
import 'home.dart'; // Import HomePage
import 'planner.dart'; // Import PlannerPage
import 'quotes.dart'; // Import QuotesPage
// Entry point of the Flutter app
void main() {
  runApp(const MyApp());// Runs the root widget
}

// MAIN APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});// Constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Motivation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),// First screen to show
    );
  }
}

// MAIN SCREEN WITH BOTTOM NAVIGATION
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;// Tracks the selected bottom nav item

  final List<Widget> _screens = [
    const HomePage(),
    const PlannerPage(),
    const QuotesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),// Home tab
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_calendar),
            label: "Planner",  // Planner tab
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: "Quotes", // Quotes tab
          ),
        ],
      ),
    );
  }
}