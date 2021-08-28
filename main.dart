import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CountDownController _controller = CountDownController();
  int _duration = 1200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eye Check'),
        centerTitle: true,
      ),
      body: Center(
          child: CircularCountDownTimer(
        duration: _duration,

        initialDuration: 0,

        controller: _controller,

        // Width of the Countdown Widget.
        width: MediaQuery.of(context).size.width / 2,

        // Height of the Countdown Widget.
        height: MediaQuery.of(context).size.height / 2,

        ringColor: Colors.grey[300],

        ringGradient: null,

        fillColor: Colors.purpleAccent[100],

        fillGradient: null,

        backgroundColor: Colors.purple[500],

        strokeWidth: 20.0,

        strokeCap: StrokeCap.round,

        textStyle: TextStyle(
            fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),

        textFormat: CountdownTextFormat.S,
        isReverse: false,

        isReverseAnimation: false,

        isTimerTextShown: true,

        autoStart: true,

        // This Callback will execute when the Countdown Ends.
        onComplete: () {
          _controller.restart(duration: _duration);
          Alert(
            context: context,
            type: AlertType.warning,
            title: "20 Mins are Over!",
            desc: "Its time to look around :-)",
            buttons: [
              DialogButton(
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
                gradient: LinearGradient(
                  colors: [Colors.pink, Colors.purple],
                ),
              )
            ],
          ).show();

          print('Countdown Ended');
        },
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
          ),
          _button("Pause", () => _controller.pause()),
          SizedBox(
            width: 10,
          ),
          _button("Resume", () => _controller.resume()),
          SizedBox(
            width: 10,
          ),
          _button("Restart", () => _controller.restart(duration: _duration))
        ],
      ),
    );
  }

  _button(String title, var onPressed) {
    return Expanded(
        child: Container(
      color: Colors.white,
      child: ElevatedButton(
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPressed,
      ),
    ));
  }
}
