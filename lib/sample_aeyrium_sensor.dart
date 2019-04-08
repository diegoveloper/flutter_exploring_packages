import 'dart:async';

import 'package:flutter/material.dart';
import 'package:aeyrium_sensor/aeyrium_sensor.dart';
import 'package:vector_math/vector_math.dart' as math;

class SampleAeyriumSensor extends StatefulWidget {
  @override
  _SampleAeyriumSensorState createState() => _SampleAeyriumSensorState();
}

class _SampleAeyriumSensorState extends State<SampleAeyriumSensor> {
  StreamSubscription<dynamic> _streamSubscriptions;

  double rotation = 0;
  double translation = 0;

  @override
  void initState() {
    _streamSubscriptions = AeyriumSensor.sensorEvents.listen((event) {
      setState(() {
        /* 
        Rotation around the front-to-back axis is called roll.
        Rotation around the side-to-side axis is called pitch.
        */
        rotation = event.roll;
        //multiply by 3 to give more movement
        translation = math.degrees(event.pitch) * 3;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscriptions.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, translation),
      child: Transform.rotate(
        angle: rotation,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Sample Aeyrium Sensor"),
          ),
          body: Center(
            child: Text("DEMO"),
          ),
        ),
      ),
    );
  }
}
