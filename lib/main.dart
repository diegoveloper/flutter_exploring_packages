import 'package:exploring_packages/sample_aeyrium_sensor.dart';
import 'package:exploring_packages/sample_keyboard_actions.dart';
import 'package:exploring_packages/sample_percent_indicator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        buttonColor: Colors.blue,
      ),
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  _onButtonPressed(BuildContext context, Widget widget) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exploring Packages"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Percent Indicator"),
              onPressed: () => _onButtonPressed(
                    context,
                    SamplePercentIndicator(),
                  ),
            ),
            RaisedButton(
              child: Text("Keyboard Actions"),
              onPressed: () => _onButtonPressed(
                    context,
                    SampleKeyboardActions(),
                  ),
            ),
            RaisedButton(
              child: Text("Aeyrium Sensor"),
              onPressed: () => _onButtonPressed(
                    context,
                    SampleAeyriumSensor(),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
