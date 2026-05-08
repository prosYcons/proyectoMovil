import 'package:flutter/material.dart';
import 'package:proyecto/home.dart';
import 'package:proyecto/profile.dart';
import 'package:proyecto/rank.dart';
import 'package:proyecto/settings.dart';
import 'package:proyecto/utils/constants.dart' as con;

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: con.colorBack,

      //appbar
      appBar: AppBar(
        backgroundColor: con.colorCont,
        elevation: 0,
        title: Text(
          "Course Details",
          style: TextStyle(color: Colors.white,),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Home(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),

              //grafica
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff002647), Color(0xff005096)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    7,
                    (index) => Container(
                      width: 30,
                      height: 40.0 + (index * 15),
                      decoration: BoxDecoration(
                        color: con.colorBot,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sorting Algorithms",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Master time complexity, stability, and divide and conquer strategies.",
                  style: TextStyle(color: con.colorBlight),
                ),
              ),

              SizedBox(height: 15),

              //progreso
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Curriculum",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "1 of 3 Lessons",
                      style: TextStyle(color: con.colorBot),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: LinearProgressIndicator(
                  value: 0.33,
                  backgroundColor: con.colorBlight,
                  color: con.colorBot,
                ),
              ),

              SizedBox(height: 20),

              //lessons
              lessonCard("1. Bubble Sort", "The basics of swapping", status: "done"),

              lessonCard("2. Merge Sort", "Divide and conquer approach", progress: "45%", isActive: true),

              lessonCard("3. Quick Sort", "Efficient partitioning logic", locked: true),

              SizedBox(height: 20),

              //boton
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ElevatedButton.icon(
                  onPressed: (){},
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 20,
                  ),
                  label: Text(
                    "Start Next Lesson",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: con.colorBot,
                    minimumSize: Size(double.infinity, 50),
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
        currentIndex: 1,
        onTap: (index) {
          if(index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Home()),
            );
          }
          if(index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => Rank()),
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

  static Widget lessonCard(String title, String subtitle, {String? status, String? progress, bool isActive = false, bool locked = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: con.colorCont,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isActive ? con.colorBot : con.colorBlight,
          width: 4,
        ),
      ),
      child: Row(
        children: [
          //icono
          Icon(
            locked ? Icons.lock : isActive ? Icons.play_circle : Icons.check_circle,
            color: locked ? con.colorBlight : isActive ? con.colorBot : con.brightGreen,
          ),

          SizedBox(width: 10),

          //texto de la cosa esa
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          //estado
          if(status != null)
            Text(
              "DONE",
              style: TextStyle(color: con.brightGreen),
            ),

          if(progress != null)
            Text(
              progress,
              style: TextStyle(color: con.colorBot),
            ),

          if(locked)
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: con.colorBlight,
            ),
        ],
      ),
    );
  }
}
