import 'package:flutter/material.dart';
import 'package:proyecto/home.dart';
import 'package:proyecto/rank.dart';
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
          "Merge Sort",
          style: TextStyle(color: Colors.white,),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Rank(),
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
              //progress
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "LESSON PROGRESS",
                          style: TextStyle(
                            color: con.colorBlight,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                            "Step 3 of 8",
                            style: TextStyle(
                              color: con.colorBlight,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: 0.4,
                            backgroundColor: con.colorBlight,
                            color: con.brightGreen,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    //visualizer cosa
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: con.colorBox,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          //arbol
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10,
                            runSpacing: 10,
                          ),

                          SizedBox(height: 15),

                          //cntorles animacion
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.replay, color: Colors.white),
                              SizedBox(width: 10),

                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Play Animation",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: con.colorBot,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
