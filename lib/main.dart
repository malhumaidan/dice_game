import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceGame(),
    );
  }
}

class DiceGame extends StatefulWidget {
  const DiceGame({super.key});

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int random1 = 1;
  int random2 = 1;
  String winner = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice game"),
        backgroundColor: Color(0xff1F3638),
      ),
      body: Center(
        child: Container(
          color: Color(0xff82A995),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Player 1",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Image.asset('assets/images/dice${random1}.png'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: 100,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Player 2",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Image.asset('assets/images/dice${random2}.png'),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                '$winner',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff1F3638),
                ),
                onPressed: () {
                  setState(() {
                    random1 = Random().nextInt(6) + 1;
                    random2 = Random().nextInt(6) + 1;

                    winner = random1 > random2
                        ? 'Player 1 is the winner'
                        : random1 == random2
                            ? 'Draw'
                            : 'Player 2 is the winner';
                  });
                },
                child: Text("Throw"),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff1F3638),
        onPressed: () {
          setState(() {
            random1 = Random().nextInt(6) + 1;
            random2 = Random().nextInt(6) + 1;

            if (random1 > random2) {
              winner = 'Player 1 is the winner';
            } else if (random1 < random2) {
              winner = 'Player 2 is the winner';
            } else {
              winner = 'Draw';
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
