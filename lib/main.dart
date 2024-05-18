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

  //variable to check if the time is paused - it is tru cause in the default it's paused
  bool isPaused = true;

  //when timer is paused we only want to show the continue and paused button not the start button therefore
  bool isStopped = true;

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
        isStopped
            ? ElevatedButton(
                onPressed: () {
                  isPaused = false;
                  isStopped = false;
                  setState(() {}); // notify the UI

                  // create timer + call the method
                  startTimer();
                },

                // we style the button here
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 30)),

                // text inside the button
                child: const Text(
                  "Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // stop timer + call the method
                        stopTimer();
                      },

                      // we style the button here
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30)),

                      // text inside the button
                      child: const Text(
                        "Stop",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        isPaused = !isPaused; // reversing the value of pause
                        setState(() {});
                      },

                      // we style the button here
                      style: ElevatedButton.styleFrom(
                          backgroundColor: isPaused
                              ? Colors.green
                              : Colors.orange, //change colour during pause
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30)),

                      // text inside the button
                      child: Text(
                        isPaused ? "Continue" : "Pause",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                ],
              )
      ],
    );
  }

// the timer method
  void startTimer() {
    // use the timer variable
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // adding the task inside the function

      // creating an if condition - if the value is greater than zero then
      if (currentSecond > 0 && !isPaused) {
        // decrease the current second by one
        currentSecond--;

        //adding a set state so the ui gets notified
        setState(() {});
      }
    });
  }

// stop timer method
  void stopTimer() {
    timer?.cancel(); // setting the timer = null
    isPaused = true;
    isStopped = true;
    // when it's stopped it should reset to 60 again
    currentSecond = 60;
    setState(() {});
  }
}
