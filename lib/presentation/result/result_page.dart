import 'package:bmi_calculator/domain/model/result_data_model.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  // const ResultPage({Key? key}) : super(key: key);
  final ResultDataModel resultDataModel;
  ResultPage({required this.resultDataModel});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late ResultDataModel _result;

  @override
  void initState() {
    _result = widget.resultDataModel;

    super.initState();
  }

  double calculateBMI(ResultDataModel data) {
    var dataBMI = data.weight / ((data.height / 100) * (data.height / 100));
    return dataBMI;
  }

  List<String> checkStatusBMI(double bmi) {
    List<String> statusAndInfo = List.filled(3, "");
    if (bmi > 40) {
      // masukkan status ke dalam list ke 0
      statusAndInfo[0] = "Obese Class III";
      statusAndInfo[1] = "> 40";
      statusAndInfo[2] = "You have to do some workout";
    } else if (bmi > 33 && bmi <= 40) {
      statusAndInfo[0] = "Obese Class II";
      statusAndInfo[1] = "35 - 40";
      statusAndInfo[2] = "You have to do some workout";
    } else if (bmi > 30 && bmi <= 35) {
      statusAndInfo[0] = "Obese Class I";
      statusAndInfo[1] = "35 - 40";
      statusAndInfo[2] = "You have to do some workout";
    } else if (bmi > 25 && bmi <= 30) {
      statusAndInfo[0] = "Overweight";
      statusAndInfo[2] = "You have to do some workout";
      statusAndInfo[1] = "25 - 40";
    } else if (bmi > 18.5 && bmi <= 25) {
      statusAndInfo[0] = "Normal";
      statusAndInfo[1] = "18.5 - 25";
      statusAndInfo[2] = "You have normal body weight, good job";
    } else if (bmi > 17 && bmi <= 18.5) {
      statusAndInfo[0] = "Mild Thinness";
      statusAndInfo[1] = "17 - 18.5";
      statusAndInfo[2] = "You have to do some workout";
    } else if (bmi > 16 && bmi <= 17) {
      statusAndInfo[0] = "Moderate Thinness";
      statusAndInfo[1] = "16 - 17";
      statusAndInfo[2] = "You have to do some workout";
    } else if (bmi <= 16) {
      statusAndInfo[0] = "Severe Thinness";
      statusAndInfo[1] = "< 16";
      statusAndInfo[2] = "You have to do some workout";
    } else {
      statusAndInfo[0] = "ERROR";
      statusAndInfo[1] = "ERROR";
    }

    return statusAndInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI CALCULATOR"),
        backgroundColor: Color(0xff12163A),
        leading: Container(),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      child: Text(
                        "Your Result",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      margin: EdgeInsets.only(
                          right: 20, left: 20, bottom: 35, top: 10),
                      decoration: BoxDecoration(
                        color: Color(0xff232849),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            checkStatusBMI(calculateBMI(_result))[0],
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            calculateBMI(_result).toStringAsFixed(1),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                checkStatusBMI(calculateBMI(_result))[0] +
                                    " BMI Range :",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                checkStatusBMI(calculateBMI(_result))[1] +
                                    " kg/m2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            checkStatusBMI(calculateBMI(_result))[2],
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            height: 60,
                            child: MaterialButton(
                              elevation: 0,
                              color: Color(0xff08113C),
                              child: Text(
                                "SAVE RESULT",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
            Container(
              width: double.infinity,
              child: MaterialButton(
                splashColor: Colors.pink[200],
                hoverColor: Colors.green,
                minWidth: 150,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.pink,
                child: Text(
                  "RE-CALCULATE YOUR BMI",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                height: 60,
                elevation: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
            )
          ]),
    );
  }
}
