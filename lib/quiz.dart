import 'package:flutter/material.dart';
import 'package:proyecto/library.dart';
import 'package:proyecto/utils/constants.dart' as con;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int selectedAnswer = 0;
  int correctAnswer = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: con.colorBack,

      //appbar
      appBar: AppBar(
        backgroundColor: con.colorCont,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Quiz",
          style: TextStyle(color: Colors.white,),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Library(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => Library(),
                ),
              );
            },
            child: Text(
              "SKIP",
              style: TextStyle(color: con.brightGreen),
            ),
          ),
        ],
      ),
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SORTING ALGORITHMS",
                          style: TextStyle(
                            color: con.colorBot,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                          ),
                        ),

                        Text(
                          "Question 4 of 10",
                          style: TextStyle(
                            color: con.colorBlight,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.4,
                        minHeight: 5,
                        backgroundColor: con.colorBlight,
                        color: con.colorBot,
                      ),
                    ),

                    SizedBox(height: 35),

                    //pregunta texto
                    Text(
                      "What is the worst-case\n"
                          "time complexity of the\n"
                          "QuickSort algorithm?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Consider a standard implementation using\n"
                          "the last element as a pivot on an already\n"
                          "sorted array.",
                      style: TextStyle(
                        color: con.colorBlight,
                        fontSize: 14,
                      ),
                    ),

                    SizedBox(height: 30),

                    //resps
                    answerCard(index: 0, title: "O(n)"),
                    SizedBox(height: 15),

                    answerCard(index: 1, title: "O(n log n)"),
                    SizedBox(height: 15),

                    answerCard(index: 2, title: "O(n^2)"),
                    SizedBox(height: 15),

                    answerCard(index: 3, title: "O(log n)"),
                    SizedBox(height: 30),

                    //boton
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if(selectedAnswer == correctAnswer){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text(
                                      "Correct Answer!",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      "Wrong Answer",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: con.brightGreen,
                              minimumSize: Size(double.infinity, 55),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              "Check Answer",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  //answerCrad
  Widget answerCard({required int index, required String title}) {
    bool isSelected = selectedAnswer == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer = index;
        });
      },

      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: con.colorCont,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isSelected ? con.colorBot : con.colorBlight,
            width: 1.5,
          ),
        ),
        
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  SizedBox(height: 5),
                  
                  Text(
                    "Small description",
                    style: TextStyle(
                      color: con.colorBlight,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? con.colorBot : con.colorBlight,
                  width: 2,
                ),
              ),
              
              child: isSelected ? Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: con.colorBot,
                    shape: BoxShape.circle,
                  ),
                ),
              ) : null,
            ),
          ],
        ),
      ),
    );
  }
}
