import 'package:flutter/material.dart';
// import 'package:meal_recipe_app/screens/category_screens.dart';
import 'package:meal_recipe_app/screens/favourite_screens.dart';
import 'package:meal_recipe_app/screens/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [const HomePage(),const FavouriteScreen()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        // elevation: 3,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        selectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourites'),
        ],
      ),
    );
  }
}
