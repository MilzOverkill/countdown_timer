import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown Timer',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(
        title: 'Countdown Timer',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //  create a timer variable'

  Timer? timer; // create an action periodically

  // maximum u want the timer to show
  int maxSeconds = 60;

  // variable to show the current second
  int currentSecond = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withBlue(30),
      body: Center(
        // create the method
        child: buildUI(),
      ),
    );
  }

  buildUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentSecond.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 60, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 25,
        ),

        // adding an elevated button to start the timer
        ElevatedButton(
            onPressed: () {
              // create timer + call the method
              startTimer();
            },

            // we style the button here
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30)),

            // text inside the button
            child: const Text(
              "Start",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ))
      ],
    );
  }

// the timer method
  void startTimer() {
    // use the timer variable
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // adding the task inside the function

      // creating an if condition - if the value is greater than zero then 
      if(currentSecond>0){

        // decrease the current second by one
        currentSecond--;

        //adding a set state so the ui gets notified
        setState(() {});
        

      }

      

    });
  }
}
