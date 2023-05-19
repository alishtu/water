import 'package:flutter/material.dart';
import 'package:watercontr/brain.dart';
import 'package:watercontr/resultPage.dart';
class WaterControlApp extends StatefulWidget {
  @override
  _WaterControlAppState createState() => _WaterControlAppState();
}

class _WaterControlAppState extends State<WaterControlApp> {
  int consumedWater = 0;
  int water = 2000;
  void incrementWater() {
    setState(() {
      consumedWater += 100; // Increment consumed water by 100ml
    });
  }

  void decrementWater() {
    setState(() {
      if (consumedWater > 0) {
        consumedWater -= 100; // Decrement consumed water by 100ml (minimum value is 0)
      }
    });
  }

  void resetWater() {
    setState(() {
      consumedWater = 0;// Reset consumed water to 0ml
    });
  }

  @override
  Widget build(BuildContext context) {
    double waterPercentage = consumedWater/water;
    bool isGoalAchieved = waterPercentage >= 1.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Water Control'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Consumed Water: $consumedWater ml',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Target Water: $water ml',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            LinearProgressIndicator(
              value: waterPercentage,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                isGoalAchieved ? Colors.green : Colors.blue,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '${(waterPercentage * 100).toStringAsFixed(1)}%',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Add 100ml'),
                  onPressed: incrementWater,
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  child: Text('Remove 100ml'),
                  onPressed: decrementWater,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              child: Text('Reset'),
              onPressed: resetWater,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WaterControlApp(),
  ));
}
