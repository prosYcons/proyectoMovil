import 'package:flutter/material.dart';
import 'package:proyecto/home.dart';
import 'package:proyecto/settings.dart';
import 'package:proyecto/utils/constants.dart' as con;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: con.colorBack,
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Spacer(),
                    Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),

              //profile pic
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),

                  Positioned(
                    bottom: 5,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: con.brightGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "PRO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),

              //nombre
              Text(
                "Josué Cedillo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8),

              //su cosa de nivel
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: con.brightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Recursion Rookie",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              
              SizedBox(height: 10),
              
              Text(
                "Level 12 - 1,250 XP",
                style: TextStyle(color: con.colorBlight),
              ),

              SizedBox(height: 20),

              //progerso
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Rank Progress",
                      style: TextStyle(color: con.colorBlight),
                    ),
                    const SizedBox(height: 5),
                    LinearProgressIndicator(
                      value: 0.3,
                      backgroundColor: con.colorBlight,
                      color: con.colorBot,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "30% to Dynamic Programmer",
                      style: TextStyle(color: con.colorBlight, fontSize: 12),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              //badges
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Earned Badges",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(color: con.colorBot),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    badgeCard("Loop Master"),
                    badgeCard("Big-O Expert"),
                    badgeCard("Array Ace"),
                    badgeCard("Logic Unit"),
                  ],
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),

      //navbar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: con.colorBox,
        selectedItemColor: con.colorSel,
        unselectedItemColor: con.colorBlight,
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        onTap: (index) {
          if(index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Home()),
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

  //cosa para los badges
  static Widget badgeCard(String title) {
    return Container(
      decoration: BoxDecoration(
        color: con.colorBox,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.emoji_events, color: Colors.amber, size: 40),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
