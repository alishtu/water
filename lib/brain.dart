import 'dart:math';

class Brain {
  Brain({
    required this.height,
    required this.weight,
  });
  final int height;
  final int weight;
  // final int glass;
  double _dn = 0;

  String getDN() {
    _dn = weight / pow(height / 100, 2);
    print(_dn);
    return _dn.toStringAsFixed(1);
  }

  String getResult() {
    if (_dn >= 25) {
      return 'OVERWEIGHT';
    } else if (_dn > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_dn >= 25) {
      return 'You are eating too much! Slow down...Start dieting!';
    } else if (_dn > 18.5) {
      return 'Good Job! You are healthy as one should be!';
    } else {
      return 'Eat more, Enjoy life and gain some weight in the process then comeback!';
    }
  }

  String getWater(int age, weight, height) {
    double number = (9.99*weight+6.25*height-4.92*age);
    int roundedNumber = number.round();


    return 'You drank ' +
        (roundedNumber).toString() +
        'ml' +
        ' water today!';

  }

}
