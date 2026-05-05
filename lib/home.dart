import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:proyecto/map.dart';
import 'package:proyecto/profile.dart';
import 'package:proyecto/settings.dart';
import 'package:proyecto/utils/constants.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: con.colorBack,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //la cosa de arriba que no se como se llama en español pero es el header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: con.colorBot),
                        SizedBox(width: 16),
                        Text(
                          "Welcome, Josué",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Mapa(),
                              ),
                            );
                          },
                          icon: Icon(Icons.location_on, color: con.colorBlight),
                        ),

                        IconButton(
                          onPressed: () {}, //lago de notificaciones pero no se que
                          icon: Icon(Icons.campaign, color: con.colorBlight),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10),

                //cosa de buscar
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: con.colorBox,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.white54),
                      hintText: "Search algorithms...",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                //cosa de los streaks/weekly progress
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff29a2fe), Color(0xff340bb5)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WEEKLY PROGRESS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),

                      Text(
                        "7 Day Streak 🔥",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),

                      Text(
                        "You're on fire! Keep it up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                //daily challenges o como se diga en español
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Daily Challenges",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: con.colorBot),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: challengeCard("Binary Search Master"),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: challengeCard("Quicksort Challenge"),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                //learning paths
                Text(
                  "Learning Paths",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                learningCard("Sorting Algorithm"),
                SizedBox(height: 10),
                learningCard("Searching Techniques"),
                SizedBox(height: 10),
                learningCard("Graph Theory", locked: true),
              ],
            ),
          ),
        ),
      ),

      //navegacion de abajo la cosa con todas las paginas/vistas, esa cosa, me entienden
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: con.colorBox,
        selectedItemColor: con.colorSel,
        unselectedItemColor: con.colorBlight,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          if(index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Profile()),
            );
          }
          if(index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Settings()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Library"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Rank"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  //challenge card
  static Widget challengeCard(String title) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: con.colorBox,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  //learning card
  static Widget learningCard(String title, {bool locked = false}) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: con.colorBox,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(Icons.code, color: Colors.white),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Icon(
            locked ? Icons.lock : Icons.arrow_forward,
            color: Colors.white54,
          ),
        ],
      ),
    );
  }
}
