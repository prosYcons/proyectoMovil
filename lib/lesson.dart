import 'package:flutter/material.dart';
import 'package:proyecto/home.dart';
import 'package:proyecto/rank.dart';
import 'package:proyecto/utils/constants.dart' as con;

class Lesson extends StatefulWidget {
  const Lesson({super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
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
                      child: Image.asset("assets/images/arbol.png"),
                    ),

                    SizedBox(height: 20),

                    //texto de la cosa
                    infoCard(
                      title: "Visualizer: Splitting Phase",
                      content: "The array is recursively divided into two halves until each sub-array contains only one element",
                    ),

                    SizedBox(height: 10),

                    infoCard(
                        title: "Divide and Conquer",
                        content: "Merge Sort is a classic Divide and Conquer algorithm. It breaks down a complex sorting problem into smaller, more manageable sub-problems."
                    ),

                    SizedBox(height: 10),

                    //key concept
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: con.lightGreen,
                        border: Border.all(color: con.brightGreen),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Key Concept: By splitting the list util each sub-list has only one element (which s inherently sorted), we can then 'merge' them back together in a sorted manner.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    SizedBox(height: 20),

                    //code
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: con.colorBox,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "MERGE_SORT.py",
                            style: TextStyle(color: con.colorBlight),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          Image.asset("assets/images/merge.jpg"),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //infoCards
  static Widget infoCard({required String title, required String content}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: con.colorCont,
        borderRadius: BorderRadius.circular(15),
      ),
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
          SizedBox(height: 5),
          Text(
            content,
            style: TextStyle(color: con.colorBlight),
          ),
        ],
      ),
    );
  }
}
