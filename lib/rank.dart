import 'package:flutter/material.dart';
import 'package:proyecto/home.dart';
import 'package:proyecto/profile.dart';
import 'package:proyecto/settings.dart';
import 'package:proyecto/utils/constants.dart' as con;

class Rank extends StatefulWidget {
  const Rank({super.key});

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: con.colorBack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //herader
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Spacer(),
                    const Text(
                      "My Path",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              //stats
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(child: statCard("TIME SPENT", "12.5 hrs")),
                    SizedBox(width: 10),
                    Expanded(child: statCard("MASTERED", "18/50")),
                  ],
                ),
              ),

              SizedBox(height: 20),

              //foundations
              sectionTitle("Foundations", "Section completed"),

              timelineItem("Bubble Sort", true),
              timelineItem("Selection Sort", true),
              timelineItem("Merge Sort", true),

              SizedBox(height: 15),

              //data strucutres
              sectionTitle("Data Structures", "In progress"),

              timelineItem("Binary Search Trees", false, isCurrent: true),
              progressBar(),

              timelineItem("AVL Trees", false),

              SizedBox(height: 15),

              //boton de resume
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton.icon(
                  onPressed: () {}, //PONER A LA VISTA QUE CORRESPONDA-----------------------------
                  icon: Icon(Icons.play_arrow, color: Colors.white),
                  label: Text(
                    "Resume Binary Search Trees",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: con.colorBot,
                    minimumSize: Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
        currentIndex: 2,
        onTap: (index) {
          if(index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Home()),
            );
          }
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
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Path"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  static Widget statCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: con.colorBox,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(title,
              style: const TextStyle(color: con.colorBot, fontSize: 12)),
          const SizedBox(height: 5),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ],
      ),
    );
  }

  static Widget sectionTitle(String title, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          Text(status,
              style: const TextStyle(color: con.brightGreen, fontSize: 12)),
        ],
      ),
    );
  }

  static Widget timelineItem(String title, bool completed, {bool isCurrent = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Icon(
                completed
                    ? Icons.check_circle
                    : isCurrent
                    ? Icons.play_circle
                    : Icons.circle,
                color: completed
                    ? con.colorBot
                    : isCurrent
                    ? con.colorBot
                    : con.colorBlight,
              ),
              Container(
                width: 2,
                height: 40,
                color: con.colorBlight,
              ),
            ],
          ),

          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                    color: isCurrent ? con.colorBot : Colors.white,
                    fontWeight:
                    isCurrent ? FontWeight.bold : FontWeight.normal,
                  )),
              const SizedBox(height: 3),
              Text(
                completed
                    ? "Completed"
                    : isCurrent
                    ? "Current"
                    : "Locked",
                style: const TextStyle(color: con.colorBlight, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget progressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: LinearProgressIndicator(
        value: 0.6,
        backgroundColor: con.colorBlight,
        color: con.colorBot,
      ),
    );
  }
}
