import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/beranda_screen.dart';
import 'screens/peta_screen.dart';
import 'screens/cerita_screen.dart';
import 'screens/favorit_screen.dart';
import 'screens/profil_screen.dart';

void main() {
  runApp(const ExploreTubanApp());
}

class ExploreTubanApp extends StatelessWidget {
  const ExploreTubanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Tuban',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAF6EE),
        primaryColor: const Color(0xFF8B4513),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B4513),
          primary: const Color(0xFF8B4513),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const BerandaScreen(),
    const PetaScreen(),
    const CeritaScreen(),
    const FavoritScreen(),
    const ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF8B4513),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Peta'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Cerita'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorit'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}