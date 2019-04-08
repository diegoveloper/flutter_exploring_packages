import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SamplePercentIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Percent Indicator"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              width: MediaQuery.of(context).size.width / 2,
              lineHeight: 8,
              percent: 0.5,
              animation: true,
              trailing: Text(
                "50%",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
            CircularPercentIndicator(
              radius: 60,
              lineWidth: 8,
              animation: true,
              percent: 0.7,
              center: Text(
                "70%",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
