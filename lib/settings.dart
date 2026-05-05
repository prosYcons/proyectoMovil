import 'package:flutter/material.dart';
import 'package:proyecto/home.dart';
import 'package:proyecto/login.dart';
import 'package:proyecto/profile.dart';
import 'package:proyecto/rank.dart';
import 'package:proyecto/utils/constants.dart' as con;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool darkMode = true;
  bool dailyReminder = false;

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
                      "Settings",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),

              //card del perfil
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: con.colorCont,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                    ),
                    SizedBox(width: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Josué Cedillo",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "Level 12 - Recursion Rookie",
                          style: TextStyle(color: con.colorBlight),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              //info personal
              sectionTitle("Personal Information"),

              infoCard([
                infoTile(Icons.person, "Full Name", "Josué Cedillo"),
                divider(),
                infoTile(Icons.email, "Email Address", "josue@gmail.com"),
              ]),

              SizedBox(height: 20),

              //preferencias
              sectionTitle("Preferences"),

              switchTile(
                icon: Icons.dark_mode,
                title: "Dark Mode",
                value: darkMode,
                onChanged: (val) {
                  setState(() => darkMode = val);
                },
              ),

              switchTile(icon: Icons.notifications,
                title: "Daily Reminder",
                value: dailyReminder,
                onChanged: (val) {
                  setState(() => dailyReminder = val);
                },
              ),

              SizedBox(height: 20),

              //acc set
              sectionTitle("Account Settings"),

              infoCard([
                simpleTile(Icons.lock, "Change Password"),
                divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.workspace_premium, color: con.colorBlight),
                        SizedBox(width: 10),
                        Text("Subscription Plan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
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
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Login(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.red),
                      SizedBox(width: 10),
                      Text(
                        "Log Out",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                )
              ]),

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
        currentIndex: 4,
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

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget infoCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: con.colorCont,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(children: children),
    );
  }

  Widget infoTile(IconData icon, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white70),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(color: con.colorBlight)),
                Text(value,
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
        const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
      ],
    );
  }

  Widget simpleTile(IconData icon, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
        const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
      ],
    );
  }

  Widget switchTile({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: con.colorBox,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(title,
                style: const TextStyle(color: Colors.white)),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: con.colorBot,
          ),
        ],
      ),
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Divider(color: Colors.white24),
    );
  }
}
