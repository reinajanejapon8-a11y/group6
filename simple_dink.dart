import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Drink Menu',
      theme: ThemeData(
        primaryColor: const Color(0xFF800000),
        scaffoldBackgroundColor: const Color(0xFF800000),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5C0000),
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFA01010),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ========== PAGE 1 — HOME ==========
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Drink Menu')),
      body: Container(
        color: const Color(0xFF800000),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome!',
                style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Choose a category below',
                style: TextStyle(fontSize: 18, color: Colors.white70),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const HotDrinksPage()));
                },
                icon: const Icon(Icons.coffee),
                label: const Text('Hot Drinks'),
                style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ColdDrinksPage()));
                },
                icon: const Icon(Icons.icecream),
                label: const Text('Cold Drinks'),
                style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SmoothiesPage()));
                },
                icon: const Icon(Icons.blender),
                label: const Text('Smoothies'),
                style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage()));
                },
                icon: const Icon(Icons.info),
                label: const Text('About Us'),
                style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========== PAGE 2 — HOT DRINKS ==========
class HotDrinksPage extends StatelessWidget {
  const HotDrinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hot Drinks')),
      body: Container(
        color: const Color(0xFF800000),
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            _buildDrinkCard('Classic Coffee', '₱60.00', Icons.coffee),
            _buildDrinkCard('Hot Chocolate', '₱70.00', Icons.coffee_maker),
            _buildDrinkCard('Ginger Tea', '₱50.00', Icons.emoji_food_beverage),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.thumb_up, color: Colors.white),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back to Menu'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrinkCard(String name, String price, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.yellow[300], size: 28),
              const SizedBox(width: 12),
              Text(
                name,
                style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 😎,
          Text(
            'Price: $price',
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

// ========== PAGE 3 — COLD DRINKS ==========
class ColdDrinksPage extends StatelessWidget {
  const ColdDrinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cold Drinks')),
      body: Container(
        color: const Color(0xFF800000),
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          shrinkWrap: true,
          children: [
            _buildDrinkCard('Iced Coffee', '₱85.00', Icons.coffee),
            _buildDrinkCard('Iced Tea', '₱55.00', Icons.emoji_food_beverage),
            _buildDrinkCard('Lemonade', '₱50.00', Icons.water),
            _buildDrinkCard('Milk Tea', '₱95.00', Icons.local_cafe),
          ],
        ),
      ),
    );
  }

  Widget _buildDrinkCard(String name, String price, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.yellow[300], size: 36),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            price,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

// ========== PAGE 4 — SMOOTHIES ==========
class SmoothiesPage extends StatelessWidget {
  const SmoothiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smoothies')),
      body: Container(
        color: const Color(0xFF800000),
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            _buildDrinkCard('Mango Smoothie', '₱110.00', Icons.blender),
            _buildDrinkCard('Banana Smoothie', '₱100.00', Icons.blender),
            _buildDrinkCard('Strawberry Smoothie', '₱115.00', Icons.blender),
            _buildDrinkCard('Avocado Smoothie', '₱105.00', Icons.blender),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.favorite, color: Colors.pink),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrinkCard(String name, String price, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.yellow[300], size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                price,
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ========== PAGE 5 — ABOUT ==========
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      body: Container(
        color: const Color(0xFF800000),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.local_drink, size: 80, color: Colors.white),
              const SizedBox(height: 20),
              const Text(
                'My Drink Menu',
                style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Version 1.0.0',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Made with ❤️\nCastilla College Student Project',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.home, color: Colors.white),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back to Home'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}