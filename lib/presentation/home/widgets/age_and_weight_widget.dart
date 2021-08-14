import 'package:flutter/material.dart';

class AgeAndWeightWidget extends StatefulWidget {
  const AgeAndWeightWidget({
    Key? key,
    required this.defaultValue,
    required this.title,
    required this.newValue,
  }) : super(key: key);

  final double defaultValue;
  final String title;
  final ValueChanged<double> newValue;

  @override
  _AgeAndWeightWidgetState createState() => _AgeAndWeightWidgetState();
}

class _AgeAndWeightWidgetState extends State<AgeAndWeightWidget> {
  double value = 0;

  @override
  void initState() {
    value = widget.defaultValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xff232849),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.toStringAsFixed(0),
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    value = value - 1;
                    if (value < 1) {
                      value = 1;
                    }
                    setState(() {});
                    widget.newValue(value);
                  },
                  color: Color(0xff373F74),
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  height: 50,
                  shape: CircleBorder(),
                ),
                MaterialButton(
                  onPressed: () {
                    value = value + 1;
                    if (value < 1) {
                      value = 1;
                    }
                    setState(() {});
                    widget.newValue(value);
                  },
                  color: Color(0xff373F74),
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  height: 50,
                  shape: CircleBorder(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
